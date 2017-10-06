import * as express from "express";
import { Quotation, QuotationDocument } from "../models/quotation";
import { authenticated } from "../middlewares/authenticated";

export const router = express.Router();
router.get("/", (req, res, next) => {
  Quotation.find((err, quotations: QuotationDocument[]) => {
    if (err) return next(err);
    res.json(quotations);
  });
});
router.get("/:id", (req, res, next) => {
  Quotation.findById(req.params.id, (err, quotation: QuotationDocument) => {
    if (err) return next(err);
    res.json(quotation);
  })
});

router.post("/", authenticated, (req, res, next) => {
  const quote = req.body.quote;
  if (!quote) return next(new Error("Quote cant be null"))
  Quotation.create({ quote }, (err, quotation: QuotationDocument) => {
    if (err) return next(err);
    res.json(quotation);
  });
});
