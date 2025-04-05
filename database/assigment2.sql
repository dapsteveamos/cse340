-- Create the 'account' table
CREATE TABLE account (
    account_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    password VARCHAR(100) NOT NULL,
    account_type VARCHAR(20) DEFAULT 'User'
);

-- Create the 'classification' table
CREATE TABLE classification (
    classification_id SERIAL PRIMARY KEY,
    classification_name VARCHAR(50) UNIQUE NOT NULL
);

-- Create the 'inventory' table
CREATE TABLE inventory (
    inventory_id SERIAL PRIMARY KEY,
    make VARCHAR(50) NOT NULL,
    model VARCHAR(50) NOT NULL,
    classification_id INT REFERENCES classification(classification_id),
    description TEXT,
    inv_image VARCHAR(255),
    inv_thumbnail VARCHAR(255)
);





-- Insert classifications 002 
INSERT INTO classification (classification_name) VALUES ('Sport'), ('SUV'), ('Sedan');

-- Insert inventory data
INSERT INTO inventory (make, model, classification_id, description, inv_image, inv_thumbnail)
VALUES
  ('Toyota', 'Mustang', 3, 'A turbo fast and powerful car', '/images/monster-truck-tn.jpg', '/images/thumb_mustang.jpg');
('GM', 'Hummer', 2, 'small interiors, powerful engine', '/images/hummer.jpg', '/images/thumb_hummer.jpg'),
('Ford', 'Mustang', 1, 'A fast and powerful sports car', '/images/mustang.jpg', '/images/thumb_mustang.jpg');



-- Insert a new record into the 'account' table 003
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




-- MORE UPDATE 
-- Update inventory data for 'Toyota' 'Mustang'
UPDATE inventory
SET description = 'A turbo fast and powerful car',
    inv_image = '/images/vehicles/adventador.jpg',
    inv_thumbnail = '/images/vehicles/adventador-tn.jpg'
WHERE make = 'Toyota' AND model = 'Mustang';

-- Update inventory data for 'GM' 'Hummer'
UPDATE inventory
SET description = 'Small interiors, powerful engine',
    inv_image = '/images/vehicles/hummer.jpg',
    inv_thumbnail = '/images/vehicles/hummer-tn.jpg'
WHERE make = 'GM' AND model = 'Hummer';

-- Update inventory data for 'Ford' 'Mustang'
UPDATE inventory
SET description = 'A fast and powerful sports car',
    inv_image = '/images/vehicles/camaro.jpg',
    inv_thumbnail = '/images/vehicles/camaro-tn.jpg'
WHERE make = 'Ford' AND model = 'Mustang';
