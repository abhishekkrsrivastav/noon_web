import express from 'express';
import { dashboardData } from '../controllers/dashController.js';

const router = express.Router();

router.get('/dashboard_data', dashboardData);

export default router;
