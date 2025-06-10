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

    const fetchFoodList = async (token) => {
        try {
            const response = await axios.post(`${BACKEND_URL}/api/product/listall`, {}, { headers: { token } });

            if (response.status == 200) {
                setFoodList(response.data.products);
            }
        }
        catch (error) {
            console.error("Error listing products:", error.response ? error.response.data : error.message);
            toast.error(error.response ? error.response.data.message : "An error occurred while listing the products");
        }
    }

    const fetchOrders = async (token) => {
        try {
            const response = await axios.post(`${BACKEND_URL}/api/order/list`, {}, { headers: { token } });
            if (response.status === 200) {
                setOrdersData(response.data.orders);
                console.log(response.data.orders);
            }
        }
        catch (error) {
            if (error.response) {
                console.error("(FetchOrders): " + error.response.data.message);
            }
            else {
                console.error("Server error, please try again later");
                toast.error("Error fetching orders")
            }
        }
    }

    useEffect(() => {
        async function loadData() {
            if (localStorage.getItem("token")) {
                setToken(localStorage.getItem("token"));
                await fetchFoodList(localStorage.getItem("token"));
                await fetchOrders(localStorage.getItem("token"))
                console.log("run");
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
        else if (path === '/signIn') {
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
        fetchOrders
    }

    return (
        <StoreContext.Provider value={contextValue}>
            {props.children}
        </StoreContext.Provider>
    )
}

export default StoreContextProvider