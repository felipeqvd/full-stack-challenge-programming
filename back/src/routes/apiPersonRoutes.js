const { Router } = require('express');
const router = Router();

const { getPersons, createPerson, getPersonByID, getDocumentTypes} = require('../controllers/persons.controller');

router.get('/persons', getPersons);
router.get('/persons/:id', getPersonByID);
router.post('/persons', createPerson);

router.get('/document_types', getDocumentTypes);

module.exports = router;