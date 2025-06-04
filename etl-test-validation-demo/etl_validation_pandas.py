import pandas as pd

source = pd.read_csv('data/source_sales_data.csv')
target = pd.read_csv('data/target_sales_mart.csv')

# Row count validation
assert len(source) == len(target), "Row count mismatch!"

# Null check
nulls = target[target['discounted_amount'].isnull()]
print("Null entries in target:", nulls)

# Transformation validation
merged = pd.merge(source, target, on='order_id')
merged['expected'] = merged['amount'] * merged['discount']
merged['mismatch'] = merged['expected'] != merged['discounted_amount']
print("Transformation mismatches:", merged[merged['mismatch']])
