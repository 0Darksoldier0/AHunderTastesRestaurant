
const checkAccountType = (req, res, next) => {
    const {type} = req.user;
    console.log(type);
    if (type == process.env.ADMIN_PRIVILEGE_ACCOUNT) {
        next();
    }
    else {
        return res.sendStatus(404);
    }
}

export {checkAccountType};