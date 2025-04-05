// Import the pool object from the database module to make queries
const pool = require("../database/");

/* ***************************
 *  Get all classification data
 * ************************** */
async function getClassifications() {
  try {
    const result = await pool.query("SELECT * FROM public.classification ORDER BY classification_name");
    if (result.rows && result.rows.length === 0) {
      console.log("No classifications found.");
    }
    return result.rows || []; // Ensure we return an empty array if no rows are found
  } catch (error) {
    console.error("Error fetching classifications: ", error);
    return []; // Returning an empty array if an error occurs
  }
}

/* ***************************
 *  Get all inventory items and classification_name by classification_id
 * ************************** */
async function getInventoryByClassificationId(classification_id) {
  try {
    const data = await pool.query(
      `SELECT i.inventory_id, i.make, i.model, i.description, i.inv_image, i.inv_thumbnail, 
              c.classification_name
       FROM public.inventory AS i
       JOIN public.classification AS c
       ON i.classification_id = c.classification_id
       WHERE i.classification_id = $1`,
      [classification_id]
    );

    // Check if data.rows exists and has content
    if (!data || !data.rows || data.rows.length === 0) {
      console.log(`No inventory items found for classification_id ${classification_id}`);
    }

    // Adding a fallback for missing images
    data.rows.forEach(item => {
      if (!item.inv_thumbnail) {
        item.inv_thumbnail = '/path/to/placeholder-thumbnail.jpg'; // Replace with an actual placeholder image path
      }
      if (!item.inv_image) {
        item.inv_image = '/path/to/placeholder-image.jpg'; // Replace with an actual placeholder image path
      }
    });

    return data.rows || []; // Ensure we return an empty array if no rows are found
  } catch (error) {
    console.error("getInventoryByClassificationId error: ", error);
    return []; // Returning an empty array if an error occurs
  }
}

// Export the functions so they can be used in other parts of the application
module.exports = {
  getClassifications,
  getInventoryByClassificationId,
};
