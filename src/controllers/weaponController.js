const weaponModel = require("../models/weaponModel");

// Controlador para buscar armas com filtros opcionais
const getWeapons = async (req, res) => {
    try {
        const { name } = req.query;
        const weapons = await weaponModel.getWeapons(name);
        res.status(200).json(weapons);
    } catch (error) {
        console.error(error);
        res.status(400).json({ message: "Error retrieving weapons." });
    }
};

// Controlador para buscar uma arma pelo ID
const getWeaponById = async (req, res) => {
    try {
        const weapon = await weaponModel.getWeaponById(req.params.id);
        if (!weapon) {
            return res.status(404).json({ message: "Weapon not found." });
        }
        res.status(200).json({ weapon });
    } catch (error) {
        console.error(error);
        res.status(500).json({ message: "Error retrieving weapon." });
    }
};

// Controlador para criar uma nova arma
const createWeapon = async (req, res) => {
    try {
        const { name, description, type } = req.body;

        // Valida os campos obrigatórios
        if (!name || !description || !type) {
            return res.status(400).json({ message: "Os campos 'name', 'description' e 'type' são obrigatórios." });
        }

        const photo = req.file ? req.file.filename : null; // Obtém o nome do arquivo da foto, se fornecido
        const newWeapon = await weaponModel.createWeapon(name, description, photo, type);
        res.status(201).json({ message: "Weapon created successfully.", newWeapon });
    } catch (error) {
        console.log(error);
        res.status(500).json({ message: "Error creating weapon." });
    }
};

// Rota para atualizar os dados de uma arma
const updateWeapon = async (req, res) => {
    try {
        const { name, description, type } = req.body;
        const updatedWeapon = await weaponModel.updateWeapon(req.params.id, name, description, type);

        if (!updatedWeapon) {
            return res.status(404).json({ message: "Weapon not found." });
        }
        res.status(200).json({ message: "Weapon updated successfully.", updatedWeapon });
    } catch (error) {
        console.error(error);
        res.status(500).json({ message: "Error updating weapon." });
    }
};

// Rota para deletar uma arma
const deleteWeapon = async (req, res) => {
    try {
        const message = await weaponModel.deleteWeapon(req.params.id);
        res.status(200).json({ message: "Weapon deleted successfully.", details: message });
    } catch (error) {
        console.error(error);
        res.status(500).json({ message: "Failed to delete weapon." });
    }
};

module.exports = {
    getWeapons,
    getWeaponById,
    createWeapon,
    updateWeapon,
    deleteWeapon
};