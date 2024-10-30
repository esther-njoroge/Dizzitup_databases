const { PrismaClient } = require('@prisma/client');
const { v4: uuidv4 } = require('uuid');

const prisma = new PrismaClient();

const validateRequiredFields = (fields, res) => {
  for (const [key, value] of Object.entries(fields)) {
    if (!value) {
      res.status(400).json({ error: `${key} is required` });
      return false;
    }
  }
  return true;
};

const checkExistingRecord = async (table, uniqueField, value, res) => {
  const existingRecord = await prisma[table].findUnique({
    where: { [uniqueField]: value },
  });
  if (existingRecord) {
    res.status(400).json({ error: `${uniqueField} already exists` });
    return false;
  }
  return true;
};

module.exports = { validateRequiredFields, checkExistingRecord, uuidv4, prisma };
