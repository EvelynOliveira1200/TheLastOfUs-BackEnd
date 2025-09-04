const express = require('express');
const multer = require('multer'); 
const router = express.Router();
const infectedController = require('../controllers/infectedController');
const upload = multer({ dest: "uploads/" });

// Rota para buscar infectados com filtros opcionais
router.get('/infected', infectedController.getInfected);

// Rota para buscar um infectado pelo ID
router.get('/infected/:id', infectedController.getInfectedById);

// Rota para criar um novo infectado (com upload de foto)
router.post("/infected", (req, res, next) => {
    upload.single("photo")(req, res, (err) => {
        if (err) {
            return res.status(400).json({ message: "Erro no upload do arquivo" });
        }
        next();
    });
}, infectedController.createInfected);

// Rota para atualizar os dados de um infectado
router.put('/infected/:id', infectedController.updateInfected);

// Rota para deletar um infectado
router.delete('/infected/:id', infectedController.deleteInfected);

module.exports = router;