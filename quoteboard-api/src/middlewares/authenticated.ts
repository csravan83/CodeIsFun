import { Request, Response } from "express";
import { Unauthorized } from "http-errors";
import { User } from "../models/user";
import { JwtUtil } from "../utils/JwtUtil";

export async function authenticated(req: Request, res: Response, next) {
  const authorization = req.get("Authorization");

  if (!authorization) return next(new Unauthorized("Authorization must be provided"));
  const jwt = authorization.split("JWT ")[1];
  
  try {
    const userId = JwtUtil.decodeUserId(jwt);
    const user = await User.findById(userId);
    req.user = user;
    next();
} catch (err) {
  next(new Unauthorized(err.message));
}
}
