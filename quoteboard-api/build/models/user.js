"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
const bcrypt = require("bcrypt");
const mongoose_1 = require("mongoose");
const userSchema = new mongoose_1.Schema({
    email: String,
    encryptedPassword: String
}, { timestamps: true });
userSchema.virtual("password").set(function (value) {
    this.encryptedPassword = bcrypt.hashSync(value, 10);
});
userSchema.methods.verifyPassword = function (password) {
    return bcrypt.compareSync(password, this.encryptedPassword);
};
exports.User = mongoose_1.model("User", userSchema);
//# sourceMappingURL=user.js.map