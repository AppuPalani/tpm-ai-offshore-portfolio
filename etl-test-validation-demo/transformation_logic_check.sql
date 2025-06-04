-- Validate transformed revenue
SELECT 
  t.order_id,
  s.amount * s.discount AS expected_discounted_amount,
  t.discounted_amount AS target_value
FROM source_sales_data s
JOIN target_sales_mart t ON s.order_id = t.order_id
WHERE s.amount * s.discount <> t.discounted_amount;
