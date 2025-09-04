const pool = require("../config/database");

// Função para buscar os infectados com filtros opcionais
const getInfected = async (name) => {
    let query = "SELECT infected.* FROM infected";
    let params = [];
    let conditions = []; // Define a variável conditions como um array vazio

    // Adiciona condições de busca se o nome  forem fornecidos
    if (name) {
        conditions.push("(infected.name ILIKE $1)");
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
const getInfectedById = async (id) => {
    const result = await pool.query("SELECT * FROM infected WHERE id = $1", [id]);
    return result.rows[0];
};

// Função para criar um novo infectado
const createInfected = async (name, description, photo, threat_level, weaknesses) => {
    const result = await pool.query(
        "INSERT INTO infected (name, description, photo, threat_level, weaknesses) VALUES ($1, $2, $3, $4, $5) RETURNING *",
        [name, description, photo, threat_level, weaknesses]
    );
    return result.rows[0];
};

// Função para atualizar os dados de um infectado
const updateInfected = async (id, name, description, photo, threat_level, weaknesses) => {
    // Verifica se o infectado existe
    const currentInfected = await pool.query("SELECT * FROM infected WHERE id = $1", [id]);
    if (!currentInfected.rows[0]) {
        throw new Error("Infected not found");
    }

    // Atualiza os campos com os valores fornecidos ou mantém os valores atuais
    const updatedName = name || currentInfected.rows[0].name;
    const updatedDescription = description || currentInfected.rows[0].description;

    // Executa a atualização no banco de dados
    const result = await pool.query(
        "UPDATE infected SET name = $1, description = $2 WHERE id = $3 RETURNING *",
        [updatedName, updatedDescription, id]
    );
    return result.rows[0];
};

// Função para deletar um infectado
const deleteInfected = async (id) => {
    const result = await pool.query("DELETE FROM infected WHERE id = $1 RETURNING *", [id]);
    return result.rows[0];
};

module.exports = {
    getInfected,
    getInfectedById,
    createInfected,
    updateInfected,
    deleteInfected
};