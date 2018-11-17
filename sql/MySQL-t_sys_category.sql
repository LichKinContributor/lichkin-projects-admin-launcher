-- core
INSERT INTO t_sys_category (ID,LOCALE,SORT_ID,AUTH_TYPE,CATEGORY_CODE,CATEGORY_NAME) VALUES 
 ('20180101000000000_01_t_sys_category_CATEGORY_AUTH_TYPE_000000000','zh_CN',1,'ENUM','CATEGORY_AUTH_TYPE','类目权限类型')
,('20180101000000000_02_t_sys_category_PLATFORM_TYPE_00000000000000','zh_CN',1,'ENUM','PLATFORM_TYPE','平台类型')
,('20180101000000000_02_t_sys_category_USING_STATUS_000000000000000','zh_CN',1,'ENUM','USING_STATUS','在用状态')
,('20180101000000000_03_t_sys_category_EMPLOYEE_USING_STATUS_000000','zh_CN',1,'ENUM','EMPLOYEE_USING_STATUS','员工在职状态')
,('20180101000000000_04_t_sys_category_CLIENT_TYPE_0000000000000000','zh_CN',1,'ENUM','CLIENT_TYPE','客户端类型')
,('20180101000000000_05_t_sys_category_OPERATION_TYPE_0000000000000','zh_CN',1,'ENUM','OPERATION_TYPE','操作类型')
,('20180101000000000_06_t_sys_category_GENDER_000000000000000000000','zh_CN',1,'ENUM','GENDER','性别')
,('20180101000000000_07_t_sys_category_AUTHENTICATION_0000000000000','zh_CN',1,'ENUM','AUTHENTICATION','实名认证等级')
,('20180101000000000_08_t_sys_category_NATION_000000000000000000000','zh_CN',1,'ROOT','NATION','民族')
,('20180101000000000_09_t_sys_category_EDUCATION_000000000000000000','zh_CN',1,'ROOT','EDUCATION','学历')
,('20180101000000000_10_t_sys_category_DEGREE_000000000000000000000','zh_CN',1,'ROOT','DEGREE','学位')
,('20180101000000000_11_t_sys_category_MARITAL_STATUS_0000000000000','zh_CN',1,'ROOT','MARITAL_STATUS','婚姻状态')
,('20180101000000000_12_t_sys_category_ADMIN_BUS_TYPE_0000000000000','zh_CN',1,'ROOT','ADMIN_BUS_TYPE','管理员业务操作类型')
,('20180101000000000_13_t_sys_category_EMPLOYEE_BUS_TYPE_0000000000','zh_CN',1,'ROOT','EMPLOYEE_BUS_TYPE','员工业务操作类型')
,('20180101000000000_14_t_sys_category_USER_BUS_TYPE_00000000000000','zh_CN',1,'ROOT','USER_BUS_TYPE','用户业务操作类型')
,('20180101000000000_15_t_sys_category_MAP_API_00000000000000000000','zh_CN',1,'ENUM','MAP_API','地图类型')
,('20180101000000000_16_t_sys_category_JOB_TITLE_000000000000000000','zh_CN',1,'COMP','JOB_TITLE','职位')
ON DUPLICATE KEY UPDATE 
LOCALE=VALUES(LOCALE),SORT_ID=VALUES(SORT_ID),AUTH_TYPE=VALUES(AUTH_TYPE),CATEGORY_CODE=VALUES(CATEGORY_CODE),CATEGORY_NAME=VALUES(CATEGORY_NAME)
;

-- activiti
INSERT INTO t_sys_category (ID,LOCALE,SORT_ID,AUTH_TYPE,CATEGORY_CODE,CATEGORY_NAME) VALUES 
 ('20180101000000000_01_t_sys_category_ACTIVITI_PROCESS_KEY_0000000','zh_CN',2,'ENUM','ACTIVITI_PROCESS_KEY','流程标识')
,('20180101000000000_02_t_sys_category_ACTIVITI_PROCESS_TYPE_000000','zh_CN',2,'ENUM','ACTIVITI_PROCESS_TYPE','流程类型')
,('20180101000000000_03_t_sys_category_ACTIVITI_PROCESS_CODE_000000','zh_CN',2,'ROOT','ACTIVITI_PROCESS_CODE','流程编码')
,('20180101000000000_04_t_sys_category_ACTIVITI_APPROVAL_STATUS_000','zh_CN',2,'ENUM','ACTIVITI_APPROVAL_STATUS','审批状态')
,('20180101000000000_05_t_sys_category_ACTIVITI_APPROVER_TYPE_00000','zh_CN',2,'ENUM','ACTIVITI_APPROVER_TYPE','发起人类型')
,('20180101000000000_06_t_sys_category_ACTIVITI_USING_STATUS_000000','zh_CN',2,'ENUM','ACTIVITI_USING_STATUS','流程配置状态')
ON DUPLICATE KEY UPDATE 
LOCALE=VALUES(LOCALE),SORT_ID=VALUES(SORT_ID),AUTH_TYPE=VALUES(AUTH_TYPE),CATEGORY_CODE=VALUES(CATEGORY_CODE),CATEGORY_NAME=VALUES(CATEGORY_NAME)
;

