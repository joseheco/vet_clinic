/*Queries that provide answers to the questions from all projects.*/

SELECT * FROM animals WHERE name LIKE '%mon';
SELECT name FROM animals WHERE date_of_birth BETWEEN '2016-01-01' AND '2019-01-01';
SELECT name FROM animals WHERE neutered IS true AND escape_attempts < 3;
SELECT date_of_birth FROM animals WHERE name IN ('Agumon', 'Pikachu');
SELECT name, escape_attempts FROM animals WHERE weight_kg > 10.5;
SELECT * FROM animals WHERE neutered IS TRUE;
SELECT * FROM animals WHERE name NOT IN ('Gabumon');
SELECT * FROM animals WHERE weight_kg BETWEEN 10.4 AND 17.3;

BEGIN;
    UPDATE animals SET species = 'unspecified';

SELECT species FROM animals;

ROLLBACK;

SELECT species FROM animals;

BEGIN;
UPDATE animals SET species = 'digimon'
WHERE name LIKE '%mon';
UPDATE animals SET species = 'pokemon'
WHERE species IS NULL;

COMMIT;

SELECT species FROM animals;

BEGIN;
    DELETE FROM animals;
    SELECT * FROM animals;

    ROLLBACK;

    SELECT * FROM animals;

BEGIN;
    DELETE FROM animals WHERE date_of_birth > '2022-01-01';
    SAVEPOINT SP1;
    UPDATE animals SET weight_kg = weight_kg * -1;
    
    ROLLBACK TO SP1;

    UPDATE animals SET weight_kg = weight_kg * -1
    WHERE weight_kg < 0;
COMMIT;

SELECT COUNT(*) FROM animals;
SELECT COUNT(*) FROM animals WHERE escape_attempts = 0;
SELECT AVG(weight_kg) FROM animals;
SELECT neutered, SUM(escape_attempts) FROM animals GROUP BY neutered;
SELECT species, MIN(weight_kg), MAX(weight_kg) FROM animals GROUP BY species;
SELECT species AVG(escape_attempts) FROM animals 
    WHERE date_of_birth BETWEEN '1990-01-01' AND '2000-12-31' GROUP BY species;

SELECT owners.full_name, animals.name FROM owners
    INNER JOIN animals
    ON owners.id = animals.owner_id
    WHERE owners.full_name = 'Melody Pond';

SELECT animals.name, species.name FROM animals
    INNER JOIN species
    ON animals.species_id = species.id
    WHERE species.name = 'Pokemon';

SELECT owners.full_name, animals.name FROM owners
    LEFT JOIN animals
    ON owners.id = animals.owner_id;

SELECT species.name, COUNT(animals.name) FROM species
    INNER JOIN animals
    ON species.id = animals.species_id
    GROUP BY species.name;

SELECT owners.full_name, animals.name FROM owners
    INNER JOIN animals
    ON owners.id = animals.owner_id
    INNER JOIN species
    ON species.id = animals.species_id
    WHERE owners.full_name = 'Jennifer Orwell' AND species.name = 'Digimon';

SELECT owners.full_name, animals.name FROM owners
    INNER JOIN animals
    ON owners.id = animals.owner_id
    WHERE owners.full_name = 'Dean Winchester' AND animals.escape_attempts = 0;

SELECT owners.full_name, COUNT(animals.owner_id) FROM owners
    INNER JOIN animals
    ON owners.id = animals.owner_id
    GROUP BY owners.full_name
    ORDER BY animals DESC;

