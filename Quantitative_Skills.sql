
select * from dbo.['User Data$'];
select * from dbo.['Week Total Purchases$'];

-- the following query merges the two tables using Joins
SELECT 
    u.user_id, 
    u.cohort, 
    u.has_first_name, 
    u.has_last_name, 
    u.has_verfied_email,
    u.has_phone,
    w.[week 1], w.[week 2], w.[week 3], w.[week 4], 
	w.[week 5], w.[week 6], w.[week 7], w.[week 8], 
	w.[week 9], w.[week 10], w.[week 11], w.[week 12], 
	w.[week 13], w.[week 14], w.[week 15]
FROM 
    dbo.['User Data$'] u
JOIN 
    dbo.['Week Total Purchases$'] w ON u.user_id = w.userid;

-- The following SQL query returns us the total purchases per week 

SELECT
    SUM([week 1]) as total_purchases_in_week_1,
    SUM([week 2]) as total_purchases_in_week_2,
	SUM([week 3]) as total_purchases_in_week_3,
	SUM([week 4]) as total_purchases_in_week_4,
	SUM([week 5]) as total_purchases_in_week_5,
	SUM([week 6]) as total_purchases_in_week_6,
	SUM([week 7]) as total_purchases_in_week_7,
	SUM([week 8]) as total_purchases_in_week_8,
	SUM([week 9]) as total_purchases_in_week_9,
	SUM([week 10]) as total_purchases_in_week_10,
	SUM([week 11]) as total_purchases_in_week_11,
	SUM([week 12]) as total_purchases_in_week_12,
	SUM([week 13]) as total_purchases_in_week_13,
	SUM([week 14]) as total_purchases_in_week_14,
	SUM([week 15]) as total_purchases_in_week_15
FROM
    dbo.['Week Total Purchases$'];

--The following query returns sum of purchaes per week in a different style/format as compared to the above one 

SELECT 'Week 1' as week, SUM([week 1]) as total_purchases
FROM dbo.['Week Total Purchases$']
UNION ALL
SELECT 'Week 2' as week, SUM([week 2]) as total_purchases
FROM dbo.['Week Total Purchases$']
union all	
SELECT 'Week 3' as week, SUM([week 3]) as total_purchases
FROM dbo.['Week Total Purchases$']
union All
SELECT 'Week 4' as week, SUM([week 4]) as total_purchases
FROM dbo.['Week Total Purchases$']
union All
SELECT 'Week 5' as week, SUM([week 5]) as total_purchases
FROM dbo.['Week Total Purchases$']
union All
SELECT 'Week 6' as week, SUM([week 6]) as total_purchases
FROM dbo.['Week Total Purchases$']
union All
SELECT 'Week 7' as week, SUM([week 7]) as total_purchases
FROM dbo.['Week Total Purchases$']
union All
SELECT 'Week 8' as week, SUM([week 8]) as total_purchases
FROM dbo.['Week Total Purchases$']
union All
SELECT 'Week 9' as week, SUM([week 9]) as total_purchases
FROM dbo.['Week Total Purchases$']
union All
SELECT 'Week 10' as week, SUM([week 10]) as total_purchases
FROM dbo.['Week Total Purchases$']
union All
SELECT 'Week 11' as week, SUM([week 11]) as total_purchases
FROM dbo.['Week Total Purchases$']
union All
SELECT 'Week 12' as week, SUM([week 12]) as total_purchases
FROM dbo.['Week Total Purchases$']
union All
SELECT 'Week 13' as week, SUM([week 13]) as total_purchases
FROM dbo.['Week Total Purchases$']
union All
SELECT 'Week 14' as week, SUM([week 14]) as total_purchases
FROM dbo.['Week Total Purchases$']
union All
SELECT 'Week 15' as week, SUM([week 15]) as total_purchases
FROM dbo.['Week Total Purchases$'];

--The following query results in telling us which cohort made the most purchases
select u.cohort, SUM(w.[week 1] + w.[week 2] + 
w.[week 3] + w.[week 4] + w.[week 5] + w.[week 6] 
+ w.[week 7] + w.[week 8] + w.[week 9] + w.[week 10] 
+ w.[week 11] + w.[week 12] + w.[week 13] + 
w.[week 14] + w.[week 15]) as purchase_per_cohort
from dbo.['User Data$'] u 
join
dbo.['Week Total Purchases$'] w 
on u.user_id = w.userid
group by u.cohort
order by purchase_per_cohort desc;

-- The Following query results in weekly purchases by each cohort 
select u.cohort, SUM(w.[week 1]) as total_purchases_in_week1, 
SUM(w.[week 2]) as total_purchases_in_week2, SUM(w.[week 3]) as total_purchases_in_week3, 
SUM(w.[week 4]) as total_purchases_in_week4,
SUM(w.[week 5]) as total_purchases_in_week5, SUM(w.[week 6]) as total_purchases_in_week6, 
SUM(w.[week 7]) as total_purchases_in_week7,SUM(w.[week 8]) as total_purchases_in_week8,
SUM(w.[week 9]) as total_purchases_in_week_9, SUM(w.[week 10]) as total_purchases_in_week10, 
SUM(w.[week 11]) as total_purchases_in_week11, SUM(w.[week 12]) as total_purchases_in_week12,
SUM(w.[week 13]) as total_purchases_in_week13, SUM(w.[week 14]) as total_purchases_in_week14, 
SUM(w.[week 15]) as total_purchases_in_week15
from dbo.['User Data$'] u 
join dbo.['Week Total Purchases$'] w 
on u.user_id = w.userid
group by u.cohort
order by u.cohort asc;




