import axios from "axios";
import { createContext, useEffect, useState } from "react";
import { BACKEND_URL } from "../../config/constants";
import { useLocation } from "react-router-dom";

export const StoreContext = createContext(null);

const StoreContextProvider = (props) => {

    const location = useLocation();

    const [menu, setMenu] = useState(() => {
        const savedMenu = localStorage.getItem("currentMenu");
        return savedMenu ? savedMenu : "Home";
    });
    const [cartItems, setCartItems] = useState({});
    const [token, setToken] = useState("");
    const [food_list, setFoodList] = useState([]);
    const [userData, setUserData] = useState({});


    const addToCart = async (product_id) => {
        if (!cartItems[product_id]) {
            setCartItems((prev) => ({ ...prev, [product_id]: 1 }));
        }
        else {
            setCartItems((prev) => ({ ...prev, [product_id]: prev[product_id] + 1 }));
        }
        if (token) {
            await axios.post(`${BACKEND_URL}/api/cart/add`, { product_id }, { headers: { token } });
        }
    }

    const removeFromCart = async (product_id) => {
        setCartItems((prev) => ({ ...prev, [product_id]: prev[product_id] - 1 }))
        if (token) {
            await axios.post(`${BACKEND_URL}/api/cart/remove`, { product_id }, { headers: { token } })
        }
    }

    const getCartTotalAmount = () => {
        let totalAmount = 0;
        for (const item in cartItems) {
            if (cartItems[item] > 0) {
                let itemInfo = food_list.find((product) => product.product_id === Number(item));
                totalAmount += itemInfo.price * cartItems[item];
            }
        }
        return totalAmount;
    }

    const fetchFoodList = async () => {
        const response = await axios.get(`${BACKEND_URL}/api/product/listavailable`);
        setFoodList(response.data.products);
    }

    const fetchUserData = async (token) => {
        const response = await axios.post(`${BACKEND_URL}/api/user/get`, {}, { headers: { token } });
        setUserData(response.data.userData);
    }

    const loadCartData = async (token) => {
        const response = await axios.post(`${BACKEND_URL}/api/cart/get`, {}, { headers: { token } });
        setCartItems(response.data.cartData);
    }

    useEffect(() => {
        async function loadData() {
            await fetchFoodList();
            if (localStorage.getItem("token")) {
                setToken(localStorage.getItem("token"));
                await loadCartData(localStorage.getItem("token"));
                await fetchUserData(localStorage.getItem("token"));
            }
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
            newMenu = "Home";
        } else if (path === '/aboutUs') {
            newMenu = "About Us";
        } else if (path === '/menu') {
            newMenu = "Menu";
        } else if (path === '/onlineOrdersManagement') {
            newMenu = "Manage Online Orders";
        }

        // Only update if the newMenu is different from the current menu state
        if (newMenu !== menu) {
            setMenu(newMenu);
        }
    }, [location.pathname]);

    const contextValue = {
        menu,
        setMenu,
        food_list,
        cartItems,
        setCartItems,
        addToCart,
        removeFromCart,
        getCartTotalAmount,
        token,
        setToken,
        loadCartData,
        userData,
        setUserData,
        fetchUserData
    }

    return (
        <StoreContext.Provider value={contextValue}>
            {props.children}
        </StoreContext.Provider>
    )
}

export default StoreContextProvider