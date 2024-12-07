// Route for creating a new ShopProvider - main

// const router = require('express').Router();
// const { validateRequiredFields, checkExistingRecord, uuidv4, prisma } = require('./helpers');

// router.post('/ShopProvider', async (req, res) => {
//   const { USID, shop_name, userUUID, ...optionalFields } = req.body;

//   if (!validateRequiredFields({ USID, shop_name, userUUID }, res)) return;

//   try {
//     if (!(await checkExistingRecord('shopProvider', 'USID', USID, res))) return;
//     const userExists = await prisma.user.findUnique({
//       where: { UUID: userUUID },
//     });
//     if (!userExists) {
//       return res.status(400).json({ error: "userUUID does not exist in User table" });
//     }


  
//     // const newShopProvider = await prisma.shopProvider.create({
//     //   data: {
//     //     USID,
//     //     shop_name,
//     //     UUID: uuidv4(), 
//     //     user: { connect: { UUID: userUUID } }, 
//     //     ...optionalFields,
//     //   },
//     // });


//     const newShopProvider = await prisma.shopProvider.create({
//       data: {
//         USID: "1",
//         shop_name: "Mphavu",
//         shop_group_name: "Mphavu",
//         shop_products_types: "services",
//         shop_address: "Ngumba 201",
//         shop_phone_number: "+254712456378",
//         shop_city: "Nairobi",
//         shop_neighbourhood: "Garden City",
//         shop_country: "Kenya",
//         shop_geolocation: "1.2,36.8",
//         shop_african_location: "Nairobi",
//         shop_website: "www.mpavu.co.ke",
//         shop_email: "mphavu@gmail.com",
//         shop_facebook_page: "mphavu_shop",
//         shop_instagram: "mphavu_shop",
//         shop_whatsapp_number: "+254712456378",
//         shop_telegram_number: "+254712456378",
//         shop_dizzitup_e_store: "mphavu",
        
//         user: {
//           connect: { UUID: "d2b1c395-08ed-4f41-b6b0-a1712fd5a8cf" } // Linking to an existing User by UUID
//         }
//       }
//     });

    
//     res.status(201).json(newShopProvider);
//   } catch (error) {
//     console.error('Error creating shop provider:', error);
//     res.status(500).json({ error: error.message });
//   }
// });









// const router = require('express').Router();
// const { validateRequiredFields, checkExistingRecord, uuidv4, prisma } = require('./helpers');

// // Route for creating a new ShopProvider, connecting it to an existing User
// router.post('/ShopProvider', async (req, res) => {
//   // Extract required and optional fields from the request body
//   const { USID, shop_name, userUUID, ...optionalFields } = req.body;

//   // Validate required fields
//   if (!validateRequiredFields({ USID, shop_name, userUUID }, res)) return;

//   try {
//     // Check if a ShopProvider with the given USID already exists
//     if (!(await checkExistingRecord('shopProvider', 'USID', USID, res))) return;

//     // Check if the User with the provided UUID exists
//     const userExists = await prisma.user.findUnique({
//       where: { UUID: userUUID },
//     });
//     if (!userExists) {
//       return res.status(400).json({ error: "userUUID does not exist in User table" });
//     }

//     // Create the ShopProvider and connect it to the existing User using userUUID
//     const newShopProvider = await prisma.shopProvider.create({
//       data: {
//         USID,
//         shop_name,
//         UUID: uuidv4(), // Generate a unique UUID for the ShopProvider
//         user: { connect: { UUID: userUUID } }, // Connect to the existing User using their UUID
//         ...optionalFields, // Include any optional fields in the data
//       },
//     });

//     res.status(201).json(newShopProvider);
//   } catch (error) {
//     console.error('Error creating shop provider:', error);
//     res.status(500).json({ error: error.message });
//   }
// });

// // Route for creating a new User
// router.post('/users', async (req, res) => {
//   const { first_name, surname, email, ...optionalFields } = req.body;

//   // Validate required fields for User creation
//   if (!validateRequiredFields({ first_name, surname, email }, res)) return;

//   try {
//     // Check if a User with the given email already exists
//     if (!(await checkExistingRecord('user', 'email', email, res))) return;

//     // Create a new User with a unique UUID
//     const newUser = await prisma.user.create({
//       data: {
//         UUID: uuidv4(),
//         first_name,
//         surname,
//         email,
//         ...optionalFields,
//       },
//     });

//     res.status(201).json(newUser);
//   } catch (error) {
//     console.error('Error creating user:', error);
//     res.status(500).json({ error: error.message });
//   }
// });

// module.exports = router;






const router = require('express').Router();
const { validateRequiredFields, checkExistingRecord, uuidv4, prisma } = require('./helpers');

// Route for creating a new ShopProvider
router.post('/ShopProvider', async (req, res) => {
  const { USID, shop_name, userUUID, ...optionalFields } = req.body; // Dynamically capture request data

  // Check for required fields
  if (!validateRequiredFields({ USID, shop_name, userUUID }, res)) return;

  try {
    // Ensure USID is unique and that the associated user exists
    if (!(await checkExistingRecord('shopProvider', 'USID', USID, res))) return;
    const userExists = await prisma.user.findUnique({
      where: { UUID: userUUID },
    });
    if (!userExists) {
      return res.status(400).json({ error: "userUUID does not exist in User table" });
    }

    // Create new shop provider with dynamic data from request
    const newShopProvider = await prisma.shopProvider.create({
      data: {
        USID,
        shop_name,
        UUID: uuidv4(), 
        user: { connect: { UUID: userUUID } }, 
        ...optionalFields, // Add all optional fields
      },
    });

    res.status(201).json(newShopProvider);
  } catch (error) {
    console.error('Error creating shop provider:', error);
    res.status(500).json({ error: error.message });
  }
});

module.exports = router;



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
