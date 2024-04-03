/*Table: Delivery

+-----------------------------+---------+
| Column Name                 | Type    |
+-----------------------------+---------+
| delivery_id                 | int     |
| customer_id                 | int     |
| order_date                  | date    |
| customer_pref_delivery_date | date    |
+-----------------------------+---------+
delivery_id is the column of unique values of this table.
The table holds information about food delivery to customers that make orders at some date and specify a preferred delivery date (on the same order date or after it).
 

If the customer's preferred delivery date is the same as the order date, then the order is called immediate; otherwise, it is called scheduled.

The first order of a customer is the order with the earliest order date that the customer made. It is guaranteed that a customer has precisely one first order.

Write a solution to find the percentage of immediate orders in the first orders of all customers, rounded to 2 decimal places.*/

/* Write your T-SQL query statement below */
SELECT
ROUND(
COUNT(DISTINCT customer_id)*1.0/
(SELECT COUNT(DISTINCT customer_id) FROM Delivery)*1.0*100,
2) AS immediate_percentage
FROM Delivery AS t1
WHERE order_date = customer_pref_delivery_date
AND order_date = (SELECT MIN(order_date)
                    FROM Delivery t2
                    WHERE t1.customer_id =t2.customer_id
                    GROUP BY customer_id);
