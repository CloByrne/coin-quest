const express = require('express');
const router = express.Router();
const mongoose = require('mongoose');

// Define a schema for the form data
const ContactSchema = new mongoose.Schema({
  name: String,
  email: String,
  message: String
});

// Define a model for the form data
const Contact = mongoose.model('Contact', ContactSchema);

router.post('/', async (req, res) => {
  // Get the form data from the request body
  const { name, email, message } = req.body;

  // Create a new contact instance
  const contact = new Contact({
    name,
    email,
    message
  });

  try {
    // Save the contact to the database
    await contact.save();
    res.status(200).send('Message saved!');
  } catch (error) {
    console.error(error);
    res.status(500).send('Error saving message');
  }
});

module.exports = router;
