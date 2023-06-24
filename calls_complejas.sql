USE calls;
describe megaline_users;
select*from megaline_plans;
SELECT
    YEAR(call_date) AS year,
    MONTH(call_date) AS month,
    WEEK(call_date)	AS week,
    ROUND(AVG(duration),2) AS average_duration,
	ROUND(MAX(duration),2) AS max,
	STD(duration)/AVG(duration) AS CV
FROM
    megaline_calls
GROUP BY
    YEAR(call_date),
    MONTH(call_date),
    WEEK(call_date);