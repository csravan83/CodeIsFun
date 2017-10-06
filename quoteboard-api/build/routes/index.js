"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
const express = require("express");
exports.router = express.Router();
exports.router.get("/", (req, res, next) => {
    res.send("Hello world");
});
//# sourceMappingURL=index.js.map