CREATE TABLE `ods_us_ai_cloud_device` (
    `id` bigint comment'主键ID',
    `uid` varchar(60) comment'设备唯一标识符',
    `start_time` bigint comment'开始时间',
    `end_time` bigint comment'结束时间',
    `create_time` bigint comment'创建时间',
    `last_order` varchar(255) comment'上次订单id',
    `package_id` int comment'当前套餐id',
    `app_user_id` int comment'付款人用户id',
    `enable_status` tinyint(1) comment'套餐启用状态: 1-启用, 0-禁用/锁定',
    `sys_insert_time` DATETIME COMMENT '数据同步入库时间' DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`)
)COMMENT='AI云设备功能配置表'
;