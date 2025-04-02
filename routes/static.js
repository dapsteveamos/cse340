
const express = require("express");
const router = express.Router();
const inventoryRoute = require("./inventoryRoute"); // Ensure this path is correct

// Static Routes
router.use(express.static("public"));
router.use("/css", express.static(__dirname + "/public/css"));
router.use("/js", express.static(__dirname + "/public/js"));
router.use("/images", express.static(__dirname + "/public/images"));

// Inventory Routes
router.use("/inv", inventoryRoute); // Use router, not app

module.exports = router;
