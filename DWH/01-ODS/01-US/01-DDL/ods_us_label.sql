CREATE TABLE `ods_us_label` (
  `id` bigint comment'主键',
  `label_name` varchar(255) comment'标签名称',
  `label_address` varchar(255) comment'标签图片',
  `is_default` tinyint comment'是否默认',
  `sys_insert_time` DATETIME COMMENT '数据同步入库时间' DEFAULT CURRENT_TIMESTAMP,
   PRIMARY KEY (`id`)
)COMMENT='设备预设用途字典'
;