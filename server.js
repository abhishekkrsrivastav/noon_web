import express from 'express';
import db from './config/db.js';
import headerRoute from './routes/headerRoute.js'
import productRoutes from './routes/productRoutes.js';
import categoryRoute from './routes/categoryRoute.js';
import cors from 'cors';
import dashboardRoute from './routes/dashboardRoute.js';
import authRoute from './routes/authRoute.js';
import userRoute from './routes/userRoute.js';
const app = express();
import dotenv from 'dotenv';
dotenv.config();

// middleware
app.use(cors());

 
app.use(express.json());

app.use('/api', authRoute);
app.use('/api', userRoute);

// routes for noon header
app.use('/noon', headerRoute);

// routes for category
app.use('/noon', categoryRoute);

// routes for product
app.use('/noon', productRoutes)


// routes for dashboard
app.use('/api', dashboardRoute);

const PORT = process.env.PORT || 8888;


db.query('SELECT 1').then(() => {
    // mysql connected
    console.log("Mysql Connected");

    // server listening 
    app.listen(PORT, () => {
        console.log(`server listening on port no ${PORT}`);
    });



}).catch((error) => {
    console.log(error);

})