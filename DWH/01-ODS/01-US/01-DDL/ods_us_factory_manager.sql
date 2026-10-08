CREATE TABLE `ods_us_factory_manager` (
  `id` bigint comment'主键',
  `one_customer` varchar(200) comment'一级客户',
  `code` varchar(40) comment'工厂code',
  `factory_name` varchar(60) comment'工厂名称',
  `gmt_create` bigint comment'创建时间',
  `card_ids` varchar(255) comment'卡商',
  `order_by` tinyint comment'排序',
  `sys_insert_time` DATETIME COMMENT '数据同步入库时间' DEFAULT CURRENT_TIMESTAMP,
   PRIMARY KEY (`id`)
)COMMENT='渠道信息'
;