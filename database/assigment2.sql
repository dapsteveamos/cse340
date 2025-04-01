-- Insert a new record into the 'account' table
-- The account_id and account_type fields handle their own values automatically
INSERT INTO account (first_name, last_name, email, password)
VALUES ('Tony', 'Stark', 'tony@starkent.com', 'Iam1ronM@n');

-- Update the 'account_type' field for Tony Stark to 'Admin'
UPDATE account
SET account_type = 'Admin'
WHERE email = 'tony@starkent.com';

-- Delete the Tony Stark record from the 'account' table
DELETE FROM account
WHERE email = 'tony@starkent.com';

-- Update the 'description' field in the 'inventory' table
-- Replace 'small interiors' with 'a huge interior' for the GM Hummer
UPDATE inventory
SET description = REPLACE(description, 'small interiors', 'a huge interior')
WHERE make = 'GM' AND model = 'Hummer';

-- Select the 'make' and 'model' from the 'inventory' table
-- Also retrieve the 'classification_name' from the 'classification' table
-- Only return records where the classification is 'Sport'
SELECT inventory.make, inventory.model, classification.classification_name
FROM inventory
INNER JOIN classification ON inventory.classification_id = classification.classification_id
WHERE classification.classification_name = 'Sport';

-- Update all records in the 'inventory' table
-- Modify 'inv_image' and 'inv_thumbnail' fields to include '/vehicles/' in the path
UPDATE inventory
SET inv_image = REPLACE(inv_image, '/images/', '/images/vehicles/'),
    inv_thumbnail = REPLACE(inv_thumbnail, '/images/', '/images/vehicles/');
