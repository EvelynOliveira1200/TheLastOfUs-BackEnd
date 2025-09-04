const infectedModel = require("../models/infectedModel");

// Controlador para buscar infectados com filtros opcionais
const getInfected = async (req, res) => {
    try {
        const { name } = req.query;
        const infected = await infectedModel.getInfected(name);
        res.status(200).json({ message: "Infected retrieved successfully.", infected });
    } catch (error) {
        console.error(error);
        res.status(400).json({ message: "Error retrieving infected." });
    }
};

// Controlador para buscar um infectado pelo ID
const getInfectedById = async (req, res) => {
    try {
        const infected = await infectedModel.getInfectedById(req.params.id);
        if (!infected) {
            return res.status(404).json({ message: "Infected not found." });
        }
        res.status(200).json({ message: "Infected retrieved successfully.", infected });
    } catch (error) {
        console.error(error);
        res.status(404).json({ message: "Error retrieving infected." });
    }
};

// Controlador para criar um novo infectado
const createInfected = async (req, res) => {
    try {
        const { name, description, threat_level, weaknesses } = req.body;

        // Valida os campos obrigatórios
        if (!name || !description || !threat_level) {
            return res.status(400).json({ message: "Os campos 'name', 'description' e 'threat_level' são obrigatórios." });
        }

        const photo = req.file ? req.file.filename : null; // Obtém o nome do arquivo da foto, se fornecido
        const newInfected = await infectedModel.createInfected(name, description, photo, threat_level, weaknesses);
        res.status(201).json({ message: "Infected created successfully.", newInfected });
    } catch (error) {
        console.log(error);
        res.status(404).json({ message: "Error creating infected." });
    }
};


// Rota para atualizar os dados de um infectado
const updateInfected = async (req, res) => {
    try {
        const { name, description } = req.body;
        const updatedInfected = await infectedModel.updateInfected(req.params.id, name, description, threat_level, weaknesses);

        if (!updatedInfected) {
            return res.status(404).json({ message: "Infected not found." });
        }
        res.status(200).json({ message: "Infected updated successfully.", updatedInfected });
    } catch (error) {
        console.error(error);
        res.status(500).json({ message: "Error updating infected." });
    }
};

// Rota para deletar um infectado
const deleteInfected = async (req, res) => {
    try {
        const message = await infectedModel.deleteInfected(req.params.id);
        res.status(200).json({ message: "Infected deleted successfully.", details: message });
    } catch (error) {
        console.error(error);
        res.status(500).json({ message: "Failed to delete infected." });
    }
};

module.exports = {
    getInfected,
    getInfectedById,
    createInfected,
    updateInfected,
    deleteInfected
};