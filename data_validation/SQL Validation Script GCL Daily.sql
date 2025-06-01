-- SQL Validation Script: GCL Daily Feed Integrity Check
-- Author: Aparnaa Mariappan
-- Purpose: Ensure record count, null check, and field-level match between source and target tables

-- 1. Record Count Validation
SELECT 
    COUNT(*) AS source_count
FROM 
    src_GCL_feed
WHERE 
    load_date = CURRENT_DATE;

SELECT 
    COUNT(*) AS target_count
FROM 
    tgt_GCL_reporting
WHERE 
    load_date = CURRENT_DATE;

-- 2. Null Check for Critical Fields in Target
SELECT 
    COUNT(*) AS null_user_id_count
FROM 
    tgt_GCL_reporting
WHERE 
    user_id IS NULL
    AND load_date = CURRENT_DATE;

-- 3. Field-Level Match Sample (Join on record_id)
SELECT 
    s.record_id,
    s.user_id AS source_user_id,
    t.user_id AS target_user_id,
    CASE 
        WHEN s.user_id = t.user_id THEN 'MATCH'
        ELSE 'MISMATCH'
    END AS user_id_comparison
FROM 
    src_GCL_feed s
JOIN 
    tgt_GCL_reporting t
ON 
    s.record_id = t.record_id
WHERE 
    s.load_date = CURRENT_DATE
    AND t.load_date = CURRENT_DATE
    AND s.user_id <> t.user_id;

-- 4. Duplicate Record Check in Target Table
SELECT 
    user_id,
    COUNT(*) AS record_count
FROM 
    tgt_GCL_reporting
WHERE 
    load_date = CURRENT_DATE
GROUP BY 
    user_id
HAVING 
    COUNT(*) > 1;

-- 5. Summary Output
-- (Optional, for reporting dashboards)
SELECT 
    'GCL Feed Validation' AS validation_name,
    CURRENT_DATE AS validation_date,
    (SELECT COUNT(*) FROM src_GCL_feed WHERE load_date = CURRENT_DATE) AS src_count,
    (SELECT COUNT(*) FROM tgt_GCL_reporting WHERE load_date = CURRENT_DATE) AS tgt_count,
    (SELECT COUNT(*) FROM tgt_GCL_reporting WHERE user_id IS NULL AND load_date = CURRENT_DATE) AS null_count;