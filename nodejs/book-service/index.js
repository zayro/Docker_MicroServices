const server = require("./src/app");
var port = process.env.PORT || 3000;

//console.log(`${port}`);

server.listen(port, () => {
    console.log("📖  Book Service Started", port);
});