/*
 * All routes for Users are defined here
 * Since this file is loaded in server.js into api/users,
 *   these routes are mounted onto /users
 * See: https://expressjs.com/en/guide/using-middleware.html#middleware.router
 */

const express = require('express');
const router  = express.Router();
const myFuncs = require("../public/scripts/helper");

console.log(myFuncs.generateRandomString(10));

module.exports = (db) => {

  router.get("/", (req, res) => {
    if (typeof req.body.organizerEmail) {
      res.render("index");
    };
    // db.query(`SELECT * FROM events;`)
    //   .then(data => {
    //     const events = data.rows;
    //     res.json({ events });
    //   })
    //   .catch(err => {
    //     res
    //       .status(500)
    //       .json({ error: err.message });
    //   });
  });

  router.post("/", (req, res) => {
    const userEmail = req.body.organizerEmail;
    db.query(`SELECT * FROM vw_events WHERE email = $1;`, [userEmail])
      .then(data => {
        if (data.rows.length > 0) {
          const events = data.rows;
          console.log("Rows found: ", data.rows.length);
          // res.json({ events });
          res.render("eventList", { events: events});
        } else {
          //  No data found.
          res.render("error", {msg: `No records found, please check the email provided: ${userEmail}`});
        }
      })
      .catch(err => {
        res
        .status(500)
        .render("error", {msg: err.message});
          // .json({ error: err.message });
      });
  });
  return router;
};
