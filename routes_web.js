var con = require("./connection");
var uuid = require("uuid");

module.exports = app => {
  app.get("/web/", (req, res) => {
    res.render("home_page");
  });

  app.post("/web/save/", (req, res) => {
    var id = uuid.v4();
    var bodyData = req.body;
    var title = bodyData.title;
    var content = bodyData.content;
    var id_language = bodyData.language;
    con.query(
      "INSETR INTO articles VALUE ?",
      [id, title, content, id_language],
      (error, result, fields) => {
        con.on("error", err => {
          console.log("[Mysql Error]", err);
        });
        if (result) {
          res.redirect("/web/");
        } else {
          console.log("error save data");
        }
      }
    );
  });
};
