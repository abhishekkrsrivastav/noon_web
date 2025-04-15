import db from '../config/db.js';

// display all data of category
export const getCategory = async (req, res) => {
    try {
        const [rows] = await db.query(`SELECT * FROM parent_category ORDER BY sort_order ASC`);
        res.json(rows);
    } catch (error) {
        console.error('Database Error:', error);
        res.status(500).json({ error: 'Database error' });
    }
}

// add category

export const addCategory = async (req, res) => {
    const { category_name, sub_category, sub_sub_category, sort_order, status_id, category_url, parent_category_img_url } = req.body;

    try {
        const [result] = await db.query(`INSERT INTO parent_category 
                (category_name, sub_category, sub_sub_category, sort_order, status_id, category_url, parent_category_img_url)
             VALUES (?, ?, ?, ?, ?, ?, ?)`, [category_name, sub_category, sub_sub_category, sort_order, status_id, category_url, parent_category_img_url]);

        res.json({
            message: 'Category added successfully',
            category_id: result.insertId
        });
    } catch (error) {
        console.error('Database Error:', error);
        res.status(500).json({ error: 'Database error' });
    }
};

// upadte category
export const updateCategory = async (req, res) => {
    const { category_id, category_name, sub_category, sub_sub_category, sort_order, status_id, category_url, parent_category_img_url } = req.body;

    try {
        const [result] = await db.query(`UPDATE parent_category SET 
                category_name = ?, sub_category = ?, sub_sub_category = ?,  sort_order = ?, status_id = ?, category_url = ?, parent_category_img_url = ?  WHERE category_id = ?`,
            [category_name, sub_category, sub_sub_category, sort_order, status_id, category_url, parent_category_img_url, category_id]);

        res.json({ message: "Category updated successfully" });
    } catch (error) {
        console.error("Database Error:", error);
        res.status(500).json({ error: "Failed to update category" });
    }
};

// delete category
export const deleteCategory = async (req, res) => {
    const { category_id } = req.params;

    try {
        const [result] = await db.query(`DELETE FROM parent_category WHERE category_id = ?`, [category_id]);

        res.json({ message: "Category deleted successfully" });
    } catch (error) {
        console.error("Database Error:", error);
        res.status(500).json({ error: "Failed to delete category" });
    }
};
