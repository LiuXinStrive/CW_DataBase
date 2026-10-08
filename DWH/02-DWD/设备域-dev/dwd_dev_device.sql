CREATE MATERIALIZED VIEW dwd.dwd_dev_device
(PRIMARY KEY(id, data_region_code))
REFRESH COMPLETE ON DEMAND
NEXT NOW() + INTERVAL 10 MINUTE
AS
-- 1.合并三区域数据
with device_temp as (
select 
    id, -- 主键ID
    uid, -- 设备uid
    "us" as data_region_code, -- 数据所属区域
    uid_reverse, -- 反向索引
    org_code, -- 组织Code
    model, -- 型号
    manufacturer, -- 厂家code
    camera_sn, -- 包装码
    camera_type, -- 设备类型
    equip_admin, -- 设备用户名
    equip_pass, -- 设备密码
    device_server, -- 设备DDNS服务器
    alarm_server, -- 报警服务器
    connect_type, -- 连接方式
    trade_id, -- 行业ID
    bind_user_id, -- 用户id
    bind_time, -- 绑定时间
    is_share, -- 是否同意分享
    firmware_version, -- 固件版本号
    gmt_create, -- 创建时间
    gmt_modify, -- 修改时间
    plan_id, -- 升级任务计划Id
    plan_status, -- 升级任务状态
    issued_server, -- 服务器下发地址
    plan_retry_size, -- 升级任务重试次数
    plan_modify_time, -- 升级状态变更时间
    black, -- 是否是黑名单
    cloud_server, -- 云存网关
    ddns_status, -- ddns状态
    ddns_status_time, -- ddns状态更新时间
    is_need_card, -- 是否需要绑卡
    default_name, -- 设备默认名称
    iccid, -- 物联网SIM卡识别码
    imei, -- 设备识别码
    assign_time, -- 设备分配时间
    card_org, -- 卡商组织code
    card_status, -- 卡状态
    external_model, -- 外部型号
    ty_id, -- 涂鸦id
    ty_code, -- 涂鸦code
    pid, -- 涂鸦pid
    kcp_port, -- kcp端口
    model_type, -- 模型类型
    model_version, -- 模型版本
    profit, -- 是否分润
    capability, -- 能力集
    capability_key, -- 能力集md5
    interpolation, -- 设备插值
    stream_type, -- 码流类型
    sd_status, -- sd状态
    enable, -- 是否启用
    contract_op_username, -- 导入合约机操作人
    contract_op_time, -- 导入合约机操作时间
    recycle_time, -- 回收操作时间
    promo_type, -- 促销类型
    own_user_id, -- 拥有者
    own_time, -- 拥有时间
    is_produce, -- 是否已生产
    channel, -- 渠道
    produce_time, -- 生产时间
    is_direct, -- 是否定向设备
    direct_op_username, -- 定向设备操作人
    direct_op_time, -- 定向设备操作时间
    ip_operator, -- IP 运营商
    advert_id, -- 广告策略id
    city_id, -- 地区
    province_id, -- 省
    country_id, -- 国家
    merchant_code, -- 所属集群商户
    last_timer, -- 代理商、渠道商最后分配时间
    country_code, -- 国家编码
    country_name, -- 国家名称
    continent_code, -- 洲际编码
    continent_name, -- 洲际名称
    ip -- ip
from ods.ods_us_device
union all 
select 
    id, -- 主键ID
    uid, -- 设备uid
    "eu" as data_region_code, -- 数据所属区域
    uid_reverse, -- 反向索引
    org_code, -- 组织Code
    model, -- 型号
    manufacturer, -- 厂家code
    camera_sn, -- 包装码
    camera_type, -- 设备类型
    equip_admin, -- 设备用户名
    equip_pass, -- 设备密码
    device_server, -- 设备DDNS服务器
    alarm_server, -- 报警服务器
    connect_type, -- 连接方式
    trade_id, -- 行业ID
    bind_user_id, -- 用户id
    bind_time, -- 绑定时间
    is_share, -- 是否同意分享
    firmware_version, -- 固件版本号
    gmt_create, -- 创建时间
    gmt_modify, -- 修改时间
    plan_id, -- 升级任务计划Id
    plan_status, -- 升级任务状态
    issued_server, -- 服务器下发地址
    plan_retry_size, -- 升级任务重试次数
    plan_modify_time, -- 升级状态变更时间
    black, -- 是否是黑名单
    cloud_server, -- 云存网关
    ddns_status, -- ddns状态
    ddns_status_time, -- ddns状态更新时间
    is_need_card, -- 是否需要绑卡
    default_name, -- 设备默认名称
    iccid, -- 物联网SIM卡识别码
    imei, -- 设备识别码
    assign_time, -- 设备分配时间
    card_org, -- 卡商组织code
    card_status, -- 卡状态
    external_model, -- 外部型号
    ty_id, -- 涂鸦id
    ty_code, -- 涂鸦code
    pid, -- 涂鸦pid
    kcp_port, -- kcp端口
    model_type, -- 模型类型
    model_version, -- 模型版本
    profit, -- 是否分润
    capability, -- 能力集
    capability_key, -- 能力集md5
    interpolation, -- 设备插值
    stream_type, -- 码流类型
    sd_status, -- sd状态
    enable, -- 是否启用
    contract_op_username, -- 导入合约机操作人
    contract_op_time, -- 导入合约机操作时间
    recycle_time, -- 回收操作时间
    promo_type, -- 促销类型
    own_user_id, -- 拥有者
    own_time, -- 拥有时间
    is_produce, -- 是否已生产
    channel, -- 渠道
    produce_time, -- 生产时间
    is_direct, -- 是否定向设备
    direct_op_username, -- 定向设备操作人
    direct_op_time, -- 定向设备操作时间
    ip_operator, -- IP 运营商
    advert_id, -- 广告策略id
    city_id, -- 地区
    province_id, -- 省
    country_id, -- 国家
    merchant_code, -- 所属集群商户
    last_timer, -- 代理商、渠道商最后分配时间
    country_code, -- 国家编码
    country_name, -- 国家名称
    continent_code, -- 洲际编码
    continent_name, -- 洲际名称
    ip -- ip
from ods.ods_eu_device
union all 
select 
    id, -- 主键ID
    uid, -- 设备uid
    "sg" as data_region_code, -- 数据所属区域
    uid_reverse, -- 反向索引
    org_code, -- 组织Code
    model, -- 型号
    manufacturer, -- 厂家code
    camera_sn, -- 包装码
    camera_type, -- 设备类型
    equip_admin, -- 设备用户名
    equip_pass, -- 设备密码
    device_server, -- 设备DDNS服务器
    alarm_server, -- 报警服务器
    connect_type, -- 连接方式
    trade_id, -- 行业ID
    bind_user_id, -- 用户id
    bind_time, -- 绑定时间
    is_share, -- 是否同意分享
    firmware_version, -- 固件版本号
    gmt_create, -- 创建时间
    gmt_modify, -- 修改时间
    plan_id, -- 升级任务计划Id
    plan_status, -- 升级任务状态
    issued_server, -- 服务器下发地址
    plan_retry_size, -- 升级任务重试次数
    plan_modify_time, -- 升级状态变更时间
    black, -- 是否是黑名单
    cloud_server, -- 云存网关
    ddns_status, -- ddns状态
    ddns_status_time, -- ddns状态更新时间
    is_need_card, -- 是否需要绑卡
    default_name, -- 设备默认名称
    iccid, -- 物联网SIM卡识别码
    imei, -- 设备识别码
    assign_time, -- 设备分配时间
    card_org, -- 卡商组织code
    card_status, -- 卡状态
    external_model, -- 外部型号
    ty_id, -- 涂鸦id
    ty_code, -- 涂鸦code
    pid, -- 涂鸦pid
    kcp_port, -- kcp端口
    model_type, -- 模型类型
    model_version, -- 模型版本
    profit, -- 是否分润
    capability, -- 能力集
    capability_key, -- 能力集md5
    interpolation, -- 设备插值
    stream_type, -- 码流类型
    sd_status, -- sd状态
    enable, -- 是否启用
    contract_op_username, -- 导入合约机操作人
    contract_op_time, -- 导入合约机操作时间
    recycle_time, -- 回收操作时间
    promo_type, -- 促销类型
    own_user_id, -- 拥有者
    own_time, -- 拥有时间
    is_produce, -- 是否已生产
    channel, -- 渠道
    produce_time, -- 生产时间
    is_direct, -- 是否定向设备
    direct_op_username, -- 定向设备操作人
    direct_op_time, -- 定向设备操作时间
    ip_operator, -- IP 运营商
    advert_id, -- 广告策略id
    city_id, -- 地区
    province_id, -- 省
    country_id, -- 国家
    merchant_code, -- 所属集群商户
    last_timer, -- 代理商、渠道商最后分配时间
    country_code, -- 国家编码
    country_name, -- 国家名称
    continent_code, -- 洲际编码
    continent_name, -- 洲际名称
    ip -- ip
from ods.ods_sg_device
),
-- 2.对激活的设备进行去重清洗,获取唯一的激活设备
device_activate_temp as (
    select
        *
    from(
    select 
        *,
        row_number() over(partition by uid order by  ddns_status_time desc) as rn
    from device_temp 
    where ddns_status>0 
    ) t1 where rn=1
)

