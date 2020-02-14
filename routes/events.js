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
// const { Pool } = require('pg');

// const pool = new Pool({
//   user: 'vagrant',
//   // password: '123',
//   // host: 'localhost',
//   // database: 'schoodle'
// });

module.exports = (db) => {

  router.get("/", (req, res) => {
    const userEmail = req.query.organizerEmail;
    db.query(`SELECT * FROM vw_events WHERE email = $1;`, [userEmail])
      .then(data => {
        console.log('first result of data rows:', data.rows)
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
    console.log('before posting')
    const y = req.body.ops;
    console.log('here', req.body.ops)
      const values = [req.body.name, req.body.email, req.body.title, req.body.location, req.body.description, req.body.date, req.body.time]
      db.query(`select addEvent ($1, $2, $3, $4, $5, $6, $7) as url` , values)
      .then(result => {
        console.log(result.rows[0])
        if (y === 'y') {
          res.redirect(`/events/${result.rows[0].url}?ops=y`);
        } else {
          res.redirect(`/events/${result.rows[0].url}`);
        }
      })
  })

  router.get("/:id", (req, res) => {
    const ops = req.query.ops;
    const queryString = `select * FROM vw_event_details WHERE url = $1;` 
    const values = [req.params.id];
console.log('here', req.body.ops)
    const output = db.query(queryString, values)
      .then(result => {
        //creating a variable to save an array of objects
        const events = result.rows;
        console.log('events', events)
        console.log('reached get id_user')
        res.render('event', { events: events, ops: ops})
        return events;
      }).catch(err => console.error('query error', err.stack));

    return;
  });

  router.get("/:id/edit", (req, res) => {
    const queryString = `select * FROM vw_event_details WHERE url = $1;` 
    const values = [req.params.id];

    const output = db.query(queryString, values)
      .then(result => {
        //creating a variable to save an array of objects
        const events = result.rows;
        console.log('events', events)
        console.log('reached get id_user')
        res.render('event_edit', { events: events})
        return events;
      }).catch(err => console.error('query error', err.stack));

    return;
  });
  
  router.post("/:id/edit", (req, res) => {
    let email = req.body.email;
    let emailArr = email.split('@');
    let firstPart = emailArr[0];
    let secondPart = emailArr[1];
    console.log(email)
    let route = `/events?organizerEmail=${firstPart}%40${secondPart}`;
    const values = [req.body.url, req.body.title, req.body.location, req.body.description, req.body.date, req.body.time, req.body.organizer_username, req.body.id_option];
      db.query(`select updateEvent ($1, $2, $3, $4, $5, $6, $7, $8) as url` , values)
      .then(result => {
        res.redirect(route);
      })
  });

  router.post("/:id/delete", (req, res) => {
    let id = req.body.id;
    console.log('id in a delete route:', id)
    let email = req.body.email;
    console.log('email in delete route', email)
    let emailArr = email.split('@');
    let firstPart = emailArr[0];
    let secondPart = emailArr[1];
    let route = `/events?organizerEmail=${firstPart}%40${secondPart}`;

    const values = [id];
      db.query(`delete from events where url = $1` , values)
      .then(result => {
        console.log('result of delete:', result)
        res.redirect(route);
      })
  });
  
  router.get("/:id/attendance", (req, res) => {
    const values = [req.params.id] 
    console.log('values', values)
      db.query(`select * from vw_attendees where url = $1` , values)
        .then(result => {
        console.log('result of delete:', result)
        res.redirect(route);
      })
  });

  router.post("/:id/attendance/new", (req, res) => {
    const values = [req.body.attendee_name, req.body.attendee_email, req.body.url, req.body.id_option, req.body.inlineRadioOptions]
    db.query(`select addAttendee ($1, $2, $3, $4, $5) as username` , values)
      .then(result => {
        const values1 = [req.body.url];
        db.query(`select * from vw_attendees where url = $1` , values1).
        then(result => {
          console.log('attendees', result.rows)
          res.render('attendees' , {});

        })
    })
  });

  return router;
};