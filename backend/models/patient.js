const mongoose = require('mongoose');
const Schema = mongoose.Schema;


const PatientSchema = new Schema({
    patients: {
        type: Schema.Types.ObjectId,
        ref: 'User'
    },
    username: {
        type: String
    },
    email: {
        type: String
    },
});

module.exports = mongoose.model('Patient', PatientSchema);