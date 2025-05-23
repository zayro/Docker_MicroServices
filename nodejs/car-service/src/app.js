const express = require("express");
const app = express();

const response = {
  data: [],
  services: "Car Service",
  architecture: "Microservices"
};

const logger = message => console.log("[🚚  Car Service]: " + message);

app.use((req, res, next) => {
  response.data = [];
  next();
});

app.get("/", (req, res) => {
  response.data.push("Cars Service is running...");
  logger("Get car service status");
  return res.send(response);
});



app.get("/api/v1/cars", (req, res) => {
  response.data.push("Ferrari", "Toyota", "Kia");
  logger("Get car data");
  return res.send(response);
});

module.exports = app;
