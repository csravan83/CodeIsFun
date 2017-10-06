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
const express = require("express");
const passport = require("passport");
const user_1 = require("../models/user");
const JwtUtil_1 = require("../utils/JwtUtil");
exports.router = express.Router();
exports.router.post("/sign_up", (req, res, next) => __awaiter(this, void 0, void 0, function* () {
    const email = req.body.email;
    const password = req.body.password;
    const passwordConfirmation = req.body.passwordConfirmation;
    if (!email) {
        const err = new Error("Email must be supplied");
        err["status"] = 400;
        return next(err);
    }
    else if (!password || !passwordConfirmation) {
        const err = new Error("Password and password confirmation must be provided");
        err["status"] = 400;
        return next(err);
    }
    if (password !== passwordConfirmation) {
        const err = new Error("Password confirmation must match");
        err["status"] = 400;
        return next(err);
    }
    const user = yield user_1.User.create({ email, password });
    res.json({ user });
}));
exports.router.post("/sign_in", passport.authenticate("local"), (req, res, next) => {
    const user = req.user;
    try {
        const jwt = JwtUtil_1.JwtUtil.generateToken(user);
        res.json({ jwt });
    }
    catch (err) {
        next(err);
    }
});
//# sourceMappingURL=auth.js.map