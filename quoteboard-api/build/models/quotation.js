"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
const mongoose_1 = require("mongoose");
const quotationSchema = new mongoose_1.Schema({
    quote: { type: mongoose_1.SchemaTypes.String, require: true }
}, { timestamps: true });
exports.Quotation = mongoose_1.model("Quotation", quotationSchema);
//# sourceMappingURL=quotation.js.map