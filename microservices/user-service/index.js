const server = require("./src/app");

var port = process.env.PORT || 5000;

//console.log(`${port}`);

server.listen(port, () => {
    console.log("👤  User Service Started");
});