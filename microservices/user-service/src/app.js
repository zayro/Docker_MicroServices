const express = require("express");
const app = express();

const response = {
  data: [],
  services: "User Service",
  architecture: "Microservices",
  ms: "node1"
};

const logger = message => console.log("[👤  User Service]: " + message);

app.use((req, res, next) => {
  response.data = [];
  next();
});

app.get("/api/v1/users", (req, res) => {
  response.data.push("Carlos", "Pedro", "Lucas");
  logger("Get user data");
  return res.send(response);
});

module.exports = app;
