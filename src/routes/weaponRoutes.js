const express = require('express');
const multer = require('multer'); 
const router = express.Router();
const weaponController = require('../controllers/weaponController');
const upload = multer({ dest: "uploads/" });

// Rota para buscar armas com filtros opcionais
router.get('/weapons', weaponController.getWeapons);

// Rota para buscar uma arma pelo ID
router.get('/weapon/:id', weaponController.getWeaponById);

// Rota para criar uma nova arma (com upload de foto)
router.post("/weapons", (req, res, next) => {
    upload.single("photo")(req, res, (err) => {
        if (err) {
            return res.status(400).json({ message: "Erro no upload do arquivo" });
        }
        next();
    });
}, weaponController.createWeapon);

// Rota para atualizar os dados de uma arma
router.put('/weapons/:id', weaponController.updateWeapon);

// Rota para deletar uma arma
router.delete('/weapons/:id', weaponController.deleteWeapon);

module.exports = router;