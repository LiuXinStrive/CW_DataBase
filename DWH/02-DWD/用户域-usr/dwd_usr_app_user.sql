CREATE MATERIALIZED VIEW dwd.dwd_usr_app_user
(PRIMARY KEY(user_id, data_region_code))
REFRESH COMPLETE ON DEMAND
NEXT NOW() + INTERVAL 10 MINUTE
AS
select 
    id as user_id, -- 主键ID
    "us" as data_region_code, -- 数据所属区域
    username AS user_name, -- 账号（手机号）
    password AS pass_word, -- 密码
    nickname AS nick_name, -- 昵称
    sex AS sex_code, -- 性别code
    case when sex=1 then '男' 
         when sex=2 then '女'
         when sex=0 then '未知'
    end AS sex_name, -- 性别中文
    region AS region, -- 区域
    calling_code AS calling_code, -- 国际区号
    country_code AS country_code, -- 国家编码
    country_name AS country_name, -- 国家
    address AS address, -- 地址
    app AS app, -- 所属app
    wx_id AS wx_id, -- wx openid
    wx_name AS wx_name, -- wx openid
    apple_sub AS apple_sub, -- 苹果sub账号
    app_version AS app_version, -- 用户登录设备版本号
    platform AS platform, -- 用户登录设备
    app_salt AS app_salt, -- 用户登录签名盐值
    ty_pass AS ty_pass, -- 涂鸦密码
    google_sub AS google_sub, -- google sub账号标识
    status AS user_status, -- 用户状态 
    register_type AS register_type, -- 注册方式 
    FROM_UNIXTIME(reg_time DIV 1000) AS reg_time, -- 注册时间
    FROM_UNIXTIME(gmt_modify DIV 1000) AS gmt_modify, -- 更新时间
    is_bind_device AS is_bind_device, -- 是否绑定过设备 
    app_name AS app_name, -- 用户登录app名称
    token AS token, -- app登录最新token值
    user_update_policy AS user_update_policy, -- 用户操作广告开关
    advert_type AS advert_type, -- 广告操作类型
    advert_status AS advert_status_code, -- 广告状态code
    case when advert_status=0 then '全广告' 
         when advert_status=1 then '全关'
         when advert_status=2 then '限量广告'
         when advert_status=3 then '新用户广告'
    end AS advert_status_name, -- 广告状态
    advert_user_name AS advert_user_name, -- 广告状态修改人
    FROM_UNIXTIME(advert_time DIV 1000) AS advert_time, -- 广告下次开启时间
    eye_care AS eye_care, -- 护眼模式
    cloud_record_speed AS cloud_record_speed, -- 云录像加速播放
    FROM_UNIXTIME(active_time DIV 1000) AS active_time, -- 活跃时间
    bind_num AS bind_num, -- 绑定设备数
    is_delete AS is_delete, -- 是否删除
    NOW() as process_time -- 数据处理时间
