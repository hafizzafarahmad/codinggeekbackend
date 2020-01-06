var uuid = require("uuid");
var crypto = require("crypto");
var con = require("./connection");

module.exports = app => {
  //Login Aplikasi
  app.post("/login/", (req, res, next) => {
    var post_data = req.body;
    var email = post_data.email;
    var password = post_data.password;

    var key = crypto.createCipher("aes-128-cbc", "mypassword");
    var encrypted_password = key.update(password, "utf8", "hex");
    encrypted_password += key.final("hex");

    con.query(
      "SELECT * FROM users where email=?",
      [email],
      (error, result, fields) => {
        con.on("error", err => {
          console.log("[MYSQL ERROR]", err);
        });

        if (result && result.length) {
          var pass = result[0].pass;

          if (pass == encrypted_password) {
            res.end(JSON.stringify(result[0].id));
          } else {
            res.end(JSON.stringify("Wrong Password"));
          }
        } else {
          res.json("User not Exists");
        }
      }
    );
  });

  //Daftar User Baru
  app.post("/register/", (req, res, next) => {
    var id = uuid.v4();
    var post_data = req.body;
    var name = post_data.name;
    var email = post_data.email;
    var password = post_data.password;
    var gender = post_data.gender;
    var country = post_data.country;
    var occupation = post_data.occupation;
    var bod = post_data.bod;

    //encryp Password
    var key = crypto.createCipher("aes-128-cbc", "mypassword");
    var encrypted_password = key.update(password, "utf8", "hex");
    encrypted_password += key.final("hex");

    con.query(
      "SELECT * FROM users where email=?",
      [email],
      (error, result, length) => {
        con.on("error", err => {
          console.log("[MYSQL ERROR]", err);
        });
        if (result && result.length) {
          res.json("User already Exists");
        } else {
          con.query(
            "INSERT INTO users VALUES (?,?,?,?,?,?,?,?)",
            [
              id,
              email,
              name,
              encrypted_password,
              gender,
              country,
              occupation,
              bod
            ],
            (error, result, fields) => {
              con.on("error", err => {
                console.log("[MYSQL ERROR]", err);
                res.json("Register Error");
              });
              res.json("Register Success");
            }
          );
        }
      }
    );
  });

  //Get Data Language
  app.get("/language/", (req, res) => {
    con.query("SELECT * FROM language", (error, result, fields) => {
      con.on("error", err => {
        console.log("[MYSQL ERROR: ]" + err);
      });

      if (result && result.length) {
        res.end(JSON.stringify(result));
      } else {
        res.end(JSON.stringify("No Data"));
        console.log("Language No Data");
      }
    });
  });

  //Get All Tutorial
  app.get("/tutorial/:language_id", (req, res) => {
    con.query(
      "SELECT * FROM tutorial where language_id=?",
      [req.params.language_id],
      (error, result, fields) => {
        con.on("error", err => {
          console.log("[MYSQL ERROR: ]" + err);
        });
        if (result && result.length) {
          res.end(JSON.stringify(result));
        } else {
          res.end(JSON.stringify("No Data Tutorial"));
          console.log("Tutorial No Data");
        }
      }
    );
  });
};
