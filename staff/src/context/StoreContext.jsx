import axios from "axios";
import { createContext, useEffect, useState } from "react";
import { BACKEND_URL } from "../../config/constants";
import { useLocation } from "react-router-dom";

export const StoreContext = createContext(null);

const StoreContextProvider = (props) => {

    const location = useLocation();

    const [menu, setMenu] = useState(() => {
        const savedMenu = localStorage.getItem("currentMenu");
        return savedMenu ? savedMenu : "";
    });

    const [table, setTable] = useState(() => {
        const savedTable = localStorage.getItem("currentTable");
        return savedTable ? savedTable : "";
    });

    const [token, setToken] = useState("");
    const [orderId, setOrderId] = useState("");
    const [food_list, setFoodList] = useState([]);
    const [cartItems, setCartItems] = useState({});
    const [availTableList, setAvailTableList] = useState([]);

    const fetchFoodList = async () => {
        try {
            const response = await axios.get(`${BACKEND_URL}/api/product/listavailable`);
            if (response.status === 200) {
                setFoodList(response.data.products);
            }
        }
        catch (error) {
            if (error.response) {
                console.error("(FetchFoodList-StoreContext) " + error.response.data.message);
            }
            else {
                console.error("(FetchFoodList-StoreContext) Server error");
            }
        }

    }

    const loadCartData = async (token) => {
        try {
            const response = await axios.post(`${BACKEND_URL}/api/cart/get`, {}, { headers: { token } });
            if (response.status === 200) {
                setCartItems(response.data.cartData);
                // console.log(response.data.cartData)
                return response.data.cartData;
            }
        }
        catch (error) {
            if (error.response) {
                console.error("(LoadCartData-StoreContext) " + error.response.data.message);
            }
            else {
                console.error("(LoadCartData-StoreContext) Server error")
            }
        }
        return {};
    }

    const addToCart = async (product_id) => {
        if (!cartItems[product_id]) {
            setCartItems((prev) => ({ ...prev, [product_id]: 1 }));
        }
        else {
            setCartItems((prev) => ({ ...prev, [product_id]: prev[product_id] + 1 }));
        }
        // if (token) {
        //     try {
        //         await axios.post(`${BACKEND_URL}/api/cart/add`, { product_id }, { headers: { token } });
        //     }
        //     catch (error) {
        //         if (error.response) {
        //             console.error("(AddToCart-StoreContext) " + error.response.data.message);
        //         }
        //         else {
        //             console.error("(AddToCart-StoreContext) Server error")
        //         }
        //     }
        // }
    }

    const removeFromCart = async (product_id) => {
        setCartItems((prev) => ({ ...prev, [product_id]: prev[product_id] - 1 }))
        // if (token) {
        //     try {
        //         await axios.post(`${BACKEND_URL}/api/cart/remove`, { product_id }, { headers: { token } });
        //     }
        //     catch (error) {
        //         if (error.response) {
        //             console.error("(RemoveFromCart-Storecontext) " + error.response.data.message);
        //         }
        //         else {
        //             console.error("(RemoveFromCart-Storecontext) Server Error");
        //         }
        //     }
        // }
    }

    const getCartTotalAmount = () => {
        let totalAmount = 0;
        for (const item in cartItems) {
            if (cartItems[item] > 0) {
                let itemInfo = food_list.find((product) => product.product_id === Number(item));

                if (itemInfo) {
                    totalAmount += itemInfo.price * cartItems[item];
                }
            }
        }
        return totalAmount;
    }

    const fetchAvailableTable = async (token) => {
        try {
            const response = await axios.post(`${BACKEND_URL}/api/inhouseorder/getTable`, {}, {headers: {token}});

            if (response.status === 200) {
                setAvailTableList(response.data.tables);
                // console.log(response.data.tables);
            }
        }
        catch (error) {
            error.response ? console.error(error.response.data.message) : console.error("Server error");
        }
    }


    useEffect(() => {
        async function loadData() {
            await fetchFoodList();
            if (localStorage.getItem("token")) {
                if (localStorage.getItem("orderId")) {
                    setOrderId(localStorage.getItem("orderId"));
                }
                setToken(localStorage.getItem("token"));
                await fetchAvailableTable(localStorage.getItem("token"))
            }
        }
        loadData();

        // const intervalId = setInterval(async () => {
        //     if (token) {
        //         // await fetchOrders(localStorage.getItem("token"));
        //     }
            
        // }, 10000);

        // return () => clearInterval(intervalId);
    }, [])


    useEffect(() => {
        localStorage.setItem("currentMenu", menu);
    }, [menu]);

    useEffect(() => {
        const path = location.pathname;
        let newMenu = "";

        if (path === '/menu') {
            newMenu = "Menu";
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
        token, 
        setToken,
        
        fetchFoodList,
        food_list,

        loadCartData,
        cartItems,
        setCartItems,
        addToCart,
        removeFromCart,
        getCartTotalAmount,

        availTableList,
        
        orderId,
        setOrderId
    }

    return (
        <StoreContext.Provider value={contextValue}>
            {props.children}
        </StoreContext.Provider>
    )
}

export default StoreContextProvider