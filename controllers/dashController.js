import db from '../config/db.js';

export const dashboardData = async (req, res) => {
  const query = `
    SELECT * FROM clients;
    SELECT * FROM orders;
    SELECT * FROM calendar 
    WHERE deadlineDate >= CURDATE() 
    AND DATEDIFF(deadlineDate, CURDATE()) <= 5 
    ORDER BY deadlineDate ASC 
    LIMIT 2;
  `;

  try {
    const [results] = await db.query(query); // <-- no callback here

    res.status(200).json({
      clients: results[0],
      orders: results[1],
      upcomingTasks: results[2]
    });
  } catch (err) {
    console.log("Dashboard Query Error:", err);
    res.status(500).json({ message: "Error fetching dashboard data", error: err });
  }
};
