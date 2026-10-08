CREATE TABLE `ods_sg_cloud_device` (
    `id` bigint comment'主键ID',
    `uid` varchar(60) comment'设备ID',
    `policy` int comment'云存策略',
    `record_type` int comment'录像类型1、全天  2、报警',
    `is_enabled` tinyint comment'设备状态',
    `start_time` bigint comment'开始时间',
    `end_time` bigint comment'结束时间',
    `create_time` bigint comment'创建时间',
    `modify_time` bigint comment'修改时间',
    `last_order` varchar(255) comment'上次订单id',
    `sync_id` bigint comment'同步ID',
    `package_id` int comment'当前套餐id',
    `app_user_id` int comment'付款人用户id',
    `advert` tinyint comment'开云存是否免广告  1有广告， 0 没广告',
    `stream_type` tinyint comment'码流类型:1主码流；2子码流',
    `sys_insert_time` DATETIME COMMENT '数据同步入库时间' DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`)
)COMMENT='设备云存订单'
;