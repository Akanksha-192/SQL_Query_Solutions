/*Table: Transactions

+---------------+---------+
| Column Name   | Type    |
+---------------+---------+
| id            | int     |
| country       | varchar |
| state         | enum    |
| amount        | int     |
| trans_date    | date    |
+---------------+---------+
id is the primary key of this table.
The table has information about incoming transactions.
The state column is an enum of type ["approved", "declined"].
 

Write an SQL query to find for each month and country, the number of transactions and their total amount, the number of approved transactions and their total amount.

Return the result table in any order.*/

SELECT
  LEFT(t.trans_date, '7') month,
  t.country country,
  COUNT(*) trans_count,
  SUM(t.amount) trans_total_amount,
  SUM(CASE WHEN t.state = 'approved' THEN 1 ELSE 0 END) AS approved_count,
  SUM(CASE WHEN t.state = 'approved' THEN t.amount ELSE 0 END) AS approved_total_amount
FROM Transactions t
GROUP BY LEFT(t.trans_date, '7'), t.country;