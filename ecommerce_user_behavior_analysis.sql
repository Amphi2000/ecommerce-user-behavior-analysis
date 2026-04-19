RENAME TABLE ecommerce.`2019-oct` TO ecommerce.events;

USE ecommerce;

SELECT * 
FROM ecommerce.events
LIMIT 10;

SELECT
    COUNT(DISTINCT user_id) AS total_users,
    COUNT(DISTINCT CASE WHEN event_type = 'view' THEN user_id END) AS viewed_users,
    COUNT(DISTINCT CASE WHEN event_type = 'cart' THEN user_id END) AS cart_users,
    COUNT(DISTINCT CASE WHEN event_type = 'purchase' THEN user_id END) AS purchased_users
FROM ecommerce.events;

SELECT COUNT(DISTINCT user_id) AS purchase_without_cart
FROM ecommerce.events
WHERE event_type = 'purchase'
AND user_id NOT IN (
    SELECT DISTINCT user_id
    FROM ecommerce.events
    WHERE event_type = 'cart'
);

SELECT
    COUNT(DISTINCT user_id) AS total_users,
    
    COUNT(DISTINCT CASE WHEN event_type = 'view' THEN user_id END) AS viewed_users,
    
    COUNT(DISTINCT CASE WHEN event_type = 'cart' THEN user_id END) AS cart_users,
    
    COUNT(DISTINCT CASE WHEN event_type = 'purchase' THEN user_id END) AS purchased_users,

    COUNT(DISTINCT CASE WHEN event_type = 'cart' THEN user_id END) 
        / COUNT(DISTINCT CASE WHEN event_type = 'view' THEN user_id END) AS view_to_cart_rate,

    COUNT(DISTINCT CASE WHEN event_type = 'purchase' THEN user_id END) 
        / COUNT(DISTINCT CASE WHEN event_type = 'view' THEN user_id END) AS view_to_purchase_rate

FROM ecommerce.events;

SELECT
    category_code,

    COUNT(DISTINCT user_id) AS total_users,

    COUNT(DISTINCT CASE WHEN event_type = 'view' THEN user_id END) AS viewed_users,

    COUNT(DISTINCT CASE WHEN event_type = 'cart' THEN user_id END) AS cart_users,

    COUNT(DISTINCT CASE WHEN event_type = 'purchase' THEN user_id END) AS purchased_users

FROM ecommerce.events
WHERE category_code IS NOT NULL
GROUP BY category_code
ORDER BY purchased_users DESC
LIMIT 10;

SELECT
    category_code,

    COUNT(DISTINCT CASE WHEN event_type = 'view' THEN user_id END) AS viewed_users,

    COUNT(DISTINCT CASE WHEN event_type = 'purchase' THEN user_id END) AS purchased_users,

    ROUND(
        COUNT(DISTINCT CASE WHEN event_type = 'purchase' THEN user_id END) 
        / COUNT(DISTINCT CASE WHEN event_type = 'view' THEN user_id END) * 100, 2
    ) AS conversion_rate_pct

FROM ecommerce.events
WHERE category_code IS NOT NULL
GROUP BY category_code
ORDER BY conversion_rate_pct DESC
LIMIT 10;