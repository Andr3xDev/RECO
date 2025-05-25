CREATE TABLE Countries (
    country_id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL
);

CREATE TABLE Cities (
    city_id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    country_id INT,
    FOREIGN KEY (country_id) REFERENCES Countries(country_id)
);

CREATE TABLE TouristSites (
    site_id INT PRIMARY KEY,
    name VARCHAR(200) NOT NULL,
    description TEXT,
    city_id INT,
    rating DECIMAL(3, 1),
    visited BOOLEAN,
    FOREIGN KEY (city_id) REFERENCES Cities(city_id)
);





INSERT INTO Countries (country_id, name) VALUES (1, 'Colombia');

INSERT INTO Cities (city_id, name, country_id) VALUES
    (1, 'Bogotá', 1),
    (2, 'Cartagena', 1),
    (3, 'Medellín', 1);

INSERT INTO TouristSites (site_id, name, description, city_id, rating, visited) VALUES
    (1, 'Monserrate', 'Iconic mountain with a church, offering panoramic views of Bogotá.', 1, 4.7, FALSE),
    (2, 'Gold Museum', 'Museum showcasing pre-Hispanic gold artifacts.', 1, 4.5, FALSE);

INSERT INTO TouristSites (site_id, name, description, city_id, rating, visited) VALUES
    (3, 'Historic Center', 'Walled city with colonial architecture and cobblestone streets.', 2, 4.8, TRUE),
    (4, 'Rosario Islands', 'Archipelago with clear waters and coral reefs, ideal for snorkeling.', 2, 4.6, FALSE);

INSERT INTO TouristSites (site_id, name, description, city_id, rating, visited) VALUES
    (5, 'Comuna 13', 'Vibrant neighborhood known for its street art and transformation.', 3, 4.5, FALSE),
    (6, 'Botanical Garden', 'Beautiful garden with a variety of tropical plants and orchids.', 3, 4.7, TRUE);
