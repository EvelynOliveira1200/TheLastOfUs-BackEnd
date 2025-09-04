const pool = require("../config/database");

// Função para buscar personagens com filtros opcionais
const getCharacters = async (name) => {
    let query = "SELECT characters.* FROM characters";
    let params = [];
    let conditions = []; // Define a variável conditions como um array vazio

    // Adiciona condições de busca se o nome  forem fornecidos
    if (name) {
        conditions.push("(characters.name ILIKE $1)");
        params.push(`%${name}%`);
    }

    // Adiciona as condições ao query, se existirem
    if (conditions.length > 0) {
        query += " WHERE " + conditions.join(" AND ");
    }

    // Executa a consulta no banco de dados
    const result = await pool.query(query, params);
    return result.rows;
};

// Função para buscar um personagem pelo ID
const getCharactersById = async (id) => {
    const result = await pool.query("SELECT * FROM characters WHERE id = $1", [id]);
    return result.rows[0];
};

// Função para criar um novo personagem
const createCharacter = async (name, description, photo, game, role, quotes, favorite_weapon) => {
    const result = await pool.query(
        "INSERT INTO characters (name, description, photo, game, role, quotes, favorite_weapon) VALUES ($1, $2, $3, $4, $5, $6, $7) RETURNING *",
        [name, description, photo, game, role, quotes, favorite_weapon]
    );
    return result.rows[0];
};

// Função para atualizar os dados de um personagem
const updateCharacter = async (id, name, description) => {
    // Verifica se o personagem existe
    const currentCharacter = await pool.query("SELECT * FROM characters WHERE id = $1", [id]);
    if (!currentCharacter.rows[0]) {
        throw new Error("Character not found");
    }

    // Atualiza os campos com os valores fornecidos ou mantém os valores atuais
    const updatedName = name || currentCharacter.rows[0].name;
    const updatedDescription = description || currentCharacter.rows[0].description;

    // Executa a atualização no banco de dados
    const result = await pool.query(
        "UPDATE characters SET name = $1, description = $2 WHERE id = $3 RETURNING *",
        [updatedName, updatedDescription, id]
    );
    return result.rows[0];
};

// Função para deletar um personagem
const deleteCharacter = async (id) => {
    const result = await pool.query("DELETE FROM characters WHERE id = $1 RETURNING *", [id]);
    return result.rows[0];
};

module.exports = {
    getCharacters,
    getCharactersById,
    createCharacter,
    updateCharacter,
    deleteCharacter
};