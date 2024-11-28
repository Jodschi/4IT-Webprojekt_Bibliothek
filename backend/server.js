const mysql = require('mysql');

const connection = mysql.createConnection({
    host: 'localhost',
    user: 'root',
    password: '',
    database: 'projekt_bibliothek'
});


const startServer = async () => {
    try {
        connection.connect();
        const port = 3001;
        const express = require('express');
        const app = express();
        app.use(express.json());
        app.get('/', (req, res) => {
            // return all books
            connection.query('SELECT * FROM books', (err, rows, fields) => {
                if (err) throw err;
            })
        })

    } catch (error) {
        console.error(error);
    } finally {
        connection.end();

    }
}