from ods.ods_us_app_user
union all
select 
    id as user_id, -- 主键ID
    "eu" as data_region_code, -- 数据所属区域
    username AS user_name, -- 账号（手机号）
    password AS pass_word, -- 密码
    nickname AS nick_name, -- 昵称
    sex AS sex_code, -- 性别code
    case when sex=1 then '男' 
         when sex=2 then '女'
         when sex=0 then '未知'
    end AS sex_name, -- 性别中文
    region AS region, -- 区域
    calling_code AS calling_code, -- 国际区号
    country_code AS country_code, -- 国家编码
    country_name AS country_name, -- 国家
    address AS address, -- 地址
    app AS app, -- 所属app
    wx_id AS wx_id, -- wx openid
    wx_name AS wx_name, -- wx openid
    apple_sub AS apple_sub, -- 苹果sub账号
    app_version AS app_version, -- 用户登录设备版本号
    platform AS platform, -- 用户登录设备
    app_salt AS app_salt, -- 用户登录签名盐值
    ty_pass AS ty_pass, -- 涂鸦密码
    google_sub AS google_sub, -- google sub账号标识
    status AS user_status, -- 用户状态 
    register_type AS register_type, -- 注册方式 
    FROM_UNIXTIME(reg_time DIV 1000) AS reg_time, -- 注册时间
    FROM_UNIXTIME(gmt_modify DIV 1000) AS gmt_modify, -- 更新时间
    is_bind_device AS is_bind_device, -- 是否绑定过设备 
    app_name AS app_name, -- 用户登录app名称
    token AS token, -- app登录最新token值
    user_update_policy AS user_update_policy, -- 用户操作广告开关
    advert_type AS advert_type, -- 广告操作类型
    advert_status AS advert_status_code, -- 广告状态code
    case when advert_status=0 then '全广告' 
         when advert_status=1 then '全关'
         when advert_status=2 then '限量广告'
         when advert_status=3 then '新用户广告'
    end AS advert_status_name, -- 广告状态
    advert_user_name AS advert_user_name, -- 广告状态修改人
    FROM_UNIXTIME(advert_time DIV 1000) AS advert_time, -- 广告下次开启时间
    eye_care AS eye_care, -- 护眼模式
    cloud_record_speed AS cloud_record_speed, -- 云录像加速播放
    FROM_UNIXTIME(active_time DIV 1000) AS active_time, -- 活跃时间
    bind_num AS bind_num, -- 绑定设备数
    is_delete AS is_delete, -- 是否删除
    NOW() as process_time -- 数据处理时间
from ods.ods_eu_app_user
union all
select 
    id as user_id, -- 主键ID
    "sg" as data_region_code, -- 数据所属区域
    username AS user_name, -- 账号（手机号）
    password AS pass_word, -- 密码
    nickname AS nick_name, -- 昵称
    sex AS sex_code, -- 性别code
    case when sex=1 then '男' 
         when sex=2 then '女'
         when sex=0 then '未知'
    end AS sex_name, -- 性别中文
    region AS region, -- 区域
    calling_code AS calling_code, -- 国际区号
    country_code AS country_code, -- 国家编码
    country_name AS country_name, -- 国家
    address AS address, -- 地址
    app AS app, -- 所属app
    wx_id AS wx_id, -- wx openid
    wx_name AS wx_name, -- wx openid
    apple_sub AS apple_sub, -- 苹果sub账号
    app_version AS app_version, -- 用户登录设备版本号
    platform AS platform, -- 用户登录设备
    app_salt AS app_salt, -- 用户登录签名盐值
    ty_pass AS ty_pass, -- 涂鸦密码
    google_sub AS google_sub, -- google sub账号标识
    status AS user_status, -- 用户状态 
    register_type AS register_type, -- 注册方式 
    FROM_UNIXTIME(reg_time DIV 1000) AS reg_time, -- 注册时间
    FROM_UNIXTIME(gmt_modify DIV 1000) AS gmt_modify, -- 更新时间
    is_bind_device AS is_bind_device, -- 是否绑定过设备 
    app_name AS app_name, -- 用户登录app名称
    token AS token, -- app登录最新token值
    user_update_policy AS user_update_policy, -- 用户操作广告开关
    advert_type AS advert_type, -- 广告操作类型
    advert_status AS advert_status_code, -- 广告状态code
    case when advert_status=0 then '全广告' 
         when advert_status=1 then '全关'
         when advert_status=2 then '限量广告'
         when advert_status=3 then '新用户广告'
    end AS advert_status_name, -- 广告状态
    advert_user_name AS advert_user_name, -- 广告状态修改人
    FROM_UNIXTIME(advert_time DIV 1000) AS advert_time, -- 广告下次开启时间
    eye_care AS eye_care, -- 护眼模式
    cloud_record_speed AS cloud_record_speed, -- 云录像加速播放
    FROM_UNIXTIME(active_time DIV 1000) AS active_time, -- 活跃时间
    bind_num AS bind_num, -- 绑定设备数
    is_delete AS is_delete, -- 是否删除
    NOW() as process_time -- 数据处理时间  
from ods.ods_sg_app_user;
