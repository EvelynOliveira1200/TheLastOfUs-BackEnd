require("dotenv").config();
const express = require("express");
const cors = require("cors");
const characterRoutes = require("./src/routes/characterRoutes");
const woaponsRoutes = require("./src/routes/weaponRoutes");
const infectedRoutes = require("./src/routes/infectedRoutes");
const path = require("path");

const app = express();
app.use(cors());
app.use(express.json());

app.use("/uploads", express.static(path.join(__dirname, "uploads")));
app.use("/api/", characterRoutes);
app.use("/api/", woaponsRoutes);
app.use("/api/", infectedRoutes);

const PORT = process.env.PORT || 3000;
app.listen(PORT, () => {
    console.log(`🚀 Servidor rodando em http://localhost:${PORT}`);
});
