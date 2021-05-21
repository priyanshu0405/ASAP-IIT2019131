if (process.env.NODE_ENV !== "production") {
    require('dotenv').config();
}
const express = require('express');
const mongoose = require('mongoose');
const User = require('./models/user');
const Patient = require('./models/patient');
const passport = require('passport');
const LocalStrategy = require('passport-local');
const bodyParser = require('body-parser');
const session = require('express-session');
const { isLoggedIn } = require('./middleware');
const dbUrl = process.env.DB_URL;
const sender_mail = process.env.SENDER_MAIL;
const sgMail = require("@sendgrid/mail");
//const user = require('../Emedgency - FIX/models/user');
mongoose.connect(dbUrl, {
    useNewUrlParser: true,
    useCreateIndex: true,
    useUnifiedTopology: true
});

const db = mongoose.connection;
db.on("error", console.error.bind(console, "connection error:"));
db.once("open", () => {
    console.log("Database connected");
});

const app = express();
app.use(bodyParser.urlencoded({ extended: false }))

// parse application/json
app.use(bodyParser.json())

const sessionConfig = {
    secret: 'thisshouldbeabettersecret!',
    resave: false,
    saveUninitialized: true,
    cookie: {
        httpOnly: true,
        expires: Date.now() + 1000 * 60 * 60 * 24 * 7,
        maxAge: 1000 * 60 * 60 * 24 * 7
    }
}
app.use(session(sessionConfig));

app.use(passport.initialize());
app.use(passport.session());
passport.use(new LocalStrategy(User.authenticate()));

passport.serializeUser(User.serializeUser());
passport.deserializeUser(User.deserializeUser());



app.use((req, res, next) => {
    console.log(req.session)
    res.locals.currentUser = req.user;
    next();
});
var regdoc, receiver_mail;
const seedDB = async() => {
    regdoc = await User.findOne({ role: "doctor" });
    //console.log(doc);
    if (!regdoc) {
        const doct = new User({
            email: "iit2019131@iiita.ac.in",
            name: "Doctor",
            username: "Doctor",
            role: "doctor",
            gender: "M",
            dob: "24/08/1990",
            address: "India",
            phone: "9898989898",

        });
        const password = "doctor";
        regdoc = await User.register(doct, password);
        console.log("doctor record created");
        console.log(regdoc);
    }
    receiver_mail = regdoc.email;
    //console.log(receiver_mail);
}
seedDB();

