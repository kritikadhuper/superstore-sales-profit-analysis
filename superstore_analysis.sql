-- Superstore Sales & Profit Analysis
-- Tool: MySQL
-- Dataset: Superstore
-- Records: 10,194

USE superstore_analysis;

SELECT
    `Year`,
    ROUND(SUM(`Sales`), 2) AS total_sales,
    ROUND(SUM(`Profit`), 2) AS total_profit,
    SUM(`Quantity`) AS total_quantity
FROM superstore
GROUP BY `Year`
ORDER BY `Year`;

SELECT
    `Category`,
    ROUND(SUM(`Sales`), 2) AS total_sales,
    ROUND(SUM(`Profit`), 2) AS total_profit,
    SUM(`Quantity`) AS total_quantity,
    ROUND(SUM(`Profit`) / SUM(`Sales`) * 100, 2) AS profit_margin_pct
FROM superstore
GROUP BY `Category`
ORDER BY total_profit DESC;

SELECT
    `Sub-Category`,
    ROUND(AVG(`Discount`) * 100, 2) AS avg_discount_pct,
    ROUND(SUM(`Sales`), 2) AS total_sales,
    ROUND(SUM(`Profit`), 2) AS total_profit,
    ROUND(SUM(`Profit`) / SUM(`Sales`) * 100, 2) AS profit_margin_pct
FROM superstore
GROUP BY `Sub-Category`
ORDER BY avg_discount_pct DESC;

SELECT
    `Region`,
    ROUND(SUM(`Sales`), 2) AS total_sales,
    ROUND(SUM(`Profit`), 2) AS total_profit,
    SUM(`Quantity`) AS total_quantity,
    ROUND(SUM(`Profit`) / SUM(`Sales`) * 100, 2) AS profit_margin_pct
FROM superstore
GROUP BY `Region`
ORDER BY total_sales DESC;

SELECT
    `Customer ID`,
    `Customer Name`,
    ROUND(SUM(`Sales`), 2) AS total_sales,
    ROUND(SUM(`Profit`), 2) AS total_profit,
    SUM(`Quantity`) AS total_quantity
FROM superstore
GROUP BY `Customer ID`, `Customer Name`
ORDER BY total_profit DESC
LIMIT 10;

SELECT
    `Product Name`,
    `Category`,
    `Sub-Category`,
    ROUND(SUM(`Sales`), 2) AS total_sales,
    ROUND(SUM(`Profit`), 2) AS total_profit,
    SUM(`Quantity`) AS total_quantity
FROM superstore
GROUP BY `Product Name`, `Category`, `Sub-Category`
HAVING SUM(`Profit`) < 0
ORDER BY total_profit ASC
LIMIT 20;

