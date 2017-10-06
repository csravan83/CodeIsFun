import "source-map-support/register";
import { router as indexRouter } from "./routes/index";
import { router as quotationsRouter } from "./routes/quotations";
import { router as authRouter } from "./routes/auth";

import {User, UserDocument} from "./models/user";
import * as mongoose from "mongoose";

import * as bodyParser from "body-parser";
import * as express from "express";

import * as passport from "passport";
import {Strategy as LocalStrategy } from "passport-local";

const app = express();
const port = normalizePort();

app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: false }));
app.use(passport.initialize());
app.use("/",indexRouter);
app.use("/quotations", quotationsRouter);
app.use("/auth", authRouter);


mongoose.connect("mongodb://localhost/quoteboard", { useMongoClient: true });
mongoose.connection.on("error", err => { throw err; });
(<any>mongoose).Promise = Promise;

app.use(passport.initialize());
passport.use("local", new LocalStrategy({
  usernameField: "email",
  passwordField: "password"
}, async (email, password, done) => {
  let user: UserDocument
  try {
    user = await User.findOne({ email });
} catch (err) {
  return done(err);
}

const isVerified = user.verifyPassword(password);
if (isVerified) {
  done(null, user);
} else {
  done(null, false);
}
}));

// Error handler
app.use((error, req, res, next) => {
  res.status(error.status || 500);
  res.send({ error: error.message })
});

app.listen(port, () => {
  console.log("Listening on port", port);
});

passport.serializeUser((user: UserDocument, done) => {
  done(null, user.id);
});
passport.deserializeUser(async (id: string, done) => {
  try {
    const user = await User.findById(id);
    done(null, user);
} catch (err) {
  done(err);
}
});

function normalizePort(): number {
  const port = parseInt(process.env.PORT) || 3000;
  return port;
}
