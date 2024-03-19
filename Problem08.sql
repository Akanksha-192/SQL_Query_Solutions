/*Table: Visits
+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| visit_id    | int     |
| customer_id | int     |
+-------------+---------+
visit_id is the column with unique values for this table.
This table contains information about the customers who visited the mall.
Table: Transactions
+----------------+---------+
| Column Name    | Type    |
+----------------+---------+
| transaction_id | int     |
| visit_id       | int     |
| amount         | int     |
+----------------+---------+
transaction_id is column with unique values for this table.
This table contains information about the transactions made during the visit_id.
Write a solution to find the IDs of the users who visited without making any transactions and the number of times they made these types of visits.
Return the result table sorted in any order.*/

/* Write your T-SQL query statement below */
SELECT v.customer_id AS customer_id , count(v.visit_id) as count_no_trans
FROM Visits v
LEFT JOIN Transactions t
ON t.visit_id=v.visit_id
WHERE t.transaction_id is null 
group by customer_id;

