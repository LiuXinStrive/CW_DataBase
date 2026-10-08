CREATE MATERIALIZED VIEW dim.dim_factory_customer
(PRIMARY KEY(user_id, data_region_code))
REFRESH COMPLETE ON DEMAND
NEXT NOW() + INTERVAL 10 MINUTE
AS
select 
    id as user_id, -- 主键ID
    "us" as data_region_code, -- 数据所属区域
    one_customer as one_customer, -- 一级客户
    code as factory_code, -- 工厂code
    factory_name as factory_name, -- 工厂名称
    card_ids as card_ids, -- 卡商
    FROM_UNIXTIME(gmt_create DIV 1000) as gmt_create, -- 创建时间
    NOW() as process_time -- 数据处理时间
from ods.ods_us_factory_manager
union all 
select 
    id as user_id, -- 主键ID
    "eu" as data_region_code, -- 数据所属区域
    one_customer as one_customer, -- 一级客户
    code as factory_code, -- 工厂code
    factory_name as factory_name, -- 工厂名称
    card_ids as card_ids, -- 卡商
    FROM_UNIXTIME(gmt_create DIV 1000) as gmt_create, -- 创建时间
    NOW() as process_time -- 数据处理时间
from ods.ods_eu_factory_manager
union all
select 
    id as user_id, -- 主键ID
    "sg" as data_region_code, -- 数据所属区域
    one_customer as one_customer, -- 一级客户
    code as factory_code, -- 工厂code
    factory_name as factory_name, -- 工厂名称
    card_ids as card_ids, -- 卡商
    FROM_UNIXTIME(gmt_create DIV 1000) as gmt_create, -- 创建时间
    NOW() as process_time -- 数据处理时间
from ods.ods_sg_factory_manager
;