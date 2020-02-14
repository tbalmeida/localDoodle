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
    //insert into db
    // const queryString4 = `INSERT INTO attendees (id_event, email) VALUES ($1, $2) RETURNING *`;
    // const values4 = [id_event, req.body.invitees];





      // db.query(`SELECT id FROM users WHERE email = $1;`, [req.body.email])
      // .then(data => {
      //   console.log('data rows length:', data.rows.length)
      //   if (data.rows.length === 0) {
      //     const queryString1 = `INSERT INTO users (name, email) VALUES($1, $2) returning *;`;
      //     const values1 = [req.body.name, req.body.email];
      //     let id_organizer;
      //     const output = db.query(queryString1, values1)
      //       .then(result => {
      //         id_organizer = result.rows[0].id;
      //         console.log('id organizer', id_organizer);
      //         const queryString2 = `INSERT INTO events (id_organizer, url, title, location, description) VALUES ($1, $2, $3, $4, $5) returning *;`;
      //         const values2 = [id_organizer, 'e' + generateRandromString(6), req.body.title, req.body.location, req.body.description];
      //         return db.query(queryString2, values2)
      //       .then(result => {
      //         console.log('first result after inserting into events:', result)
      //         const id_event = result.rows[0].id;
      //         const queryString3 = `INSERT INTO event_options (id_event, dt_event, hh_event) VALUES ($1, $2, $3) returning *;`;
      //         const values3 = [id_event, req.body.date, req.body.time];
      //         return db.query(queryString3, values3)
      //       .then(result => {
      //         console.log('result:', result);
      //         console.log('reached 1 if')
      //         res.redirect(`/events/u/${id_organizer}`)
      //         return result;
      //       }).catch(err => console.error('query error', err.stack));
      //     })
      //   })
      //   } else {
      //     id_organizer = data.rows[0].id;
      //     const queryString2 = `INSERT INTO events (id_organizer, url, title, location, description) VALUES ($1, $2, $3, $4, $5) returning *;`;
      //         const values2 = [data.rows[0].id, 'e' + generateRandromString(6), req.body.title, req.body.location, req.body.description];
      //         return db.query(queryString2, values2)
      //       .then(result => {
      //         const id_event = result.rows[0].id;
      //         const queryString3 = `INSERT INTO event_options (id_event, dt_event, hh_event) VALUES ($1, $2, $3) returning *;`;
      //         const values3 = [id_event, req.body.date, req.body.time];
      //         return db.query(queryString3, values3)
      //       .then(result => {
      //         console.log(result);
      //         console.log('reached 2nd else')
      //         res.redirect(`/events/u/${id_organizer}`)
      //         return result;
      //       }).catch(err => console.error('query error', err.stack));
      //     })
      //   }
      // })      
      // .catch(err => {
      //   console.log('before catching error')
      //   console.error('query error', err.stack)
      //   res.status(500).render("error", {msg: err.message});
      // });
      const values = [req.body.name, req.body.email, req.body.title, req.body.location, req.body.description, req.body.date, req.body.time]
      db.query(`select addEvent ($1, $2, $3, $4, $5, $6, $7) as url` , values)
      .then(result => {
        console.log(result.rows[0])
        res.redirect(`/events/${result.rows[0].url}`);

      })


        // db.query(`select url from users where email = $1;`, [req.body.email])
        // .then(result => {
        //   console.log('result of new function', result)
        //   return result;

        // })
      
    
})

  router.get("/:id", (req, res) => {
    console.log(req.params.id_user)
    // res.send(req.params.id_user)
    const queryString = `select * FROM vw_events WHERE url = $1;` 
    const values = [req.params.id];

    const output = db.query(queryString, values)
      .then(result => {
        //creating a variable to save an array of objects
        const events = result.rows;
        console.log('events', events)
        console.log('reached get id_user')
        res.render('event', { events: events})
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
  
  return router;
};