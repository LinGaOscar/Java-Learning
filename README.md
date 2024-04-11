# Java-Learning
## 產生報表統計每小時各別 ec\_id 的總交易量

首先，您可以使用以下 SQL 查詢來取得所有不同的 ec\_id：

```sql
SELECT DISTINCT ec_id INTO @total_ec_id FROM your_table_name;
```

接著，您可以使用以下 SQL 查詢來實現您的需求：

```sql
SET @query = CONCAT(
    'SELECT',
    ' HOUR(trade_date) AS hour_of_day,'
);

SELECT
    GROUP_CONCAT(
        CONCAT(
            'SUM(CASE WHEN ec_id = \'',
            ec_id,
            '\' THEN 1 ELSE 0 END) AS ',
            QUOTE(ec_id),
            '_total_trades'
        )
    ) INTO @subquery
FROM
    (SELECT DISTINCT ec_id FROM your_table_name) AS ec_ids;

SET @query = CONCAT(@query, @subquery, '
FROM
    your_table_name
WHERE
    trade_date >= ''2024-03-01 00:00:00'' AND trade_date < ''2024-04-01 00:00:00''
GROUP BY
    HOUR(trade_date)
ORDER BY
    HOUR(trade_date)
');

PREPARE stmt FROM @query;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
```

這個查詢將根據每小時統計每個 ec\_id 的總交易量，並且將結果按照小時排序。請將 `your_table_name` 替換為您的實際表名。這個查詢將動態創建欄位名稱，並將結果按照小時排序。

Sources
