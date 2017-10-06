import * as jwt from "jsonwebtoken";
import { User, UserDocument } from "../models/user";

export class JwtUtil {

  static generateToken(user: UserDocument): string {
    return jwt.sign({ id: user.id }, "1234", { expiresIn: "3d" })
}
  static decodeUserId(token: string): string {

    const decoded: any = jwt.verify(token, "1234");
    return decoded.id;
}
}
