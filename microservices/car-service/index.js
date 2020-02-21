const server = require("./src/app");
var port = process.env.PORT || 4000;

//console.log(`${port}`);

server.listen(port, () => {
    console.log("🚚  Car Service Started");
});