app.post('/patient/register', async(req, res, next) => {
    console.log(req.body);
    try {
        const { username, role, name, email, gender, password, dob, address, phone, history } = req.body;
        // var history = [];
        // await history.push(histor);
        // console.log(history);
        const p = new User({ email, role, name, gender, username, dob, address, phone, history });
        const reguser1 = await User.register(p, password);
        req.login(reguser1, async(err) => {
            if (err) return next(err);
            const founduser = await User.findById(req.user._id);
            var message = "";
            if (founduser.history.length != 0) {
                // console.log(history[0]);
                const { bp, heartrate, fever, sugarlevel, oxylvl } = founduser.history[0];
                // console.log(bp);
                if (Number(bp.substring(0, bp.indexOf('/'))) > 120 || Number(bp.substring(bp.indexOf('/') + 1)) > 80) {
                    message += "high bp, ";
                } else if (Number(bp.substring(0, bp.indexOf('/'))) < 110 || Number(bp.substring(bp.indexOf('/') + 1)) < 80) {
                    message += "low bp, ";
                }
                if (heartrate > 100) {
                    message += "high heartrate, ";
                } else if (heartrate < 85) {
                    message += "Low heartrate, ";
                }
                if (fever > 100) {
                    message += "high body temperature, ";
                } else if (fever < 95) {
                    message += "Low body temperature, ";
                }
                if (sugarlevel > 140) {
                    message += "high sugar, ";
                } else if (sugarlevel < 70) {
                    message += "Low sugar, ";
                }
                if (oxylvl > 100) {
                    message += "high oxygen level, ";
                } else if (oxylvl < 85) {
                    message += "Low oxygen level, ";
                }
                message = message.slice(0, -2);
                founduser.history[0].message = message;
                await founduser.save();
                if (message.length > 0) {
                    var pat;
                    const patient = await Patient.findOne({ patients: founduser._id });
                    //console.log(patient);
                    if (!patient) {
                        pat = new Patient({ patients: founduser._id, email: founduser.email, username: founduser.username });
                        await pat.save();
                    }
                    const output = `
        <h1>Patient Info</h1>
        <ul>
         <li>Name: ${req.user.name}</li>
         <li>Email: ${req.user.email}</li>
         <li>Phone: ${req.user.phone}</li>
         <li>DOB: ${req.user.dob}</li>
         <li>GENDER: ${req.user.gender}</li>
        </ul>

        <p>Values of the parameters</p>
        <ul>
         <li>Blood Pressure: ${bp}</li>
         <li>Heart Rate: ${heartrate}</li>
         <li>Body Temprature: ${fever}</li>
         <li>Sugar Level: ${sugarlevel}</li>
         <li>Oxygen Level: ${oxylvl}</li>
        </ul>
        <p1>Problems: ${message}</p1>
        <h2>Please login to the EMEDGENCY app and prescribe accordingly</h2>
    `;
                    sgMail.setApiKey(process.env.API_KEY_SENDGRID);
                    const msg = {
                        to: receiver_mail,
                        from: sender_mail,
                        subject: "ALERT",
                        html: output
                    }
                    sgMail.send(msg, function(err, info) {
                        if (err) {
                            console.log("Email not send");
                        } else {
                            console.log("Email sent");
                        }
                    })
                }
            }
            res.json({ message, founduser });
        })
    } catch (e) {
        console.log(e)
        res.status(500).send("Error.")
    }

})

app.post('/patient/login', passport.authenticate('local'), (req, res, next) => {
    //console.log(req.user);
    res.json(req.user);
})

app.get('/patient/logout', (req, res) => {
    req.logout();
    res.json({ message: 'LOGGED OUT!' });
})


// app.post('/doctor/register', async(req, res, next) => {
//     console.log(req.body);
//     try {
//         const { username, role, email, name, password, gender, dob, address, phone } = req.body;
//         const d = new User({ email, name, role, username, gender, dob, address, phone });
//         const reguser2 = await User.register(d, password);
//         req.login(reguser2, err => {
//             if (err) return next(err);
//             res.json(reguser2);
//         })
//     } catch (e) {
//         console.log(e)
//         res.status(500).send("Error.")
//     }
// })

app.post('/doctor/login', passport.authenticate('local'), (req, res, next) => {
    res.json(req.user);
})

