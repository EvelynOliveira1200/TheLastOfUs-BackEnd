const characterModel = require("../models/characterModel");

// Controlador para buscar personagens com filtros opcionais
const getCharacters = async (req, res) => {
    try {
        const { name } = req.query;
        const characters = await characterModel.getCharacters(name);
        res.status(200).json(characters);
    } catch (error) {
        console.error(error);
        res.status(400).json({ message: "Error retrieving characters." });
    }
};

// Controlador para buscar um personagem pelo ID
const getCharactersById = async (req, res) => {
    try {
        const character = await characterModel.getCharactersById(req.params.id);
        if (!character) {
            return res.status(404).json({ message: "Character not found." });
        }
        res.status(200).json({ message: "Character retrieved successfully.", character });
    } catch (error) {
        console.error(error);
        res.status(404).json({ message: "Error retrieving character." });
    }
};

// Controlador para criar um novo personagem
const createCharacter = async (req, res) => {
    try {
        const { name, description, game, role, quotes, favorite_weapon } = req.body;

        // Valida os campos obrigatórios
        if (!name || !description) {
            return res.status(400).json({ message: "Os campos 'name', 'description' são obrigatórios." });
        }

        const photo = req.file ? req.file.filename : null; // Obtém o nome do arquivo da foto, se fornecido
        const newCharacter = await characterModel.createCharacter(name, description, photo, game, role, quotes, favorite_weapon);
        res.status(201).json({ message: "Character created successfully.", newCharacter });
    } catch (error) {
        console.log(error);
        res.status(404).json({ message: "Error creating character." });
    }
};


// Rota para atualizar os dados de um personagem
const updateCharacter = async (req, res) => {
    try {
        const { name, description } = req.body;
        const updatedCharacter = await characterModel.updateCharacter(req.params.id, name, description);

        if (!updatedCharacter) {
            return res.status(404).json({ message: "Character not found." });
        }
        res.status(200).json({ message: "Character updated successfully.", updatedCharacter });
    } catch (error) {
        console.error(error);
        res.status(500).json({ message: "Error updating character." });
    }
};

// Rota para deletar um 
const deleteCharacter = async (req, res) => {
    try {
        const message = await characterModel.deleteCharacter(req.params.id);
        res.status(200).json({ message: "Character deleted successfully.", details: message });
    } catch (error) {
        console.error(error);
        res.status(500).json({ message: "Failed to delete character." });
    }
};

module.exports = {
    getCharacters,
    getCharactersById,
    createCharacter,
    updateCharacter,
    deleteCharacter
};