"use strict";
var __awaiter = (this && this.__awaiter) || function (thisArg, _arguments, P, generator) {
    return new (P || (P = Promise))(function (resolve, reject) {
        function fulfilled(value) { try { step(generator.next(value)); } catch (e) { reject(e); } }
        function rejected(value) { try { step(generator["throw"](value)); } catch (e) { reject(e); } }
        function step(result) { result.done ? resolve(result.value) : new P(function (resolve) { resolve(result.value); }).then(fulfilled, rejected); }
        step((generator = generator.apply(thisArg, _arguments || [])).next());
    });
};
Object.defineProperty(exports, "__esModule", { value: true });
require("source-map-support/register");
const index_1 = require("./routes/index");
const quotations_1 = require("./routes/quotations");
const auth_1 = require("./routes/auth");
const user_1 = require("./models/user");
const mongoose = require("mongoose");
const bodyParser = require("body-parser");
const express = require("express");
const passport = require("passport");
const passport_local_1 = require("passport-local");
const app = express();
const port = normalizePort();
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: false }));
app.use(passport.initialize());
app.use("/", index_1.router);
app.use("/quotations", quotations_1.router);
app.use("/auth", auth_1.router);
mongoose.connect("mongodb://localhost/quoteboard", { useMongoClient: true });
mongoose.connection.on("error", err => { throw err; });
mongoose.Promise = Promise;
app.use(passport.initialize());
passport.use("local", new passport_local_1.Strategy({
    usernameField: "email",
    passwordField: "password"
}, (email, password, done) => __awaiter(this, void 0, void 0, function* () {
    let user;
    try {
        user = yield user_1.User.findOne({ email });
    }
    catch (err) {
        return done(err);
    }
    const isVerified = user.verifyPassword(password);
    if (isVerified) {
        done(null, user);
    }
    else {
        done(null, false);
    }
})));
// Error handler
app.use((error, req, res, next) => {
    res.status(error.status || 500);
    res.send({ error: error.message });
});
app.listen(port, () => {
    console.log("Listening on port", port);
});
passport.serializeUser((user, done) => {
    done(null, user.id);
});
passport.deserializeUser((id, done) => __awaiter(this, void 0, void 0, function* () {
    try {
        const user = yield user_1.User.findById(id);
        done(null, user);
    }
    catch (err) {
        done(err);
    }
}));
function normalizePort() {
    const port = parseInt(process.env.PORT) || 3000;
    return port;
}
//# sourceMappingURL=app.js.map