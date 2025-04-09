import jwt from 'jsonwebtoken';
import bcrypt from 'bcryptjs';
import db from '../config/db.js';

export const loginUser = async (req, res) => {
    const { username, password } = req.body;

    try {
        const [results] = await db.query("SELECT * FROM accounts WHERE username = ?", [username]);

        if (results.length === 0) {

            return res.status(401).json({ message: "User not found" });
        }

        const user = results[0];
        console.log(" User fetched from DB:", user);

        const isMatch = await bcrypt.compare(password, user.password);
        console.log(" Password match:", isMatch);

        if (!isMatch) {
            return res.status(401).json({ message: "Invalid password" });
        }

        const token = jwt.sign(
            { id: user.id, username: user.username, role: user.role },
            process.env.JWT_SECRET,
            { expiresIn: '9h' }
        );

        console.log(" Login successful, token generated");
        return res.status(200).json({
            message: "Login successful",
            token
        });
    } catch (error) {
        console.error(" Login error:", error);
        return res.status(500).json({ message: "Internal server error", error });
    }
};