-- app
INSERT INTO t_sys_category (ID,LOCALE,SORT_ID,AUTH_TYPE,CATEGORY_CODE,CATEGORY_NAME) VALUES 
 ('20180101000000000_01_t_sys_category_APP_VERSION_USING_STATUS_000','zh_CN',3,'ENUM','APP_VERSION_USING_STATUS','客户端版本状态')
,('20180101000000000_02_t_sys_category_NEWS_USING_STATUS_0000000000','zh_CN',3,'ENUM','NEWS_USING_STATUS','新闻状态')
,('20180101000000000_03_t_sys_category_APP_KEY_00000000000000000000','zh_CN',3,'R_2_C','APP_KEY','客户端唯一标识')
,('20180101000000000_04_t_sys_category_NEWS_CATEGORY_00000000000000','zh_CN',3,'COMMON','NEWS_CATEGORY','新闻类目')
,('20180101000000000_05_t_sys_category_NEWS_TEMPLATE_00000000000000','zh_CN',3,'ENUM','NEWS_TEMPLATE','新闻内容模板')
ON DUPLICATE KEY UPDATE 
LOCALE=VALUES(LOCALE),SORT_ID=VALUES(SORT_ID),AUTH_TYPE=VALUES(AUTH_TYPE),CATEGORY_CODE=VALUES(CATEGORY_CODE),CATEGORY_NAME=VALUES(CATEGORY_NAME)
;

-- attendance
INSERT INTO t_sys_category (ID,LOCALE,SORT_ID,AUTH_TYPE,CATEGORY_CODE,CATEGORY_NAME) VALUES 
 ('20180101000000000_01_t_sys_category_SCHEDULE_TYPE_00000000000000','zh_CN',4,'ROOT','SCHEDULE_TYPE','排班类型')
ON DUPLICATE KEY UPDATE 
LOCALE=VALUES(LOCALE),SORT_ID=VALUES(SORT_ID),AUTH_TYPE=VALUES(AUTH_TYPE),CATEGORY_CODE=VALUES(CATEGORY_CODE),CATEGORY_NAME=VALUES(CATEGORY_NAME)
;

-- pss
INSERT INTO t_sys_category (ID,LOCALE,SORT_ID,AUTH_TYPE,CATEGORY_CODE,CATEGORY_NAME) VALUES 
 ('20180101000000000_01_t_sys_category_PSS_SUPPLIER_TYPE_0000000000','zh_CN',5,'ROOT','PSS_SUPPLIER_TYPE','供应商类型')
,('20180101000000000_02_t_sys_category_PSS_PRODUCT_UNIT_00000000000','zh_CN',5,'ROOT','PSS_PRODUCT_UNIT','产品单位')
,('20180101000000000_03_t_sys_category_PSS_ORDER_TYPE_0000000000000','zh_CN',5,'ROOT','PSS_ORDER_TYPE','订单类型')
,('20180101000000000_04_t_sys_category_PSS_INVENTORY_STATUS_0000000','zh_CN',5,'ENUM','PSS_INVENTORY_STATUS','入库状态')
,('20180101000000000_05_t_sys_category_PSS_OTHER_STORAGE_IN_0000000','zh_CN',5,'COMP','PSS_OTHER_STORAGE_IN','其它入库类型')
,('20180101000000000_06_t_sys_category_PSS_OTHER_STORAGE_OUT_000000','zh_CN',5,'COMP','PSS_OTHER_STORAGE_OUT','其它出库类型')
,('20180101000000000_07_t_sys_category_PSS_CHECK_ORDER_STATUS_00000','zh_CN',5,'ENUM','PSS_CHECK_ORDER_STATUS','盘点状态')
,('20180101000000000_08_t_sys_category_PSS_INVENTORY_OUT_STATUS_000','zh_CN',5,'ENUM','PSS_INVENTORY_OUT_STATUS','出库状态')
,('20180101000000000_09_t_sys_category_PSS_STORAGE_IN_TYPE_00000000','zh_CN',5,'ROOT','PSS_STORAGE_IN_TYPE','入库类型')
,('20180101000000000_10_t_sys_category_PSS_STORAGE_OUT_TYPE_0000000','zh_CN',5,'ROOT','PSS_STORAGE_OUT_TYPE','出库类型')
ON DUPLICATE KEY UPDATE 
LOCALE=VALUES(LOCALE),SORT_ID=VALUES(SORT_ID),AUTH_TYPE=VALUES(AUTH_TYPE),CATEGORY_CODE=VALUES(CATEGORY_CODE),CATEGORY_NAME=VALUES(CATEGORY_NAME)
;

