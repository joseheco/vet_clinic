/* Database schema to keep the structure of entire database. */

CREATE TABLE animals (
    id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    name TEXT,
    date_of_birth DATE,
    escape_attempts INT,
    neutered BOOLEAN,
    weight_kg DECIMAL
);

AlTER TABLE animals ADD COLUMN species VARCHAR(50);

CREATE TABLE owners (
    id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    full_name VARCHAR(50),
    age INT
);

CREATE TABLE species (
    id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    name VARCHAR(50),
);

ALTER TABLE animals DROP COLUMN species;

AlTER TABLE animals ADD COLUMN species_id INT;
ALTER TABLE animals ADD CONSTRAINT constraint_species
    FOREIGN KEY (species_id)
    REFERENCES species(id);

ALTER TABLE animals ADD CONSTRAINT constraint_owner
    FOREIGN KEY (owner_id)
    REFERENCES owners(id);
