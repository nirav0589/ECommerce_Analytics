SELECT
  d.month,
  p.product_category,
  SUM(o.amount) AS total_sales,
  COUNT(DISTINCT o.customer_id) AS unique_customers
FROM {{ ref('orders_enriched') }} o
JOIN {{ ref('stg_products') }} p ON o.product_id = p.product_id
JOIN {{ ref('stg_calendar') }} d ON o.order_date = d.date
GROUP BY d.month, p.product_category