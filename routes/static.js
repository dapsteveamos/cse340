// const express = require('express');
// const router = express.Router();

// Static Routes
// Set up "public" folder / subfolders for static files
// router.use(express.static("public"));
// router.use("/css", express.static(__dirname + "/public/css"));
// router.use("/js", express.static(__dirname + "/public/js"));
// router.use("/images", express.static(__dirname + "/public/images"));

// module.exports = router;

// Inventory routes
// I COMMENTED THE LINE BELOW BECAUSE OF THE ERROR, THIS TOOK ME 5 HOURS TO REALISE
// I HAD TO SLEEP AND COME BACK THE NEXT DAY TO CONTINUE--->>

// app.use("/inv", inventoryRoute)


const express = require('express');
const router = express.Router();

// Static Routes
// Set up "public" folder / subfolders for static files
router.use(express.static("public"));
router.use("/css", express.static(__dirname + "public/css"));
router.use("/js", express.static(__dirname + "public/js"));
router.use("/images", express.static(__dirname + "public/images"));

module.exports = router;



