const express = require('express');
const path = require('path');
const app = express();

// Serve static files from the public folder
app.use(express.static(path.join(__dirname, 'public')));

// Handle routes to different HTML pages
app.get('/', (req, res) => {
  res.sendFile(path.join(__dirname, 'public', 'index.html'));
});

app.get('/about', (req, res) => {
  res.sendFile(path.join(__dirname, 'public', 'about.html'));
});

app.get('/inventory', (req, res) => {
  res.sendFile(path.join(__dirname, 'public', 'inventory.html'));
});

app.get('/gallery', (req, res) => {
  res.sendFile(path.join(__dirname, 'public', 'gallery.html'));
});

// Fallback for any unknown route
app.get('*', (req, res) => {
  res.sendFile(path.join(__dirname, 'public', 'index.html'));
});

// Listen on Render's assigned port or local 3000
const PORT = process.env.PORT || 3000;
app.listen(PORT, () => console.log(`🚗 Sholate Motors running on port ${PORT}`));
