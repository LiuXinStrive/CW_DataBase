-- 1.设备绑定ip后期已经废弃，因为用户发起请求所用的服务器通过多次跳转，导致ip不准
-- 2.关于设备激活每次统计数量不一致，一方面是因为设备上线了，但是还没有绑定用户，从而国家名称也会为空，因为国家名称是用户进行绑定后才会上传；另一方面用户即使上线且绑定了，但因为使用的是旧版本，所以不会上传国家编码；最后一方面是因为统计时的一个时差导致
-- 3.SLS日志只会保留最近一天的日志，对于离线设备是无法找回的

SELECT 
  d.uid AS "设备ID",
	'sg' as 地区,
  FROM_UNIXTIME(d.bind_time / 1000, '%Y-%m-%d %H:%i:%s') as 绑定时间,
	d.country_code as 设备地区code,
	d.country_name as 设备地区,
	d.ip,
	ap.calling_code as 用户地区code,
	ap.country_name as 用户地区
FROM device d
left JOIN app_user ap
  ON d.bind_user_id = ap.id
WHERE 
--   d.`enable` = 1
--   AND d.org_code NOT IN ('04', '07', '0B') 
	d.country_name is null
  and ddns_status>0
  AND d.manufacturer NOT IN (
    '2011043797905911810',
    '2029102456527335426',
    '2059890800580349954',
    '2060239469838061569'
  )
  AND ap.username NOT IN (
    '799150454@qq.com',
    '18689222964@163.com',
    'sunyifan@gmail.com',
    'enchanming@icloud.com',
    'bqpdliligao@gmail.com',
    'yanbinbinok@163.com',
    'mattyanok@163.com',
    '15814475453@163.com',
    'ooa@qq.com',
    'cw1test@test.cn',
    '18689222964',
    '15302725340',
    '15179231710',
    '19821387121',
    '15801856531',
    '13798215786',
    '18840480521'
  )
  AND ap.username NOT LIKE '%@szcwsx.com'
  AND ap.username NOT LIKE '%@sulink365.com'
	;
	
	
	select * from device where uid='SC0006731001205';
	
	
	
SELECT 
 count(*)
FROM device d
left JOIN app_user ap
  ON d.bind_user_id = ap.id
WHERE 
	d.country_name is null
   and ddns_status>0
  AND d.manufacturer NOT IN (
    '2011043797905911810',
    '2029102456527335426',
    '2059890800580349954',
    '2060239469838061569'
  )
  AND ap.username NOT IN (
    '799150454@qq.com',
    '18689222964@163.com',
    'sunyifan@gmail.com',
    'enchanming@icloud.com',
    'bqpdliligao@gmail.com',
    'yanbinbinok@163.com',
    'mattyanok@163.com',
    '15814475453@163.com',
    'ooa@qq.com',
    'cw1test@test.cn',
    '18689222964',
    '15302725340',
    '15179231710',
    '19821387121',
    '15801856531',
    '13798215786',
    '18840480521'
  )
  AND ap.username NOT LIKE '%@szcwsx.com'
  AND ap.username NOT LIKE '%@sulink365.com'
	;

  


UPDATE device t
INNER JOIN app_user d ON t.bind_user_id = d.id
SET t.country_name = d.country_name
WHERE t.country_name IS NULL
  AND t.ddns_status > 0
  AND d.country_name IS NOT NULL
  AND t.manufacturer NOT IN (
    '2011043797905911810',
    '2029102456527335426',
    '2059890800580349954',
    '2060239469838061569'
  )
  AND d.username NOT IN (
    '799150454@qq.com',
    '18689222964@163.com',
    'sunyifan@gmail.com',
    'enchanming@icloud.com',
    'bqpdliligao@gmail.com',
    'yanbinbinok@163.com',
    'mattyanok@163.com',
    '15814475453@163.com',
    'ooa@qq.com',
    'cw1test@test.cn',
    '18689222964',
    '15302725340',
    '15179231710',
    '19821387121',
    '15801856531',
    '13798215786',
    '18840480521'
  )
  AND d.username NOT LIKE '%@szcwsx.com'
  AND d.username NOT LIKE '%@sulink365.com';





drop table device_tem_20260924;
CREATE TABLE `device_tem_20260924` (
    `uid` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '设备uid',
    `client_ip` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'IP',
    `country_code` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '国家编码',
    `country` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '国家名称',
    PRIMARY KEY (`uid`) USING BTREE
)



	UPDATE device t
JOIN device_tem_20260924 tmp
  ON t.uid = tmp.uid
SET t.country_name = tmp.country;

	UPDATE device t
JOIN device_tem_20260924 tmp
  ON t.uid = tmp.uid
SET t.ip = tmp.client_ip;


	UPDATE device t
JOIN device_tem_20260924 tmp
  ON t.uid = tmp.uid
SET t.country_code = tmp.country_code;




-----------------------------------------------从SLS获取指定日志信息------------------------------------------------------
* | SELECT "client_ip", regexp_extract("request_uri", 'uid=([^&]*)', 1) AS "uid" HAVING "uid" IN ('B00005A31002150', 'B00005A31001872')

* | SELECT "client_ip", regexp_extract("request_uri", 'uid=([^&]*)', 1) AS "uid" HAVING "uid" IN ('B00005A31002150', 'B00005A31001872') LIMIT 1
* | set session mode=scan; SELECT "client_ip" FROM (SELECT "client_ip", regexp_extract("request_uri", 'uid=([^&]*)', 1) AS "uid" FROM log GROUP BY "client_ip", "uid" HAVING "uid" IN ('B00005A31002150', 'B00005A31001872')) GROUP BY "client_ip"