-- 4.合并激活和离线唯一数据，对数据清洗转换
select
    t1.id, -- 主键ID
    t1.uid, -- 设备uid
    t1.data_region_code, -- 数据所属区域
    t1.uid_reverse as uid_reverse, -- 反向索引
    t1.org_code as org_code, -- 组织Code
    t1.model as model, -- 型号
    t1.manufacturer as factory_code, -- 厂家code
    t2.factory_name as factory_name, -- 厂家名称
    t1.camera_sn as camera_sn, -- 包装码
    t1.camera_type as camera_type, -- 设备类型
    t1.equip_admin as equip_admin, -- 设备用户名
    t1.equip_pass as equip_pass, -- 设备密码
    t1.device_server as device_server, -- 设备DDNS服务器
    t1.alarm_server as alarm_server, -- 报警服务器
    t1.connect_type as connect_type, -- 连接方式
    t1.trade_id as trade_id, -- 行业ID
    t1.bind_user_id as user_id, -- 用户id
    FROM_UNIXTIME(t1.bind_time DIV 1000) as bind_time, -- 绑定时间
    t1.is_share as is_share, -- 是否同意分享
    t1.firmware_version as firmware_version, -- 固件版本号
    FROM_UNIXTIME(t1.gmt_create DIV 1000) as gmt_create, -- 创建时间
    FROM_UNIXTIME(t1.gmt_modify DIV 1000) as gmt_modify, -- 修改时间
    t1.plan_id as plan_id, -- 升级任务计划Id
    t1.plan_status as plan_status_code, -- 升级任务状态
    case when t1.plan_status=-1 then '升级失败'
         when t1.plan_status=0 then '无状态'
         when t1.plan_status=1 then '升级成功'
         when t1.plan_status=2 then '待下发'
         when t1.plan_status=3 then '下发失败'
         when t1.plan_status=4 then '下发成功'
         when t1.plan_status=5 then '下载成功'
         when t1.plan_status=6  then '下发中'
    end as plan_status_name, -- 升级任务状态
    t1.issued_server as issued_server, -- 服务器下发地址
    t1.plan_retry_size as plan_retry_size, -- 升级任务重试次数
    FROM_UNIXTIME(t1.plan_modify_time DIV 1000) as plan_modify_time, -- 升级状态变更时间
    t1.black as black, -- 是否是黑名单
    t1.cloud_server as cloud_server, -- 云存网关
    t1.ddns_status as ddns_status_code, -- ddns状态
    case when t1.ddns_status=1 then '在线'
         when t1.ddns_status=2 then '休眠'
         when t1.ddns_status=3 then '待机'
         when t1.ddns_status=0 then '离线'
    end as ddns_status_name, -- ddns状态
    FROM_UNIXTIME(t1.ddns_status_time DIV 1000) as ddns_status_time, -- ddns状态更新时间
    t1.is_need_card as is_need_card, -- 是否需要绑卡
    t1.default_name as default_name, -- 设备默认名称
    t1.iccid as iccid, -- 物联网SIM卡识别码
    t1.imei as imei, -- 设备识别码
    FROM_UNIXTIME(t1.assign_time DIV 1000) as assign_time, -- 设备分配时间
    t1.card_org as card_org, -- 卡商组织code
    t1.card_status as card_status, -- 卡状态
    t1.external_model as external_model, -- 外部型号
    t1.ty_id as ty_id, -- 涂鸦id
    t1.ty_code as ty_code, -- 涂鸦code
    t1.pid as pid, -- 涂鸦pid
    t1.kcp_port as kcp_port, -- kcp端口
    t1.model_type as model_type, -- 模型类型
    t1.model_version as model_version, -- 模型版本
    t1.profit as profit, -- 是否分润
    t1.capability as capability, -- 能力集
    t1.capability_key as capability_key, -- 能力集md5
    t1.interpolation as interpolation, -- 设备插值
    t1.stream_type as stream_type, -- 码流类型
    t1.sd_status as sd_status_code, -- sd状态code
    case when t1.sd_status=0 then '无卡'
        when t1.sd_status=1 then '卡正常'
        when t1.sd_status=2 then '卡未格式化或者卡异常'
        when t1.sd_status=3 then '卡格式化中'
        when t1.sd_status=4 then '卡已满'
    end as sd_status_name, -- sd状态名称
    t1.enable as enable, -- 是否启用
    t1.contract_op_username as contract_op_username, -- 导入合约机操作人
    FROM_UNIXTIME(t1.contract_op_time DIV 1000) as contract_op_time, -- 导入合约机操作时间
    FROM_UNIXTIME(t1.recycle_time DIV 1000) as recycle_time, -- 回收操作时间
    t1.promo_type as promo_type, -- 促销类型
    t1.own_user_id as own_user_id, -- 拥有者
    FROM_UNIXTIME(t1.own_time DIV 1000) as own_time, -- 拥有时间
    t1.is_produce as is_produce, -- 是否已生产
    t1.channel as channel, -- 渠道
    FROM_UNIXTIME(t1.produce_time DIV 1000) as produce_time, -- 生产时间
    t1.is_direct as is_direct, -- 是否定向设备
    t1.direct_op_username as direct_op_username, -- 定向设备操作人
    FROM_UNIXTIME(t1.direct_op_time DIV 1000) as direct_op_time, -- 定向设备操作时间
    t1.ip_operator as ip_operator, -- IP运营商
    t1.advert_id as advert_id, -- 广告策略id
    t1.city_id as city_id, -- 地区
    t1.province_id as province_id, -- 省
    t1.country_id as country_id, -- 国家
    t1.merchant_code as merchant_code, -- 所属集群商户
    FROM_UNIXTIME(t1.last_timer DIV 1000) as last_timer, -- 代理商、渠道商最后分配时间
    t1.country_code as country_code, -- 国家编码
    t1.country_name as country_name, -- 国家名称
    t1.continent_code as continent_code, -- 洲际编码
    t1.continent_name as continent_name, -- 洲际名称
    t1.ip,
    NOW() as process_time -- 数据处理时间
