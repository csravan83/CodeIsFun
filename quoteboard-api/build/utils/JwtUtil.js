"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
const jwt = require("jsonwebtoken");
class JwtUtil {
    static generateToken(user) {
        return jwt.sign({ id: user.id }, "1234", { expiresIn: "3d" });
    }
    static decodeUserId(token) {
        const decoded = jwt.verify(token, "1234");
        return decoded.id;
    }
}
exports.JwtUtil = JwtUtil;
//# sourceMappingURL=JwtUtil.js.map