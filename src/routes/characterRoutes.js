const express = require('express');
const multer = require('multer'); 
const router = express.Router();
const characterController = require('../controllers/characterController');
const upload = multer({ dest: "uploads/" });

// Rota para buscar personagens com filtros opcionais
router.get('/characters', characterController.getCharacters);

// Rota para buscar um personagem pelo ID
router.get('/characters/:id', characterController.getCharactersById);

// Rota para criar um novo personagem (com upload de foto)
router.post("/characters", (req, res, next) => {
    upload.single("photo")(req, res, (err) => {
        if (err) {
            return res.status(400).json({ message: "Erro no upload do arquivo" });
        }
        next();
    });
}, characterController.createCharacter);

// Rota para atualizar os dados de um personagem
router.put('/characters/:id', characterController.updateCharacter);

// Rota para deletar um personagem
router.delete('/characters/:id', characterController.deleteCharacter);

module.exports = router;