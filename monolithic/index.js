const server = require("./src/app");

var port = process.env.PORT || 3000;

console.log(`port: ${port}`);

server.listen(port);