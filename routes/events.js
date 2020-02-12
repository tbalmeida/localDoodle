/*
 * All routes for Users are defined here
 * Since this file is loaded in server.js into api/users,
 *   these routes are mounted onto /users
 * See: https://expressjs.com/en/guide/using-middleware.html#middleware.router
 */

const express = require('express');
const router  = express.Router();
const myFuncs = require("../public/scripts/helper");
const generateRandromString = require('../public/scripts/helperFunction');
const { Pool } = require('pg');

const pool = new Pool({
  user: 'vagrant',
  password: '123',
  host: 'localhost',
  database: 'schoodle'
});

module.exports = (db) => {

  router.get("/", (req, res) => {
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

  router.get("/new", (req, res) => {
    res.render('create')
    return;
  });

  router.post("/new", (req, res) => {
    //insert into db
    // const queryString4 = `INSERT INTO attendees (id_event, email) VALUES ($1, $2) RETURNING *`;
    // const values4 = [id_event, req.body.invitees];
    
    
      const queryString1 = `INSERT INTO users (username, name, email) VALUES($1, $2, 
        $3) returning *;`;
      const values1 = ['u' + generateRandromString(6), req.body.name, req.body.email];
      const output = pool.query(queryString1, values1)
        .then(result => {
          const id_organizer = result.rows[0].id;
          console.log(id_organizer);
          const queryString2 = `INSERT INTO events (id_organizer, url, title, location, description) VALUES ($1, $2, $3, $4, $5) returning *;`;
          const values2 = [id_organizer, 'e' + generateRandromString(6), req.body.title, req.body.location, req.body.description];
          return pool.query(queryString2, values2)
        .then(result => {
          const id_event = result.rows[0].id;
          const queryString3 = `INSERT INTO event_options (id_event, date_time) VALUES ($1, $2) returning *;`;
          const values3 = [id_event, `${req.body.date} ${req.body.time}`];
          return pool.query(queryString3, values3)
        .then(result => {
          console.log(result);
          return result;
        }).catch(err => console.error('query error', err.stack));
      })

    })
    //redirect
    res.redirect('/events')
    return output

})
  return router;
};
