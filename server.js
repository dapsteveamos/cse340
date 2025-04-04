const express = require("express");
const expressLayouts = require("express-ejs-layouts");
require("dotenv").config();
const baseController = require("./controllers/baseController");
const utilities = require("./utilities/index");

const app = express();

/**
 * View Engine and Templates
 */
app.set("view engine", "ejs");
app.use(expressLayouts);
app.set("layout", "./layouts/layout");

/* ***********************
 * Routes
 *************************/
app.use(require("./routes/static"));
app.get("/", utilities.handleErrors(baseController.buildHome));
app.use("/inv", require("./routes/inventoryRoute"));
// app.use("/account", require("./routes/accountRoute")); // Uncomment when ready

/* ***********************
 * 404 Route Handler - Must be before error handler
 *************************/
app.use(async (req, res, next) => {
  let nav = await utilities.getNav();
  res.status(404).render("errors/error", {
    title: 404,
    message: "Sorry, we couldn't find that page.",
    nav,
  });
});

/* ***********************
 * Express Error Handler
 *************************/
app.use(async (err, req, res, next) => {
  let nav = await utilities.getNav();
  console.error(`Error at: "${req.originalUrl}": ${err.message}`);
  let message = err.status == 404
    ? err.message
    : "Oh no! There was a crash. Maybe try a different route?";

  res.status(err.status || 500).render("errors/error", {
    title: err.status || "Server Error",
    message,
    nav,
  });
});

/* ***********************
 * Local Server Information
 *************************/
const port = process.env.PORT || 5500;
const host = process.env.HOST || "localhost";

app.listen(port, () => {
  console.log(`App listening on http://${host}:${port}`);
});
