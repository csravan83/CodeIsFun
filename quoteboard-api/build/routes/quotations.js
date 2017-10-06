"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
const express = require("express");
const quotation_1 = require("../models/quotation");
const authenticated_1 = require("../middlewares/authenticated");
exports.router = express.Router();
exports.router.get("/", (req, res, next) => {
    quotation_1.Quotation.find((err, quotations) => {
        if (err)
            return next(err);
        res.json(quotations);
    });
});
exports.router.get("/:id", (req, res, next) => {
    quotation_1.Quotation.findById(req.params.id, (err, quotation) => {
        if (err)
            return next(err);
        res.json(quotation);
    });
});
exports.router.post("/", authenticated_1.authenticated, (req, res, next) => {
    const quote = req.body.quote;
    if (!quote)
        return next(new Error("Quote cant be null"));
    quotation_1.Quotation.create({ quote }, (err, quotation) => {
        if (err)
            return next(err);
        res.json(quotation);
    });
});
//# sourceMappingURL=quotations.js.map