app.get('/doctor/logout', (req, res) => {
    req.logout();
    res.json({ message: 'LOGGED OUT!' });
})
app.get('/patient/:id', async(req, res) => {
    //console.log(req.params.id);
    const { id } = req.params;
    const user = await User.findById(id);
    const message = user.history[(user.history.length) - 1].message;
    res.json({ message, user });
})
app.post('/patient/:id/updateparams', async(req, res) => {
    const { id } = req.params;

    //console.log(req.body);
    const founduser = await User.findById(id);

    // await founduser.save();
    const { bp, heartrate, fever, sugarlevel, oxylvl } = req.body;
    var message = "";

    if (Number(bp.substring(0, bp.indexOf('/'))) > 120 || Number(bp.substring(bp.indexOf('/') + 1)) > 80) {
        message += "high bp, ";
    } else if (Number(bp.substring(0, bp.indexOf('/'))) < 110 || Number(bp.substring(bp.indexOf('/') + 1)) < 80) {
        message += "low bp, ";
    }
    if (heartrate > 100) {
        message += "high heartrate, ";
    } else if (heartrate < 85) {
        message += "Low heartrate, ";
    }
    if (fever > 100) {
        message += "high body temperature, ";
    } else if (fever < 95) {
        message += "Low body temperature, ";
    }
    if (sugarlevel > 140) {
        message += "high sugar, ";
    } else if (sugarlevel < 70) {
        message += "Low sugar, ";
    }
    if (oxylvl > 100) {
        message += "high oxygen level, ";
    } else if (oxylvl < 85) {
        message += "Low oxygen level, ";
    }
    message = message.slice(0, -2);
    founduser.history.push({ bp, heartrate, fever, sugarlevel, oxylvl, message });
    //console.log(founduser);
    await founduser.save();
    if (message.length > 0) {
        var pat;
        const patient = await Patient.findOne({ patients: id });
        console.log(patient);
        if (!patient) {
            pat = new Patient({ patients: founduser._id, email: founduser.email, username: founduser.username });
            await pat.save();
        }
    }

    if (message.length > 0) {
        const output = `
        <h1>Patient Info</h1>
        <ul>
         <li>Name: ${founduser.name}</li>
         <li>Email: ${founduser.email}</li>
         <li>Phone: ${founduser.phone}</li>
         <li>DOB: ${founduser.dob}</li>
        </ul>

        <p>Values of the parameters</p>
        <ul>
         <li>Blood Pressure: ${bp}</li>
         <li>Heart Rate: ${heartrate}</li>
         <li>Body Temprature: ${fever}</li>
         <li>Sugar Level: ${sugarlevel}</li>
         <li>Oxygen Level: ${oxylvl}</li>
        </ul>
        <p1>Problems: ${message}</p1>
        <h2>Please login to the EMEDGENCY app and prescribe accordingly</h2>
    `;
        sgMail.setApiKey(process.env.API_KEY_SENDGRID);
        const msg = {
            to: receiver_mail,
            from: sender_mail,
            subject: "ALERT",
            html: output
        }
        sgMail.send(msg, function(err, info) {
            if (err) {
                console.log("Email not send");
            } else {
                console.log("Email sent");
            }
        })
    }
    res.json({ message, founduser });
});
app.post('/patient/:id/emergency', async(req, res) => {
    const { id } = req.params;
    const user = await User.findById(id);
    const message = `An Ambulance is sent to your Address: ${user.address}`;
    const output = `
        <h1>Patient Info</h1>
        <ul>
         <li>Name: ${user.username}</li>
         <li>Email: ${user.email}</li>
         <li>Phone: ${user.phone}</li>
         <li>DOB: ${user.dob}</li>
         <li>Address: ${user.address}</li>
        </ul>
        <h2>Please send An Ambulance to the above mentioned Address</h2>
    `;
    sgMail.setApiKey(process.env.API_KEY_SENDGRID);
    const msg = {
        to: receiver_mail,
        from: sender_mail,
        subject: "ALERT , A patient is in Emergency",
        html: output
    }
    sgMail.send(msg, function(err, info) {
        if (err) {
            console.log("Email not send");
        } else {
            console.log("Email sent");
        }
    })
    res.json(message);

});
const isDoctor = async(req, res, next) => {
    // const { id } = req.params;
    // const doc = await User.findById(id);
    if (!req.isAuthenticated()) {
        req.session.returnTo = req.originalUrl
            //req.flash('error', 'You must be signed in first!');
        return res.json({ message: 'you must be loggedIn first' });
    }
    //console.log(regdoc._id);
    //console.log(req.user._id);
    if (!regdoc._id.equals(req.user._id)) {
        // req.flash('error', 'You do not have permission to do that!');
        return res.json({ message: 'You must be logged in as a doctor first' });
    }
    next();
}
app.get('/doctor', async(req, res) => {
    const alluser = await Patient.find().populate('patients');
    res.json(alluser);
})

app.get('/doctor/:id/history', async(req, res) => {
    const { id } = req.params
    const oneuser = await Patient.findOne({ patients: id }).populate('patients');
    console.log(oneuser);
    res.json(oneuser.patients.history);
})

app.post('/doctor/:id/prescribe', async(req, res) => {
    const { prescription } = req.body;
    console.log(prescription);
    const { id } = req.params;
    await Patient.findOneAndDelete({ patients: id });
    const oneuser = await User.findById(id);
    oneuser.prescription = prescription;
    await oneuser.save();
    res.json(oneuser);
})

const port = process.env.PORT || 3000
app.listen(port, () => {
    console.log(`serving on the ${port}`)
})