import * as express from "express";
import * as passport from "passport";

import {User} from "../models/user";
import {JwtUtil} from '../utils/JwtUtil'

export const router = express.Router();

router.post("/sign_up", async (req, res, next) => {
  const email = req.body.email;
  const password = req.body.password;
  const passwordConfirmation = req.body.passwordConfirmation;

if (!email) {
  const err = new Error("Email must be supplied");
  err["status"] = 400;
  return next(err);
} else if (!password || !passwordConfirmation) {
  const err = new Error("Password and password confirmation must be provided");
  err["status"] = 400;
  return next(err);
}

if (password !== passwordConfirmation) {
  const err = new Error("Password confirmation must match");
  err["status"] = 400;
  return next(err);
}
const user = await User.create({ email, password });
  res.json({ user });
});

router.post("/sign_in", passport.authenticate("local"), (req, res, next) => {
  const user = req.user;
  try{
  const jwt = JwtUtil.generateToken(user);
  res.json({ jwt });
} catch(err){
  next(err);
}
});
