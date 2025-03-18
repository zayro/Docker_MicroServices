const express = require("express");
const app = express();

const response = {
  data: [],
  services: "Book Service",
  architecture: "Microservices"
};

const logger = message => console.log("[📖  Book Service]: " + message);

app.use((req, res, next) => {
  response.data = [];
  next();
});

app.get("/api/v1/books", (req, res) => {
  response.data.push("Soft Skills", "Clean Code", "Effective C#");
  logger("Get book data");
  return res.send(response);
});


app.get("/api/v1/books/headers", (req, res) => {

    logger("init Request");

    let showHeader = req.headers



    logger(JSON.stringify(showHeader));

    return res.send(response);
  });



module.exports = app;
