CREATE MATERIALIZED VIEW dwd.dwd_dev_device_user_rela
(PRIMARY KEY(id, data_region_code))
REFRESH COMPLETE ON DEMAND
NEXT NOW() + INTERVAL 10 MINUTE
AS
-- 三区数据合并
with  device_user_rela_temp as (
    select
        id, -- 主键ID
        "us" as data_region_code, -- 数据所属区域
        app_user_id, -- 用户ID
        uid, -- 设备ID
        country_code, -- 国家编码
        country_name, -- 国家
        group_id, -- 设备分组
        channel_no, -- 通道号
        device_name, -- 设备名称
        bind_time, -- 绑定时间
        type, -- 绑定类型code
        purview, -- 权限范围
        remark_name, -- 备注昵称
        push_flag, -- 设备推送状态code
        flag_end_time, -- 推送状态关闭时间
        gmt_modify -- 修改时间
    from ods.ods_us_app_group_device_rela
    union all
    select
        id, -- 主键ID
        "eu" as data_region_code, -- 数据所属区域
        app_user_id, -- 用户ID
        uid, -- 设备ID
        country_code, -- 国家编码
        country_name, -- 国家
        group_id, -- 设备分组
        channel_no, -- 通道号
        device_name, -- 设备名称
        bind_time, -- 绑定时间
        type, -- 绑定类型code
        purview, -- 权限范围
        remark_name, -- 备注昵称
        push_flag, -- 设备推送状态code
        flag_end_time, -- 推送状态关闭时间
        gmt_modify -- 修改时间
    from ods.ods_eu_app_group_device_rela
    union all
    select
        id, -- 主键ID
        "sg" as data_region_code, -- 数据所属区域
        app_user_id, -- 用户ID
        uid, -- 设备ID
        country_code, -- 国家编码
        country_name, -- 国家
        group_id, -- 设备分组
        channel_no, -- 通道号
        device_name, -- 设备名称
        bind_time, -- 绑定时间
        type, -- 绑定类型code
        purview, -- 权限范围
        remark_name, -- 备注昵称
        push_flag, -- 设备推送状态code
        flag_end_time, -- 推送状态关闭时间
        gmt_modify -- 修改时间
    from ods.ods_sg_app_group_device_rela
),
-- 按照设备ID和用户ID进行分组，然后通过修改时间进行降序
device_user_rela_desc_temp as (
    select
        *
    from(
    select 
        *,
        row_number() over(partition by app_user_id,uid order by gmt_modify desc ) as rn
    from device_user_rela_temp
    )t1 where rn=1
)
select 
    id, -- 主键ID
    data_region_code, -- 数据所属区域
    app_user_id as user_id, -- 用户ID
    uid as uid, -- 设备ID
    country_code as country_code, -- 国家编码
    country_name as country_name, -- 国家
    group_id as group_id, -- 设备分组
    channel_no as channel_no, -- 通道号
    device_name as device_name, -- 设备名称
    FROM_UNIXTIME(bind_time DIV 1000)  as bind_time, -- 绑定时间
    type as type_code, -- 绑定类型code
    case when type=1 then '绑定'
         when type=2 then '分享'
    end as type_name, -- 绑定类型名称
    purview as purview, -- 权限范围
    remark_name as remark_name, -- 备注昵称
    push_flag as push_flag_code, -- 设备推送状态code
    case  when type=0 then '开启'
          when type=1 then '关闭'
          when type=2 then '30分钟关闭'
          when type=3 then '2小时关闭'
          when type=4 then '4小时关闭'
          when type=5 then '12小时关闭'
    end as push_flag_name, -- 设备推送状态名称
    FROM_UNIXTIME(flag_end_time DIV 1000) as flag_end_time, -- 推送状态关闭时间
    FROM_UNIXTIME(gmt_modify DIV 1000) as gmt_modify -- 修改时间
from device_user_rela_desc_temp