const express = require("express");
const app = express();

app.get("/", (req, res) => {
  res.send("docker test node server");
});

app.listen(8085, () => console.log("server i running"));