from device_activate_temp t1
left join dim.dim_factory_customer t2 on t2.data_region_code=t1.data_region_code and t2.factory_code=t1.manufacturer
union all
select 
    t1.id, -- 主键ID
    t1.uid, -- 设备uid
    t1.data_region_code, -- 数据所属区域
    t1.uid_reverse as uid_reverse, -- 反向索引
    t1.org_code as org_code, -- 组织Code
    t1.model as model, -- 型号
    t1.manufacturer as factory_code, -- 厂家code
    t2.factory_name as factory_name, -- 厂家名称
    t1.camera_sn as camera_sn, -- 包装码
    t1.camera_type as camera_type, -- 设备类型
    t1.equip_admin as equip_admin, -- 设备用户名
    t1.equip_pass as equip_pass, -- 设备密码
    t1.device_server as device_server, -- 设备DDNS服务器
    t1.alarm_server as alarm_server, -- 报警服务器
    t1.connect_type as connect_type, -- 连接方式
    t1.trade_id as trade_id, -- 行业ID
    t1.bind_user_id as user_id, -- 用户id
    FROM_UNIXTIME(t1.bind_time DIV 1000) as bind_time, -- 绑定时间
    t1.is_share as is_share, -- 是否同意分享
    t1.firmware_version as firmware_version, -- 固件版本号
    FROM_UNIXTIME(t1.gmt_create DIV 1000) as gmt_create, -- 创建时间
    FROM_UNIXTIME(t1.gmt_modify DIV 1000) as gmt_modify, -- 修改时间
    t1.plan_id as plan_id, -- 升级任务计划Id
    t1.plan_status as plan_status_code, -- 升级任务状态
    case when t1.plan_status=-1 then '升级失败'
         when t1.plan_status=0 then '无状态'
         when t1.plan_status=1 then '升级成功'
         when t1.plan_status=2 then '待下发'
         when t1.plan_status=3 then '下发失败'
         when t1.plan_status=4 then '下发成功'
         when t1.plan_status=5 then '下载成功'
         when t1.plan_status=6  then '下发中'
    end as plan_status_name, -- 升级任务状态
    t1.issued_server as issued_server, -- 服务器下发地址
    t1.plan_retry_size as plan_retry_size, -- 升级任务重试次数
    FROM_UNIXTIME(t1.plan_modify_time DIV 1000) as plan_modify_time, -- 升级状态变更时间
    t1.black as black, -- 是否是黑名单
    t1.cloud_server as cloud_server, -- 云存网关
    t1.ddns_status as ddns_status_code, -- ddns状态
    case when t1.ddns_status=1 then '在线'
         when t1.ddns_status=2 then '休眠'
         when t1.ddns_status=3 then '待机'
         when t1.ddns_status=0 then '离线'
    end as ddns_status_name, -- ddns状态
    FROM_UNIXTIME(t1.ddns_status_time DIV 1000) as ddns_status_time, -- ddns状态更新时间
    t1.is_need_card as is_need_card, -- 是否需要绑卡
    t1.default_name as default_name, -- 设备默认名称
    t1.iccid as iccid, -- 物联网SIM卡识别码
    t1.imei as imei, -- 设备识别码
    FROM_UNIXTIME(t1.assign_time DIV 1000) as assign_time, -- 设备分配时间
    t1.card_org as card_org, -- 卡商组织code
    t1.card_status as card_status, -- 卡状态
    t1.external_model as external_model, -- 外部型号
    t1.ty_id as ty_id, -- 涂鸦id
    t1.ty_code as ty_code, -- 涂鸦code
    t1.pid as pid, -- 涂鸦pid
    t1.kcp_port as kcp_port, -- kcp端口
    t1.model_type as model_type, -- 模型类型
    t1.model_version as model_version, -- 模型版本
    t1.profit as profit, -- 是否分润
    t1.capability as capability, -- 能力集
    t1.capability_key as capability_key, -- 能力集md5
    t1.interpolation as interpolation, -- 设备插值
    t1.stream_type as stream_type, -- 码流类型
    t1.sd_status as sd_status_code, -- sd状态code
    case when t1.sd_status=0 then '无卡'
        when t1.sd_status=1 then '卡正常'
        when t1.sd_status=2 then '卡未格式化或者卡异常'
        when t1.sd_status=3 then '卡格式化中'
        when t1.sd_status=4 then '卡已满'
    end as sd_status_name, -- sd状态名称
    t1.enable as enable, -- 是否启用
    t1.contract_op_username as contract_op_username, -- 导入合约机操作人
    FROM_UNIXTIME(t1.contract_op_time DIV 1000) as contract_op_time, -- 导入合约机操作时间
    FROM_UNIXTIME(t1.recycle_time DIV 1000) as recycle_time, -- 回收操作时间
    t1.promo_type as promo_type, -- 促销类型
    t1.own_user_id as own_user_id, -- 拥有者
    FROM_UNIXTIME(t1.own_time DIV 1000) as own_time, -- 拥有时间
    t1.is_produce as is_produce, -- 是否已生产
    t1.channel as channel, -- 渠道
    FROM_UNIXTIME(t1.produce_time DIV 1000) as produce_time, -- 生产时间
    t1.is_direct as is_direct, -- 是否定向设备
    t1.direct_op_username as direct_op_username, -- 定向设备操作人
    FROM_UNIXTIME(t1.direct_op_time DIV 1000) as direct_op_time, -- 定向设备操作时间
    t1.ip_operator as ip_operator, -- IP运营商
    t1.advert_id as advert_id, -- 广告策略id
    t1.city_id as city_id, -- 地区
    t1.province_id as province_id, -- 省
    t1.country_id as country_id, -- 国家
    t1.merchant_code as merchant_code, -- 所属集群商户
    FROM_UNIXTIME(t1.last_timer DIV 1000) as last_timer, -- 代理商、渠道商最后分配时间
    t1.country_code as country_code, -- 国家编码
    t1.country_name as country_name, -- 国家名称
    t1.continent_code as continent_code, -- 洲际编码
    t1.continent_name as continent_name, -- 洲际名称
    t1.ip,
    NOW() as process_time -- 数据处理时间
from(
    select
        *
    from(
        -- 3.离线数据清洗，根据最新绑定时间对离线数据精心排序且排除已激活的设备，获取唯一离线设备
        select 
            *,
            row_number() over(partition by uid order by  ddns_status_time desc) as rn
        from device_temp
        where ddns_status<1 
        and not exists (
        select 1 from device_activate_temp a
        where a.uid = device_temp.uid
        )
    )tt where rn=1
)t1 
left join dim.dim_factory_customer t2 on t2.data_region_code=t1.data_region_code and t2.factory_code=t1.manufacturer
;