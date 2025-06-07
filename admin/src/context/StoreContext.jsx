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

    const fetchFoodList = async (token) => {
        try {
            // console.log("Fetching foodlist...")
            const response = await axios.post(`${BACKEND_URL}/api/product/listall`, {}, { headers: { token } });

            if (response.status == 200) {
                // console.log("Foodlist fetched successfully");
                setFoodList(response.data.products);
            }
        }
        catch (error) {
            console.error("Error listing products:", error.response ? error.response.data : error.message);
            toast.error(error.response ? error.response.data.message : "An error occurred while listing the products");

        }
    }

    // useEffect(() => {
    //     console.log(foodList)
    // }, [foodList])

    useEffect(() => {
        async function loadData() {
            if (localStorage.getItem("token")) {
                setToken(localStorage.getItem("token"));
                await fetchFoodList(localStorage.getItem("token"));
            }
            // setMenu(); // very important to maintain correct display behavior of Navbar :))) 
        }
        loadData();
    }, [])

    useEffect(() => {
        localStorage.setItem("currentMenu", menu);
    }, [menu]);

    useEffect(() => {
        const path = location.pathname;
        let newMenu = "Dashboard"; // Default menu item

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
            // If on sign-in page, you might want to clear or set a specific menu
            newMenu = ""; // Or any other appropriate value
        }

        // Only update if the newMenu is different from the current menu state
        if (newMenu !== menu) {
            setMenu(newMenu);
        }
    }, [location.pathname]);

    const contextValue = {
        menu,
        setMenu,
        foodList,
        token,
        setToken,
        fetchFoodList
    }

    return (
        <StoreContext.Provider value={contextValue}>
            {props.children}
        </StoreContext.Provider>
    )
}

export default StoreContextProvider