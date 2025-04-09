import express from 'express';
import { addHeader, deleteHeader, getHeader, getHeaderSetting, reorderheader, updateHeader } from '../controllers/headerController.js'
import { verifyToken } from "../middleware/authMiddleware.js";
const router = express.Router();

router.get("/getHeader", verifyToken, getHeader);
router.post('/addHeader', verifyToken, addHeader);
router.put('/updateHeader/:id', verifyToken, updateHeader);
router.put('/reorderheader', verifyToken, reorderheader);
router.delete('/deleteHeader/:id', verifyToken, deleteHeader)



router.get("/getHeaderSetting", verifyToken, getHeaderSetting)


export default router;