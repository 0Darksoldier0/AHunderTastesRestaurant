import axios from "axios";
import { createContext, useEffect, useState } from "react";
import { BACKEND_URL } from "../../config/constants";
import { toast } from "react-toastify";
import { useLocation } from "react-router-dom";

export const StoreContext = createContext(null);

const StoreContextProvider = (props) => {

    const location = useLocation();

    const [menu, setMenu] = useState(() => {
        const savedMenu = localStorage.getItem("currentMenu");
        return savedMenu ? savedMenu : "Manage Menu";
    });

    const [token, setToken] = useState("");
    const [foodList, setFoodList] = useState([]);
    const [ordersData, setOrdersData] = useState([]);
    
    // Data visulization
    const [priceData, setPriceData] = useState([]);

    const fetchFoodList = async (token) => {
        try {
            const response = await axios.post(`${BACKEND_URL}/api/product/listall`, {}, { headers: { token } });

            if (response.status == 200) {
                setFoodList(response.data.products);
            }
        }
        catch (error) {
            if (error.response) {
                console.error("(FetchFoodList-StoreContext) ", error.response.data.message);
            }
            else {
                console.error("(FetchFoodList) Server error")
            }
            
        }
    }

    const fetchOrders = async (token) => {
        try {
            const response = await axios.post(`${BACKEND_URL}/api/order/list`, {}, { headers: { token } });
            if (response.status === 200) {
                setOrdersData(response.data.orders);
                // console.log(response.data.orders);
            }
        }
        catch (error) {
            if (error.response) {
                console.error("(FetchOrders) " + error.response.data.message);
            }
            else {
                console.error("(FetchOrders) Server error");
            }
        }
    }

    const fetchProductPrice = async (token) => {
        try {
            const response = await axios.post(`${BACKEND_URL}/api/product/getprice`, {}, {headers: {token}})
            if (response.status === 200) {
                setPriceData(response.data.data);
                console.log(response.data.data);
            }
        }
        catch (error) {
            if (error.response) {
                console.error("(FetchProductPrice) ", error.response.data.message)
            }
            else {
                console.error("(FetchProductPrice) Server error")
            }
        }
    }

    useEffect(() => {
        async function loadData() {
            if (localStorage.getItem("token")) {
                setToken(localStorage.getItem("token"));
                await fetchFoodList(localStorage.getItem("token"));
                await fetchOrders(localStorage.getItem("token"))
                await fetchProductPrice(localStorage.getItem("token"))
            }
        }
        loadData();
    }, [])

    useEffect(() => {
        localStorage.setItem("currentMenu", menu);
    }, [menu]);

    useEffect(() => {
        const path = location.pathname;
        let newMenu = "Dashboard";

        if (path === '/') {
            newMenu = "Dashboard";
        }
        else if (path === '/menuManagement' || path === "/menuManagement/addProduct") {
            newMenu = "Manage Menu";
        }
        else if (path === '/ordersManagement') {
            newMenu = "Manage Orders";
        }
        else if (path === '/onlineOrdersManagement') {
            newMenu = "Manage Online Orders";
        }
        else {
            newMenu = "";
        }

        if (newMenu !== menu) {
            setMenu(newMenu);
        }
    }, [location.pathname]);

    const contextValue = {
        menu,
        setMenu,
        token,
        setToken,
        foodList,
        fetchFoodList,
        ordersData,
        fetchOrders,

        priceData,
        fetchProductPrice
    }

    return (
        <StoreContext.Provider value={contextValue}>
            {props.children}
        </StoreContext.Provider>
    )
}

export default StoreContextProvider