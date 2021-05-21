const User = require('./models/user');
module.exports.isLoggedIn = (req, res, next) => {
    if (!req.isAuthenticated()) {
        req.session.returnTo = req.originalUrl
            //req.flash('error', 'You must be signed in first!');
        return res.json({ message: 'you must be loggedIn first' });
    }
    next();
}