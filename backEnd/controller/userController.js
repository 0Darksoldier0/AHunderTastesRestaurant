import database from '../config/database.js';
import jwt from 'jsonwebtoken'
import bcrypt from 'bcrypt'

const createToken = (username, type) => {
    return jwt.sign({ username, type }, process.env.ACCESS_TOKEN);
}

// user sign in
const userSignIn = async (req, res) => {
    const { username, password } = req.body;
    const select_query = "SELECT * FROM users WHERE username = ?";
    try {
        const [results] = await database.promise().query(select_query, [username]);
        if (results.length <= 0) {
            console.log("(UserSignIn) Invalid username");
            return res.status(401).json({ message: "Invalid Username or Password" })
        }

        const isPasswordMatch = await bcrypt.compare(password, results[0].password);
        if (!isPasswordMatch) {
            console.log("(UserSignIn) Invalid password");
            return res.status(401).json({ message: "Invalid Username or Password" });
        }

        const token = createToken(results[0].username, results[0].type);
        return res.status(200).json({ token });
    }
    catch (error) {
        console.error("(UserSignIn) Error signing in user: ", error);
        return res.status(500).json({ message: "Error logging in user" });
    }
}

// user sign up
const userSignUp = async (req, res) => {
    const { username, first_name, last_name, password, retype_password } = req.body;
    const USER_TYPE = 0;
    const select_query = "SELECT * FROM users where username = ?";
    const insert_query = "INSERT INTO users(username, first_name, last_name, password, type) VALUES(?, ?, ?, ?, ?)";
    try {

        const [results] = await database.promise().query(select_query, [username])

        if (results.length > 0) {
            console.log("(UserSignUp) Username has already existed");
            return res.status(409).json({ message: "Username has already existed" })
        }

        if (password !== retype_password) {
            console.log("(UserSignUp) Password does not match");
            return res.status(406).json({ message: "Pasword does not match" });
        }

        if (password.length < 8) {
            console.log("(UserSignUp) Password is too short");
            return res.status(406).json({ message: "Password is too short" });
        }


        // hashing user password
        const salt = await bcrypt.genSalt(10);
        const encryptedPassword = await bcrypt.hash(password, salt);

        await database.promise().query(insert_query, [username, first_name, last_name, encryptedPassword, USER_TYPE]);
        return res.status(200).json({ message: "User added" });
    }
    catch (error) {
        console.error("(UserSignUp) Error signing up user: ", error);
        res.status(500).json({ message: error.message });
    }
}

const getUserData = async (req, res) => {
    const { username } = req.user;
    const select_query = "SELECT first_name, last_name FROM users WHERE username = ?";

    try {
        const [results] = await database.promise().query(select_query, [username]);
        return res.status(200).json({ userData: results[0] })
    }
    catch (error) {
        console.error("(GetUserData) Error geting user data: ", error);
        return res.status(500).json({ message: "Unable to fetch user data" });
    }
}

const getUsers = async (req, res) => {
    const { username } = req.user;
    const select_query = "SELECT * FROM users";

    try {
        const [results] = await database.promise().query(select_query, [username]);
        return res.status(200).json({ users: results, message: "Users fetched" });
    }
    catch (error) {
        console.log("(GetUsers) Error fetching users: ", error);
        return res.status(500).json({ message: "Unable to fetch users" });
    }
}

const updateUserFirstName = async (req, res) => {
    const { username } = req.user;
    const { first_name } = req.body;
    const update_query = "UPDATE users SET first_name = ? WHERE username = ?";

    try {
        await database.promise().query(update_query, [first_name, username]);
        return res.status(200).json({ message: "First name updated" });
    }
    catch (error) {
        console.error("(UpdateUserFirstname) Error updating user first name: ", error);
        return res.status(500).json({ message: "Unable to update user firstname" });
    }
}

const updateUserLastName = async (req, res) => {
    const { username } = req.user;
    const { last_name} = req.body;
    const update_query = "UPDATE users SET last_name = ? WHERE username = ?";

    try {
        await database.promise().query(update_query, [last_name, username]);
        return res.status(200).json({ message: "Last name updated" });
    }
    catch (error) {
        console.error("(UpdateUserLastname) Error updating user last name: ", error);
        return res.status(500).json({ message: "Unable to update user last name" });
    }
}

const updateUserPassword = async (req, res) => {
    const { username } = req.user;
    const { old_password, new_password, retype_new_password } = req.body;
    const select_query = "SELECT * FROM users WHERE username = ?";
    const update_query = "UPDATE users SET password = ? WHERE username = ?";

    try {
        const [results] = await database.promise().query(select_query, [username]);

        const isPasswordMatch = await bcrypt.compare(old_password, results[0].password);

        if (!isPasswordMatch) {
            console.log("(UpdateUserPassword) Invalid password");
            return res.status(401).json({ message: "Invalid password" });
        }

        if (new_password !== retype_new_password) {
            console.log("(UpdateUserPassword) New password does not match");
            return res.status(406).json({ message: "New password does not match" })
        }

        if (new_password.length < 8) {
            console.log("(UpdateUserPassword) New password is too short");
            return res.status(406).json({ message: "New password is too short" });
        }

        const salt = await bcrypt.genSalt(10);
        const encryptedPassword = await bcrypt.hash(new_password, salt);

        await database.promise().query(update_query, [encryptedPassword, username]);
        return res.status(200).json({ message: "Password updated" });
    }
    catch (error) {
        console.log("(UpdateUserPassword) Error updating user password: ", error);
        return res.status(500).json({ message: "Error updating user password" });
    }
}

export { userSignIn, userSignUp, getUserData, getUsers, updateUserFirstName, updateUserLastName, updateUserPassword }