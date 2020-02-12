/*
 * All routes for Users are defined here
 * Since this file is loaded in server.js into api/users,
 *   these routes are mounted onto /users
 * See: https://expressjs.com/en/guide/using-middleware.html#middleware.router
 */

const express = require('express');
const router  = express.Router();
const myFuncs = require("../public/scripts/helper");

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
        console.log("Rows found: ", data.rows.length);

        const templateVars = {events: data.rows, userEmail: userEmail};
        res.render("eventList", templateVars);
      })
      .catch(err => {
        res.status(500).render("error", {msg: err.message});
      });
  });
  return router;
};
