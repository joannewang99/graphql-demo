DROP TABLE IF EXISTS contries;

CREATE TABLE contries
{
    country_id SERIAL PRIMARY KEY,
    country_name VARCHAR(100) NOT NULL,
    country_coded VARCHAR(3) NOT NULL,
    iso_code VARCHAR(2) NOT NULL
}