-- 基于已经合并的你那边的设备表
-- 统计以下设备数据
-- 机型：Q602S1AX2_V821B，对应海外EU/US/SG 三个区域的，分别统计，
-- 已绑定、已绑定且在线、已绑定且离线数

select
    model,
    data_region_code,
    count(case when user_id is not null then uid end) as 已绑定数,
    count(case when user_id is not null and ddns_status_code=1 then uid end) as 已绑定且在线,
    count(case when user_id is not null and ddns_status_code=0 then uid end) as 已绑定且离线数
from dwd.dwd_dev_device
where model='Q602S1AX2_V821B'
group by model,
    data_region_code
;