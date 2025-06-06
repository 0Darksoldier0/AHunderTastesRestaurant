import axios from "axios";
import { createContext, useEffect, useState } from "react";
import { BACKEND_URL } from "../../config/constants";
import { toast } from "react-toastify";

export const StoreContext = createContext(null);

const StoreContextProvider = (props) => {

    const [menu, setMenu] = useState(() => {
        const savedMenu = localStorage.getItem("currentMenu");
        return savedMenu ? savedMenu : "Dashboard";
    });

    const [token, setToken] = useState("");
    const [foodList, setFoodList] = useState([]);

    const fetchFoodList = async () => {
        try {
            const response = await axios.post(`${BACKEND_URL}/api/product/listall`, {}, {headers: {token}});

            if (response.status == 200) {
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
            await fetchFoodList();
            if (localStorage.getItem("token")) {
                setToken(localStorage.getItem("token"));
            }
            setMenu(); // very important to maintain correct display behavior of Navbar
        }
        loadData();
    }, [])

    useEffect(() => {
        localStorage.setItem("currentMenu", menu);
    }, [menu]);

    useEffect(() => {
        console.log(menu)
    }, [])

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