CREATE DATABASE guiabolso;


CREATE TABLE conf_evolutions (
    id SERIAL PRIMARY KEY,
    evolution INT NOT NULL,
    execution_datetime TIMESTAMP NOT NULL
);