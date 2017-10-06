import * as bcrypt from "bcrypt";
import { model, Document, Schema, SchemaTypes } from "mongoose";


export interface UserDocument extends Document{
  id: string;
  email: string;
  encryptedPassword: string;
  createdAt: Date;
  updatedAt: Date;
  verifyPassword(password: string): boolean;
}

const userSchema = new Schema({
  email: String ,
  encryptedPassword: String
}, { timestamps: true });

userSchema.virtual("password").set(function(value) {
  this.encryptedPassword = bcrypt.hashSync(value, 10);
});

userSchema.methods.verifyPassword = function(password: string): boolean {
  return bcrypt.compareSync(password, this.encryptedPassword);
};

export const User = model<UserDocument>("User",userSchema);
