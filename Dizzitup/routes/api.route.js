// Route for creating a new ShopProvider

const router = require('express').Router();
const { validateRequiredFields, checkExistingRecord, uuidv4, prisma } = require('./helpers');

router.post('/ShopProvider', async (req, res) => {
  const { USID, shop_name, userUUID, ...optionalFields } = req.body;

  if (!validateRequiredFields({ USID, shop_name, userUUID }, res)) return;

  try {
    if (!(await checkExistingRecord('shopProvider', 'USID', USID, res))) return;
    const userExists = await prisma.user.findUnique({
      where: { UUID: userUUID },
    });
    if (!userExists) {
      return res.status(400).json({ error: "userUUID does not exist in User table" });
    }

  
    const newShopProvider = await prisma.shopProvider.create({
      data: {
        USID,
        shop_name,
        UUID: uuidv4(), 
        user: { connect: { UUID: userUUID } }, 
        ...optionalFields,
      },
    });

    res.status(201).json(newShopProvider);
  } catch (error) {
    console.error('Error creating shop provider:', error);
    res.status(500).json({ error: error.message });
  }
});





// Route for creating a new User
router.post('/users', async (req, res) => {
  const { first_name, surname, email, ...optionalFields } = req.body;
  if (!validateRequiredFields({ first_name, surname, email }, res)) return;

  try {
    if (!(await checkExistingRecord('user', 'email', email, res))) return;
    const newUser = await prisma.user.create({
      data: {
        UUID: uuidv4(),
        first_name,
        surname,
        email,
        ...optionalFields,
      },
    });

    res.status(201).json(newUser);
  } catch (error) {
    console.error('Error creating user:', error);
    res.status(500).json({ error: error.message });
  }
});

module.exports = router;
