/*Banco de Dados The Last of Us - Back End
    Desenvolvido por: Evelyn Gonçalves de Oliveira
    Data: 04/09/2025
*/

CREATE DATABASE the_last_of_us;
\c the_last_of_us;

-- Tabela de Armas
CREATE TABLE weapons (
    id SERIAL PRIMARY KEY,
    name VARCHAR(150) NOT NULL,
    description TEXT,
    photo TEXT,
    type VARCHAR(100)
);

-- Tabela de Infectados
CREATE TABLE infected (
    id SERIAL PRIMARY KEY,
    name VARCHAR(150) NOT NULL,
    description TEXT,
    photo TEXT,
    threat_level VARCHAR(100),
    weaknesses TEXT
);

-- Tabela de Personagens
CREATE TABLE characters (
    id SERIAL PRIMARY KEY,
    name VARCHAR(150) NOT NULL,
    description TEXT,
    role VARCHAR(100),
    game VARCHAR(100),
    photo TEXT,
    quotes TEXT,
    favorite_weapon INTEGER REFERENCES weapons(id) ON DELETE CASCADE
);
