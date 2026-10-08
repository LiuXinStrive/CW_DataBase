CREATE TABLE `ods_us_device_label` (
  `id` bigint comment'主键',
  `uid` varchar(255) comment'设备id',
  `label_id` varchar(128) comment'标签id',
  `gmt_create` bigint comment'创建时间',
  `gmt_modify` bigint comment'更新时间',
  `sys_insert_time` DATETIME COMMENT '数据同步入库时间' DEFAULT CURRENT_TIMESTAMP,
   PRIMARY KEY (`id`)
)COMMENT='设备预设用途标签'
;