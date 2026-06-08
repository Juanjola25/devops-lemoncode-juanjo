// Módulos
const fetch = (...args) =>
  import('node-fetch').then(({ default: fetch }) => fetch(...args));

const express = require('express');
const path = require('path');
require('dotenv').config();

const app = express();

// =============================
// CONFIGURACIÓN API
// =============================
const API_URL = process.env.API_URL || 'http://backend:5000/api/classes';

// Configuración servidor
const PORT = 3000;
const APP_URL = `http://localhost:${PORT}`;

// EJS
app.set('view engine', 'ejs');
app.set('views', path.join(__dirname, 'views'));

// Middleware logging
app.use((req, res, next) => {
  const timestamp = new Date().toLocaleTimeString('es-ES');
  console.log(`📍 [${timestamp}] ${req.method} ${req.path}`);
  next();
});

// =============================
// RUTA PRINCIPAL
// =============================
app.get('/', async (req, res) => {
  try {
    console.log(`🔄 Conectando a la API: ${API_URL}`);

    const response = await fetch(API_URL);

    if (!response.ok) {
      throw new Error(`Error HTTP: ${response.status}`);
    }

    const classes = await response.json();

    console.log(`✅ ${classes.length} clases cargadas correctamente`);

    res.render('index', { classes });
  } catch (error) {
    console.error(`❌ Error al conectar con la API: ${error.message}`);

    res.status(500).render('index', { classes: [] });
  }
});

// =============================
// ARRANQUE SERVIDOR
// =============================
const server = app.listen(PORT, () => {
  console.log('\n' + '='.repeat(70));
  console.log('🍋 LEMONCODE CALENDAR - FRONTEND SERVER');
  console.log('='.repeat(70));
  console.log(`🚀 Servidor iniciado correctamente`);
  console.log(`📱 Web: ${APP_URL}`);
  console.log(`🔗 API: ${API_URL}`);
  console.log(`⏰ Hora: ${new Date().toLocaleString('es-ES')}`);
  console.log('='.repeat(70) + '\n');
});

server.on('error', (error) => {
  console.error(`❌ Error en el servidor: ${error.message}`);
  process.exit(1);
});
