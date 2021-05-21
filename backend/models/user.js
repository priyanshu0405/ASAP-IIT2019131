const mongoose = require('mongoose');
const Schema = mongoose.Schema;
const passportLocalMongoose = require('passport-local-mongoose');


const UserSchema = new Schema({
    role: {
        type: String,
        required: true
    },
    name: {
        type: String
    },
    gender: {
        type: String
    },
    email: {
        type: String,
        required: true,
        unique: true
    },
    address: {
        type: String
    },
    phone: {
        type: String
    },
    dob: {
        type: String
    },
    prescription: {
        type: String
    },
    history: [{
        bp: {
            type: String
        },
        heartrate: {
            type: Number,
        },
        fever: {
            type: Number,
        },
        sugarlevel: {
            type: Number,
        },
        oxylvl: {
            type: Number,
        },
        timestamp: {
            type: String,
            default: Date(Date.now)
        },
        message: {
            type: String
        }
    }]
});
UserSchema.methods.validPassword = function(pwd) {
    // EXAMPLE CODE!
    return (this.password === pwd);
};

UserSchema.plugin(passportLocalMongoose);

module.exports = mongoose.model('User', UserSchema);