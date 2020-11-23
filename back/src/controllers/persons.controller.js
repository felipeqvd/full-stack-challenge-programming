const { query } = require('express');
const { Pool } = require('pg');

const pool = new Pool ({
    host: 'localhost',
    user: 'postgres',
    password: 'qwert',
    database: 'familyapi',
    port: '5432'
});

const getPersons = async (req, res) => {
    const response = await pool.query(
        'SELECT p1.person_id, p1.fullname, p1.birth, p2.fullname as father, p3.fullname as mother '+ 
        'FROM persons p1 '+
        'LEFT JOIN persons p2 ON p1.father = p2.person_id '+
        'LEFT JOIN persons p3 ON p1.mother = p3.person_id');    
    res.status(200).json(response.rows);
}

const getPersonByID = async (req, res) =>{
    const person_id = req.params.id;
    const response = await pool.query('SELECT * FROM persons WHERE person_id = $1',[person_id]);
    res.json(response.rows);
}

const createPerson = async (req, res) => {    
    const { fullname, birth, identification_number } = req.body; 
    const personExits = await pool.query('SELECT * FROM persons WHERE identification_number = $1',[identification_number]);
    if (personExits.rows.length > 0){
        res.json({
            success: false,
            message: 'La persona ya existe en el sistema'            
        });
    }else{
        const reponse = await pool.query('INSERT INTO persons (fullname, birth) VALUES ($1, $2)', [fullname, birth]);
        res.json({
            success: true,
            message: 'Persona creada satisfactoriamente',
            body: {
                person:{fullname, birth, identification_number}
            }
        });
    }   
    
}

const getDocumentTypes = async (req, res) => {
    const response = await pool.query('SELECT * FROM document_types');    
    res.json(response.rows);
}

module.exports = {
    getPersons,
    getPersonByID,
    createPerson,
    getDocumentTypes
}