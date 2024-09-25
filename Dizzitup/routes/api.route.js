const router = require('express').Router();
const {PrismaClient} = require('@prisma/client')

const prisma = new PrismaClient()

router.get('/ShopProvider ', async (req, res, next) => {
  try {
    const ShopProvider = await prisma.shopProvider.findMany({})
    res.json(ShopProvider)
  } catch (error) {
    
  }
});

router.get('/ShopProvider/:id ', async (req, res, next) => {
  try {
    const {id} = req.params
    const shopProvider = await prisma.shopProvider.findUnique({
      where: {
        id: Number (id)
      }
    })
    res.json(shopProvider)
  } catch (error) {
    
  }
});

router.post('/ShopProvider', async (req, res, next) => {
  try {
    const ShopProvider =await prisma.shopProvider.create({
      data: req.body,
    })
    res.json(ShopProvider)
  } catch (error) {
    
  }
});

router.delete('/ShopProvider/:id ', async (req, res, next) => {
  try {
    const {id} = req.params
    const deletedshopprovider = await prisma.shopProvider.delete({
      where: {
        id: Number(id),
      },
    })
    res.json(shopProvider)
  } catch (error) {
    
  }
});

router.patch('/ShopProvider/:id ', async (req, res, next) => {
  try {
    const {id} = req.params
    const shopProvider = await prisma.shopProvider.update({
      where: {
        id: Number(id),
      },
      // data: req.body,
    })
    res.json(shopProvider)
   } catch (error) {
    next(error)
    
  }
});

module.exports = router;
