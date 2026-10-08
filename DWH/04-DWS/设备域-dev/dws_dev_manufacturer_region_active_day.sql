CREATE MATERIALIZED VIEW dws.dws_dev_manufacturer_region_active_day
(PRIMARY KEY(stat_date, data_region_code,factory_name))
REFRESH COMPLETE ON DEMAND
NEXT NOW() + INTERVAL 10 MINUTE
AS
WITH day_agg AS (
    SELECT
        DATE(bind_time) AS stat_date,
        data_region_code,
        factory_name,
        COUNT(uid) AS active_device_day_cnt
    FROM dwd.dwd_dev_device
    WHERE ddns_status_code > 0
    GROUP BY stat_date, data_region_code, factory_name
)
SELECT
    stat_date,
    data_region_code,
    factory_name,
    SUM(active_device_day_cnt) OVER (PARTITION BY data_region_code, factory_name ORDER BY stat_date ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS active_device_total_cnt,
    active_device_day_cnt,
    NOW() AS process_time
FROM day_agg
order by stat_date desc,data_region_code desc,active_device_day_cnt desc
;
