import express from 'express';
import { addCategory, deleteCategory, getCategory, updateCategory } from '../controllers/categoryController.js';
import { verifyToken } from '../middleware/authMiddleware.js';
const router = express.Router();

router.get("/get-categories", getCategory);
router.post("/add-category", verifyToken, addCategory);
router.put("/update-category", verifyToken, updateCategory);
router.delete("/delete-category", verifyToken, deleteCategory)


export default router;