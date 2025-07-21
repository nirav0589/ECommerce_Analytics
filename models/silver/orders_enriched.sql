SELECT 
  o.order_id,
  o.customer_id,
  c.customer_name,
  o.product_id,
  p.product_name,
  p.product_category,
  p.price AS product_price,
  o.order_date,
  d.month,
  o.amount
FROM {{ ref('stg_orders') }} o
LEFT JOIN {{ ref('stg_customers') }} c ON o.customer_id = c.customer_id
LEFT JOIN {{ ref('stg_products') }} p ON o.product_id = p.product_id
LEFT JOIN {{ ref('stg_calendar') }} d ON o.order_date = d.date