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
const http_errors_1 = require("http-errors");
const user_1 = require("../models/user");
const JwtUtil_1 = require("../utils/JwtUtil");
function authenticated(req, res, next) {
    return __awaiter(this, void 0, void 0, function* () {
        const authorization = req.get("Authorization");
        if (!authorization)
            return next(new http_errors_1.Unauthorized("Authorization must be provided"));
        const jwt = authorization.split("JWT ")[1];
        try {
            const userId = JwtUtil_1.JwtUtil.decodeUserId(jwt);
            const user = yield user_1.User.findById(userId);
            req.user = user;
            next();
        }
        catch (err) {
            next(new http_errors_1.Unauthorized(err.message));
        }
    });
}
exports.authenticated = authenticated;
//# sourceMappingURL=authenticated.js.map