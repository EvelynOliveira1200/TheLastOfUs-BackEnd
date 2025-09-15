const pool = require("../config/database");

// Função para buscar as armas com filtros opcionais
const getWeapons = async (name) => {
    let query = "SELECT weapons.* FROM weapons";
    let params = [];
    let conditions = []; 

    // Adiciona condições de busca se o nome forem fornecidos
    if (name) {
        conditions.push("(weapons.name ILIKE $1)");
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
const getWeaponById = async (id) => {
    const result = await pool.query("SELECT * FROM weapons WHERE id = $1", [id]);
    return result.rows[0];
};

// Função para criar uma nova arma
const createWeapon = async (name, description, photo, type) => {
    const result = await pool.query(
        "INSERT INTO weapons (name, description, photo, type) VALUES ($1, $2, $3, $4) RETURNING *",
        [name, description, photo, type]
    );
    return result.rows[0];
};

// Função para atualizar os dados de uma arma
const updateWeapon = async (id, name, description) => {
    // Verifica se a arma existe
    const currentWeapon = await pool.query("SELECT * FROM weapons WHERE id = $1", [id]);
    if (!currentWeapon.rows[0]) {
        throw new Error("Weapon not found");
    }

    // Atualiza os campos com os valores fornecidos ou mantém os valores atuais
    const updatedName = name || currentWeapon.rows[0].name;
    const updatedDescription = description || currentWeapon.rows[0].description;

    // Executa a atualização no banco de dados
    const result = await pool.query(
        "UPDATE weapons SET name = $1, description = $2 WHERE id = $3 RETURNING *",
        [updatedName, updatedDescription, id]
    );
    return result.rows[0];
};

// Função para deletar uma arma
const deleteWeapon = async (id) => {
    const result = await pool.query("DELETE FROM weapons WHERE id = $1 RETURNING *", [id]);
    return result.rows[0];
};

module.exports = {
    getWeapons,
    getWeaponById,
    createWeapon,
    updateWeapon,
    deleteWeapon
};