const http = require('http');
const app = require('./app');

const PORT = 8080;
const HOST = '0.0.0.0';

const server = http.createServer(app);

server.listen(PORT, () => {
  console.log(`App running on http://${HOST}:${PORT}`);
});

