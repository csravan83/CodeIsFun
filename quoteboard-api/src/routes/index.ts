import * as express from "express";

export const router = express.Router();

router.get("/", (req, res, next) => {
  res.send("Hello world");
});
