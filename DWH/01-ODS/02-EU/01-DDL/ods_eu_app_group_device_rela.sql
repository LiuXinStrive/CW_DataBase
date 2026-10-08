CREATE TABLE `ods_eu_app_group_device_rela` (
    `id` bigint comment'主键ID',
    `app_user_id` bigint comment'用户ID',
    `group_id` bigint comment'',
    `uid` varchar(40) comment'设备ID',
    `channel_no` int comment'通道号',
    `device_name` varchar(50) comment'',
    `bind_time` bigint comment'',
    `type` int comment'绑定类型：1绑定2分享',
    `purview` int comment'',
    `gmt_modify` bigint comment'',
    `remark_name` varchar(30) comment'备注昵称',
    `push_flag` int comment'0 开启  1 关闭 2 30分钟关闭  3 2小时关闭 4 4小时关闭 5 12小时关闭',
    `flag_end_time` bigint comment'推送状态关闭时间',
    `country_name` varchar(32) comment'国家',
    `country_code` varchar(32) comment'国家编码',
    `sys_insert_time` DATETIME COMMENT '数据同步入库时间' DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`)
)COMMENT='用户绑定设备关系表'
;