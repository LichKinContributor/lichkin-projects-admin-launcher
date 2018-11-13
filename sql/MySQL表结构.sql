-- DROP TABLE IF EXISTS `t_sys_connector`;
CREATE TABLE IF NOT EXISTS `t_sys_connector` (
  `ID` varchar(64) NOT NULL COMMENT '主键',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='连接表';

-- DROP TABLE IF EXISTS `t_sys_config`;
CREATE TABLE IF NOT EXISTS `t_sys_config` (
  `ID` varchar(64) NOT NULL COMMENT '主键',
  `COMP_ID` varchar(64) NOT NULL COMMENT '公司ID（t_sys_comp.ID）',
  `CONFIG_KEY` varchar(128) NOT NULL COMMENT '配置键',
  `CONFIG_VALUE` varchar(128) NOT NULL COMMENT '配置值',
  `REMARKS` varchar(128) NOT NULL COMMENT '备注',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='配置表';

-- DROP TABLE IF EXISTS `t_sys_comp`;
CREATE TABLE IF NOT EXISTS `t_sys_comp` (
  `ID` varchar(64) NOT NULL COMMENT '主键',
  `INSERT_TIME` varchar(17) NOT NULL COMMENT '新增时间（yyyyMMddHHmmssSSS）',
  `USING_STATUS` varchar(10) NOT NULL COMMENT '在用状态（枚举）',
  `PARENT_CODE` varchar(64) NOT NULL COMMENT '上级公司编码（工具类）',
  `COMP_CODE` varchar(64) NOT NULL COMMENT '公司编码（工具类）',
  `COMP_NAME` varchar(64) NOT NULL COMMENT '公司名称',
  `COMP_KEY` varchar(16) NOT NULL COMMENT '公司标识',
  `LINKMAN_NAME` varchar(128) DEFAULT NULL COMMENT '联系人姓名',
  `LINKMAN_CELLPHONE` varchar(11) DEFAULT NULL COMMENT '联系人手机号码',
  `TELEPHONE` varchar(16) DEFAULT NULL COMMENT '公司电话',
  `EMAIL` varchar(128) DEFAULT NULL COMMENT '公司邮箱',
  `ADDRESS` varchar(128) DEFAULT NULL COMMENT '公司地址',
  `WEBSITE` varchar(128) DEFAULT NULL COMMENT '公司网址',
  `DESCRIPTION` varchar(1024) DEFAULT NULL COMMENT '公司描述',
  `PHOTO` longtext NOT NULL COMMENT '公司头像（BASE64）',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='公司表';

-- DROP TABLE IF EXISTS `t_sys_category`;
CREATE TABLE IF NOT EXISTS `t_sys_category` (
  `ID` varchar(64) NOT NULL COMMENT '主键',
  `LOCALE` varchar(5) NOT NULL COMMENT '国际化编码',
  `SORT_ID` tinyint(4) NOT NULL COMMENT '排序号',
  `AUTH_TYPE` varchar(6) NOT NULL COMMENT '权限类型（枚举）',
  `CATEGORY_CODE` varchar(64) NOT NULL COMMENT '类目编码',
  `CATEGORY_NAME` varchar(64) NOT NULL COMMENT '类目名称',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='类目表';

-- DROP TABLE IF EXISTS `t_sys_dictionary`;
CREATE TABLE IF NOT EXISTS `t_sys_dictionary` (
  `ID` varchar(64) NOT NULL COMMENT '主键',
  `INSERT_TIME` varchar(17) NOT NULL COMMENT '新增时间（yyyyMMddHHmmssSSS）',
  `USING_STATUS` varchar(10) NOT NULL COMMENT '在用状态（枚举）',
  `COMP_ID` varchar(64) NOT NULL COMMENT '公司ID（t_sys_comp.ID）',
  `LOCALE` varchar(5) NOT NULL COMMENT '国际化编码',
  `CATEGORY_CODE` varchar(64) NOT NULL COMMENT '类目编码（t_sys_category.CATEGORY_CODE）',
  `DICT_CODE` varchar(64) NOT NULL COMMENT '字典编码',
  `DICT_NAME` varchar(64) NOT NULL COMMENT '字典名称',
  `SORT_ID` tinyint(4) NOT NULL COMMENT '排序号',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='字典表';

-- DROP TABLE IF EXISTS `t_sys_menu`;
CREATE TABLE IF NOT EXISTS `t_sys_menu` (
  `ID` varchar(64) NOT NULL COMMENT '主键',
  `PARENT_CODE` varchar(64) NOT NULL COMMENT '上级菜单编码（工具类）',
  `MENU_CODE` varchar(64) NOT NULL COMMENT '菜单编码（工具类）',
  `MENU_NAME` varchar(64) NOT NULL COMMENT '菜单名称',
  `ROOT_ONLY` bit(1) DEFAULT NULL COMMENT 'true:ROOT权限可用;false:非ROOT权限可用;NULL:通用;',
  `ON_LINE` bit(1) NOT NULL COMMENT 'true:已上线;false:未上线;',
  `ASSIGNABLE` bit(1) NOT NULL COMMENT 'true:可分配;false:不可分配;',
  `ICON` varchar(32) DEFAULT NULL COMMENT '图标',
  `URL` varchar(128) NOT NULL COMMENT '链接地址',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='菜单表';

-- DROP TABLE IF EXISTS `t_sys_role`;
CREATE TABLE IF NOT EXISTS `t_sys_role` (
  `ID` varchar(64) NOT NULL COMMENT '主键',
  `INSERT_TIME` varchar(17) NOT NULL COMMENT '新增时间（yyyyMMddHHmmssSSS）',
  `USING_STATUS` varchar(10) NOT NULL COMMENT '在用状态（枚举）',
  `COMP_ID` varchar(64) NOT NULL COMMENT '公司ID（t_sys_comp.ID）',
  `DESCRIPTION` varchar(128) NOT NULL COMMENT '描述',
  `ROLE_NAME` varchar(64) NOT NULL COMMENT '角色名称',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色表';

-- DROP TABLE IF EXISTS `t_sys_role_menu`;
CREATE TABLE IF NOT EXISTS `t_sys_role_menu` (
  `ID` varchar(64) NOT NULL COMMENT '主键',
  `MENU_ID` varchar(64) DEFAULT NULL COMMENT '菜单ID（t_sys_menu.ID）',
  `ROLE_ID` varchar(64) DEFAULT NULL COMMENT '角色ID（t_sys_role.ID）',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色&菜单关联表';

-- DROP TABLE IF EXISTS `t_sys_admin_login`;
CREATE TABLE IF NOT EXISTS `t_sys_admin_login` (
  `ID` varchar(64) NOT NULL COMMENT '主键',
  `INSERT_TIME` varchar(17) NOT NULL COMMENT '新增时间（yyyyMMddHHmmssSSS）',
  `USING_STATUS` varchar(10) NOT NULL COMMENT '在用状态（枚举）',
  `COMP_ID` varchar(64) NOT NULL COMMENT '公司ID（t_sys_comp.ID）',
  `USER_NAME` varchar(16) NOT NULL COMMENT '姓名',
  `GENDER` varchar(7) NOT NULL COMMENT '性别（枚举）',
  `EMAIL` varchar(128) NOT NULL COMMENT '邮箱',
  `PWD` varchar(32) NOT NULL COMMENT '密码（两次MD5）',
  `SECURITY_CODE` varchar(6) NOT NULL COMMENT '验证码',
  `ERROR_TIMES` tinyint(4) NOT NULL COMMENT '密码错误次数',
  `LEVEL` tinyint(4) NOT NULL COMMENT '账号等级',
  `TOKEN` varchar(64) NOT NULL COMMENT '令牌（yyyyMMddHHmmssSSS+随机字符串）',
  `LOCK_TIME` varchar(17) NOT NULL COMMENT '锁定时间（yyyyMMddHHmmssSSS）',
  `SUPER_ADMIN` bit(1) NOT NULL COMMENT 'true:超级管理员;false:普通管理员;',
  `PHOTO` longtext COMMENT '头像（BASE64）',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='管理员登录表';

-- DROP TABLE IF EXISTS `t_sys_admin_login_role`;
CREATE TABLE IF NOT EXISTS `t_sys_admin_login_role` (
  `ID` varchar(64) NOT NULL COMMENT '主键',
  `LOGIN_ID` varchar(64) NOT NULL COMMENT '管理员登录ID（t_sys_admin_login.ID）',
  `ROLE_ID` varchar(64) NOT NULL COMMENT '角色ID（t_sys_role.ID）',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='管理员登录&角色关联表';

-- DROP TABLE IF EXISTS `t_sys_admin_login_log`;
CREATE TABLE IF NOT EXISTS `t_sys_admin_login_log` (
  `ID` varchar(64) NOT NULL COMMENT '主键',
  `COMP_ID` varchar(64) NOT NULL COMMENT '公司ID（t_sys_comp.ID）',
  `LOGIN_ID` varchar(64) NOT NULL COMMENT '管理员登录ID（t_sys_admin_login.ID）',
  `REQUEST_DATAS` longtext NOT NULL COMMENT '请求数据（JSON）',
  `REQUEST_ID` varchar(64) NOT NULL COMMENT '请求ID',
  `REQUEST_IP` varchar(64) NOT NULL COMMENT '请求IP地址',
  `REQUEST_TIME` varchar(17) NOT NULL COMMENT '请求时间（yyyyMMddHHmmssSSS）',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='管理员登录日志记录表';

-- DROP TABLE IF EXISTS `t_sys_admin_oper_log`;
CREATE TABLE IF NOT EXISTS `t_sys_admin_oper_log` (
  `ID` varchar(64) NOT NULL COMMENT '主键',
  `COMP_ID` varchar(64) NOT NULL COMMENT '公司ID（t_sys_comp.ID）',
  `OPER_TYPE` varchar(6) NOT NULL COMMENT '操作类型（枚举）',
  `BUS_TYPE` varchar(64) NOT NULL COMMENT '业务类型编码（字典）',
  `LOGIN_ID` varchar(64) DEFAULT NULL COMMENT '管理员登录ID（t_sys_admin_login.ID）',
  `REQUEST_ID` varchar(64) NOT NULL COMMENT '请求ID',
  `REQUEST_TIME` varchar(17) NOT NULL COMMENT '请求时间（yyyyMMddHHmmssSSS）',
  `REQUEST_IP` varchar(64) NOT NULL COMMENT '请求IP地址',
  `REQUEST_URL` varchar(128) NOT NULL COMMENT '请求链接地址',
  `REQUEST_DATAS` longtext NOT NULL COMMENT '请求数据（JSON）',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='管理员操作日志记录表';

-- DROP TABLE IF EXISTS `t_sys_dept`;
CREATE TABLE IF NOT EXISTS `t_sys_dept` (
  `ID` varchar(64) NOT NULL COMMENT '主键',
  `INSERT_TIME` varchar(17) NOT NULL COMMENT '新增时间（yyyyMMddHHmmssSSS）',
  `USING_STATUS` varchar(10) NOT NULL COMMENT '在用状态（枚举）',
  `COMP_ID` varchar(64) NOT NULL COMMENT '公司ID（t_sys_comp.ID）',
  `PARENT_CODE` varchar(64) NOT NULL COMMENT '上级部门编码（工具类）',
  `DEPT_CODE` varchar(64) NOT NULL COMMENT '部门编码（工具类）',
  `DEPT_NAME` varchar(64) NOT NULL COMMENT '部门名称',
  `DESCRIPTION` varchar(128) DEFAULT NULL COMMENT '描述',
  `FULL_NAME` varchar(256) NOT NULL COMMENT '部门全名',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='部门表';

-- DROP TABLE IF EXISTS `t_sys_employee`;
CREATE TABLE IF NOT EXISTS `t_sys_employee` (
  `ID` varchar(64) NOT NULL COMMENT '主键',
  `INSERT_TIME` varchar(17) NOT NULL COMMENT '新增时间（yyyyMMddHHmmssSSS）',
  `USING_STATUS` varchar(10) NOT NULL COMMENT '在用状态（枚举）',
  `COMP_ID` varchar(64) NOT NULL COMMENT '公司ID（t_sys_comp.ID）',
  `BIRTHDAY` varchar(10) DEFAULT NULL COMMENT '出生日期（yyyy-MM-dd）',
  `BIRTHPLACE` varchar(64) DEFAULT NULL COMMENT '出生地',
  `CELLPHONE` varchar(11) NOT NULL COMMENT '手机号码',
  `DEGREE` varchar(64) DEFAULT NULL COMMENT '学位（字典）',
  `EDUCATION` varchar(64) DEFAULT NULL COMMENT '学历（字典）',
  `EMAIL` varchar(128) DEFAULT NULL COMMENT '邮箱',
  `ENTRY_DATE` varchar(10) NOT NULL COMMENT '入职日期（yyyy-MM-dd）',
  `GENDER` varchar(7) NOT NULL COMMENT '性别（枚举）',
  `JOB_NUMBER` varchar(8) NOT NULL COMMENT '工号',
  `JOB_TITLE` varchar(64) DEFAULT NULL COMMENT '职位（字典）',
  `LOGIN_ID` varchar(64) DEFAULT NULL COMMENT '用户登录ID（t_sys_user_login.ID）',
  `MARITAL_STATUS` varchar(64) DEFAULT NULL COMMENT '婚姻状态（字典）',
  `NATION` varchar(64) DEFAULT NULL COMMENT '民族（字典）',
  `PHOTO` longtext COMMENT '头像（BASE64）',
  `USER_CARD` varchar(64) DEFAULT NULL COMMENT '身份证号',
  `USER_NAME` varchar(64) NOT NULL COMMENT '姓名',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='员工表（公司）';

-- DROP TABLE IF EXISTS `t_sys_employee_dept`;
CREATE TABLE IF NOT EXISTS `t_sys_employee_dept` (
  `ID` varchar(64) NOT NULL COMMENT '主键',
  `EMPLOYEE_ID` varchar(64) NOT NULL COMMENT '员工ID（t_sys_employee.ID）',
  `DEPT_ID` varchar(64) NOT NULL COMMENT '部门ID（t_sys_dept.ID）',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='员工&部门关联表';

-- DROP TABLE IF EXISTS `t_sys_employee_oper_log`;
CREATE TABLE IF NOT EXISTS `t_sys_employee_oper_log` (
  `ID` varchar(64) NOT NULL COMMENT '主键',
  `COMP_ID` varchar(64) NOT NULL COMMENT '公司ID（t_sys_comp.ID）',
  `OPER_TYPE` varchar(6) NOT NULL COMMENT '操作类型（枚举）',
  `BUS_TYPE` varchar(64) NOT NULL COMMENT '业务类型编码（字典）',
  `LOGIN_ID` varchar(64) DEFAULT NULL COMMENT '管理员登录ID（t_sys_admin_login.ID）',
  `REQUEST_ID` varchar(64) NOT NULL COMMENT '请求ID',
  `REQUEST_TIME` varchar(17) NOT NULL COMMENT '请求时间（yyyyMMddHHmmssSSS）',
  `REQUEST_IP` varchar(64) NOT NULL COMMENT '请求IP地址',
  `REQUEST_URL` varchar(128) NOT NULL COMMENT '请求链接地址',
  `REQUEST_DATAS` longtext NOT NULL COMMENT '请求数据（JSON）',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='员工操作日志记录表';

-- DROP TABLE IF EXISTS `t_sys_user_login`;
CREATE TABLE IF NOT EXISTS `t_sys_user_login` (
  `ID` varchar(64) NOT NULL COMMENT '主键',
  `INSERT_TIME` varchar(17) NOT NULL COMMENT '新增时间（yyyyMMddHHmmssSSS）',
  `USING_STATUS` varchar(10) NOT NULL COMMENT '在用状态（枚举）',
  `USER_NAME` varchar(64) NOT NULL COMMENT '姓名',
  `GENDER` varchar(7) NOT NULL COMMENT '性别（枚举）',
  `LOGIN_NAME` varchar(64) NOT NULL COMMENT '登录名',
  `CELLPHONE` varchar(11) NOT NULL COMMENT '手机号码',
  `EMAIL` varchar(128) NOT NULL COMMENT '邮箱',
  `USER_CARD` varchar(64) NOT NULL COMMENT '身份证号（自定义加密）',
  `PWD` varchar(32) NOT NULL COMMENT '密码（两次MD5）',
  `SECURITY_CODE` varchar(6) NOT NULL COMMENT '验证码',
  `ERROR_TIMES` tinyint(4) NOT NULL COMMENT '密码错误次数',
  `LEVEL` tinyint(4) NOT NULL COMMENT '账号等级',
  `TOKEN` varchar(64) NOT NULL COMMENT '令牌（yyyyMMddHHmmssSSS+随机字符串）',
  `LOCK_TIME` varchar(17) NOT NULL COMMENT '锁定时间（yyyyMMddHHmmssSSS）',
  `PHOTO` longtext COMMENT '头像（BASE64）',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户登录表';

-- DROP TABLE IF EXISTS `t_sys_user_oper_log`;
CREATE TABLE IF NOT EXISTS `t_sys_user_oper_log` (
  `ID` varchar(64) NOT NULL COMMENT '主键',
  `COMP_ID` varchar(64) NOT NULL COMMENT '公司ID（t_sys_comp.ID）',
  `OPER_TYPE` varchar(6) NOT NULL COMMENT '操作类型（枚举）',
  `BUS_TYPE` varchar(64) NOT NULL COMMENT '业务类型编码（字典）',
  `LOGIN_ID` varchar(64) DEFAULT NULL COMMENT '管理员登录ID（t_sys_admin_login.ID）',
  `REQUEST_ID` varchar(64) NOT NULL COMMENT '请求ID',
  `REQUEST_TIME` varchar(17) NOT NULL COMMENT '请求时间（yyyyMMddHHmmssSSS）',
  `REQUEST_IP` varchar(64) NOT NULL COMMENT '请求IP地址',
  `REQUEST_URL` varchar(128) NOT NULL COMMENT '请求链接地址',
  `REQUEST_DATAS` longtext NOT NULL COMMENT '请求数据（JSON）',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户操作日志记录表';

-- DROP TABLE IF EXISTS `t_sys_sc`;
CREATE TABLE IF NOT EXISTS `t_sys_sc` (
  `ID` varchar(64) NOT NULL COMMENT '主键',
  `INSERT_TIME` varchar(17) NOT NULL COMMENT '新增时间（yyyyMMddHHmmssSSS）',
  `USING_STATUS` varchar(10) NOT NULL COMMENT '在用状态（枚举）',
  `CELLPHONE` varchar(11) DEFAULT NULL COMMENT '手机号码',
  `EMAIL` varchar(128) DEFAULT NULL COMMENT '邮箱',
  `SECURITY_CODE` varchar(6) NOT NULL COMMENT '验证码',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='验证码表';

-- DROP TABLE IF EXISTS `t_sys_sms_log`;
CREATE TABLE IF NOT EXISTS `t_sys_sms_log` (
  `ID` varchar(64) NOT NULL COMMENT '主键',
  `INSERT_TIME` varchar(17) NOT NULL COMMENT '新增时间（yyyyMMddHHmmssSSS）',
  `USING_STATUS` varchar(10) NOT NULL COMMENT '在用状态（枚举）',
  `CELLPHONE` varchar(11) NOT NULL COMMENT '手机号码',
  `SEND_TIME` varchar(17) DEFAULT NULL COMMENT '发送时间（yyyy-MM-dd）',
  `SMS` varchar(128) NOT NULL COMMENT '短信内容',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='短信日志表';

-- DROP TABLE IF EXISTS `t_sys_amap_location`;
CREATE TABLE IF NOT EXISTS `t_sys_amap_location` (
  `ID` varchar(64) NOT NULL COMMENT '主键',
  `BUS_ID` varchar(64) NOT NULL COMMENT '业务表ID',
  `LOCATION_TYPE` int(11) DEFAULT NULL COMMENT '定位结果来源',
  `LOCATE_TIME` bigint(20) DEFAULT NULL COMMENT '定位时间',
  `ACCURACY` float DEFAULT NULL COMMENT '精度信息',
  `LATITUDE` double DEFAULT NULL COMMENT '纬度',
  `LONGITUDE` double DEFAULT NULL COMMENT '经度',
  `ALTITUDE` double DEFAULT NULL COMMENT '高度',
  `COUNTRY` varchar(32) DEFAULT NULL COMMENT '国家信息',
  `PROVINCE` varchar(16) DEFAULT NULL COMMENT '省信息',
  `CITY` varchar(16) DEFAULT NULL COMMENT '城市信息',
  `DISTRICT` varchar(64) DEFAULT NULL COMMENT '城区信息',
  `STREET` varchar(64) DEFAULT NULL COMMENT '街道信息',
  `STREET_NUM` varchar(64) DEFAULT NULL COMMENT '街道门牌号信息',
  `CITY_CODE` varchar(16) DEFAULT NULL COMMENT '城市编码',
  `AD_CODE` varchar(16) DEFAULT NULL COMMENT '地区编码',
  `BEARING` float DEFAULT NULL COMMENT '方向角',
  `AOI_NAME` varchar(64) DEFAULT NULL COMMENT '当前定位点的AOI信息',
  `BUILDING_ID` varchar(64) DEFAULT NULL COMMENT '当前室内定位的建筑物Id',
  `FLOOR` varchar(64) DEFAULT NULL COMMENT '当前室内定位的楼层',
  `GPS_ACCURACY_STATUS` int(11) DEFAULT NULL COMMENT 'GPS的当前状态',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='高德地图定位信息表';

-- DROP TABLE IF EXISTS `t_sys_activiti_process_config`;
CREATE TABLE IF NOT EXISTS `t_sys_activiti_process_config` (
  `ID` varchar(64) NOT NULL COMMENT '主键',
  `INSERT_TIME` varchar(17) NOT NULL COMMENT '新增时间（yyyyMMddHHmmssSSS）',
  `USING_STATUS` varchar(10) NOT NULL COMMENT '在用状态（枚举）',
  `COMP_ID` varchar(64) NOT NULL COMMENT '公司ID（t_sys_comp.ID）',
  `DEPT_ID` varchar(64) NOT NULL COMMENT '部门ID（t_sys_dept.ID）',
  `AVAILABLE` bit(1) NOT NULL COMMENT 'true:可用;false:不可用;',
  `PROCESS_KEY` varchar(24) NOT NULL COMMENT '流程标识（枚举）',
  `PROCESS_TYPE` varchar(11) NOT NULL COMMENT '流程类型（枚举）',
  `PROCESS_CODE` varchar(64) NOT NULL COMMENT '流程编码（字典）',
  `PROCESS_NAME` varchar(64) NOT NULL COMMENT '流程名称',
  `STEP_COUNT` tinyint(4) NOT NULL COMMENT '流程步骤数',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='流程配置表';

-- DROP TABLE IF EXISTS `t_sys_activiti_process_task_config`;
CREATE TABLE IF NOT EXISTS `t_sys_activiti_process_task_config` (
  `ID` varchar(64) NOT NULL COMMENT '主键',
  `CONFIG_ID` varchar(64) NOT NULL COMMENT '流程配置表ID（t_sys_activiti_process_config.ID）',
  `STEP` tinyint(4) NOT NULL COMMENT '节点步骤',
  `TASK_NAME` varchar(32) NOT NULL COMMENT '节点名称',
  `APPROVER` varchar(64) NOT NULL COMMENT '员工ID（t_sys_employee.ID）',
  `USER_NAME` varchar(64) NOT NULL COMMENT '用户姓名',
  `FORM_JSON` longtext NOT NULL COMMENT '表单JSON',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='流程节点配置表';

-- DROP TABLE IF EXISTS `t_sys_activiti_api_request_log_start_process`;
CREATE TABLE IF NOT EXISTS `t_sys_activiti_api_request_log_start_process` (
  `ID` varchar(64) NOT NULL COMMENT '主键',
  `INSERT_TIME` varchar(17) NOT NULL COMMENT '新增时间（yyyyMMddHHmmssSSS）',
  `USING_STATUS` varchar(10) NOT NULL COMMENT '在用状态（枚举）',
  `COMP_ID` varchar(64) NOT NULL COMMENT '公司ID（t_sys_comp.ID）',
  `USER_ID` varchar(129) NOT NULL COMMENT '公司ID_员工ID',
  `PROCESS_CONFIG_ID` varchar(64) NOT NULL COMMENT '流程配置ID（t_sys_activiti_process_config.ID）',
  `APP_KEY` varchar(64) DEFAULT NULL COMMENT '客户端唯一标识（字典）',
  `CLIENT_TYPE` varchar(10) NOT NULL COMMENT '客户端类型（枚举）',
  `VERSIONX` tinyint(4) NOT NULL COMMENT '客户端版本号（大版本号）',
  `VERSIONY` tinyint(4) NOT NULL COMMENT '客户端版本号（中版本号）',
  `VERSIONZ` smallint(6) NOT NULL COMMENT '客户端版本号（小版本号）',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='启动流程接口请求日志表';

-- DROP TABLE IF EXISTS `t_sys_activiti_api_request_log_complete_process`;
CREATE TABLE IF NOT EXISTS `t_sys_activiti_api_request_log_complete_process` (
  `ID` varchar(64) NOT NULL COMMENT '主键',
  `INSERT_TIME` varchar(17) NOT NULL COMMENT '新增时间（yyyyMMddHHmmssSSS）',
  `USING_STATUS` varchar(10) NOT NULL COMMENT '在用状态（枚举）',
  `COMP_ID` varchar(64) NOT NULL COMMENT '公司ID（t_sys_comp.ID）',
  `USER_ID` varchar(129) NOT NULL COMMENT '公司ID_员工ID',
  `PROCESS_TYPE` varchar(11) NOT NULL COMMENT '流程类型（枚举）',
  `PROCESS_INSTANCE_ID` varchar(64) NOT NULL COMMENT '流程实例ID',
  `APP_KEY` varchar(64) DEFAULT NULL COMMENT '客户端唯一标识（字典）',
  `CLIENT_TYPE` varchar(10) NOT NULL COMMENT '客户端类型（枚举）',
  `VERSIONX` tinyint(4) NOT NULL COMMENT '客户端版本号（大版本号）',
  `VERSIONY` tinyint(4) NOT NULL COMMENT '客户端版本号（中版本号）',
  `VERSIONZ` smallint(6) NOT NULL COMMENT '客户端版本号（小版本号）',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='审批流程接口请求日志表';

-- DROP TABLE IF EXISTS `t_sys_activiti_form_data`;
CREATE TABLE IF NOT EXISTS `t_sys_activiti_form_data` (
  `ID` varchar(64) NOT NULL COMMENT '主键',
  `INSERT_TIME` varchar(17) NOT NULL COMMENT '新增时间（yyyyMMddHHmmssSSS）',
  `USING_STATUS` varchar(10) NOT NULL COMMENT '在用状态（枚举）',
  `COMP_ID` varchar(64) NOT NULL COMMENT '公司ID（t_sys_comp.ID）',
  `PROCESS_CONFIG_ID` varchar(64) DEFAULT NULL COMMENT '流程配置ID（t_sys_activiti_process_config.ID）',
  `APPROVAL_STATUS` varchar(9) NOT NULL COMMENT '审批状态（枚举）',
  `APPROVAL_TIME` varchar(17) DEFAULT NULL COMMENT '审批时间（yyyyMMddHHmmssSSS）',
  `PROCESS_INSTANCE_ID` varchar(64) DEFAULT NULL COMMENT '流程实例ID',
  `APPROVER_TYPE` varchar(16) NOT NULL COMMENT '发起人类型（枚举）',
  `APPROVER_LOGIN_ID` varchar(64) NOT NULL COMMENT '发起人登录ID（根据approverType存放不同表ID）',
  `PROCESS_CODE` varchar(64) NOT NULL COMMENT '流程编码（字典）',
  `FIELD1` varchar(64) DEFAULT NULL COMMENT '业务字段',
  `FIELD2` varchar(64) DEFAULT NULL COMMENT '业务字段',
  `FIELD3` varchar(64) DEFAULT NULL COMMENT '业务字段',
  `FIELD4` varchar(64) DEFAULT NULL COMMENT '业务字段',
  `FIELD5` varchar(64) DEFAULT NULL COMMENT '业务字段',
  `FIELD6` varchar(64) DEFAULT NULL COMMENT '业务字段',
  `FIELD7` varchar(64) DEFAULT NULL COMMENT '业务字段',
  `FIELD8` varchar(64) DEFAULT NULL COMMENT '业务字段',
  `FIELD9` varchar(64) DEFAULT NULL COMMENT '业务字段',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='表单数据表';

-- DROP TABLE IF EXISTS `t_sys_activiti_form_data_step`;
CREATE TABLE IF NOT EXISTS `t_sys_activiti_form_data_step` (
  `ID` varchar(64) NOT NULL COMMENT '主键',
  `INSERT_TIME` varchar(17) NOT NULL COMMENT '新增时间（yyyyMMddHHmmssSSS）',
  `USING_STATUS` varchar(10) NOT NULL COMMENT '在用状态（枚举）',
  `FORM_DATA_ID` varchar(64) NOT NULL COMMENT '表单数据表ID（t_sys_activiti_form_data.ID）',
  `STEP` tinyint(4) NOT NULL COMMENT '节点步骤',
  `TASK_NAME` varchar(64) NOT NULL COMMENT '节点名称',
  `FORM_JSON` longtext NOT NULL COMMENT '表单JSON',
  `DATA_JSON` longtext NOT NULL COMMENT '数据JSON',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='表单数据步骤表';

-- DROP TABLE IF EXISTS `t_sys_app_version`;
CREATE TABLE IF NOT EXISTS `t_sys_app_version` (
  `ID` varchar(64) NOT NULL COMMENT '主键',
  `INSERT_TIME` varchar(17) NOT NULL COMMENT '新增时间（yyyyMMddHHmmssSSS）',
  `USING_STATUS` varchar(10) NOT NULL COMMENT '在用状态（枚举）',
  `APP_KEY` varchar(64) NOT NULL COMMENT '客户端唯一标识（字典）',
  `CLIENT_TYPE` varchar(10) NOT NULL COMMENT '客户端类型（枚举）',
  `FORCE_UPDATE` bit(1) NOT NULL COMMENT '强制更新',
  `PUBLISH_TIME` varchar(17) DEFAULT NULL COMMENT '发布时间（yyyyMMddHHmmssSSS）',
  `TIP` varchar(64) NOT NULL COMMENT '提示信息',
  `URL` varchar(128) NOT NULL COMMENT '下载地址',
  `VERSIONX` tinyint(4) NOT NULL COMMENT '版本号（大版本号）',
  `VERSIONY` tinyint(4) NOT NULL COMMENT '版本号（中版本号）',
  `VERSIONZ` smallint(6) NOT NULL COMMENT '版本号（小版本号）',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='客户端版本信息表';

-- DROP TABLE IF EXISTS `t_sys_app_api_request_log`;
CREATE TABLE IF NOT EXISTS `t_sys_app_api_request_log` (
  `ID` varchar(64) NOT NULL COMMENT '主键',
  `INSERT_TIME` varchar(17) NOT NULL COMMENT '新增时间（yyyyMMddHHmmssSSS）',
  `USING_STATUS` varchar(10) NOT NULL COMMENT '在用状态（枚举）',
  `APP_KEY` varchar(64) NOT NULL COMMENT '客户端唯一标识（字典）',
  `BRAND` varchar(64) NOT NULL COMMENT '生产厂商',
  `CLIENT_TYPE` varchar(10) NOT NULL COMMENT '客户端类型（枚举）',
  `LOCALE` varchar(5) NOT NULL COMMENT '国际化编码',
  `LOGIN_ID` varchar(64) DEFAULT NULL COMMENT '登录ID（t_sys_user_login.ID）',
  `MODEL` varchar(128) NOT NULL COMMENT '机型信息',
  `OS_VERSION` varchar(16) NOT NULL COMMENT '客户端系统版本',
  `SCREEN_HEIGHT` smallint(6) NOT NULL COMMENT '屏幕高',
  `SCREEN_WIDTH` smallint(6) NOT NULL COMMENT '屏幕宽',
  `UUID` varchar(64) NOT NULL COMMENT '设备唯一标识',
  `VERSIONX` tinyint(4) NOT NULL COMMENT '版本号（大版本号）',
  `VERSIONY` tinyint(4) NOT NULL COMMENT '版本号（中版本号）',
  `VERSIONZ` smallint(6) NOT NULL COMMENT '版本号（小版本号）',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='客户端接口请求日志表';

-- DROP TABLE IF EXISTS `t_sys_app_score`;
CREATE TABLE IF NOT EXISTS `t_sys_app_score` (
  `ID` varchar(64) NOT NULL COMMENT '主键',
  `INSERT_TIME` varchar(17) NOT NULL COMMENT '新增时间（yyyyMMddHHmmssSSS）',
  `USING_STATUS` varchar(10) NOT NULL COMMENT '在用状态（枚举）',
  `APP_KEY` varchar(64) NOT NULL COMMENT '客户端唯一标识（字典）',
  `CLIENT_TYPE` varchar(10) NOT NULL COMMENT '客户端类型（枚举）',
  `CONTENT` varchar(1024) DEFAULT NULL COMMENT '内容',
  `LOCALE` varchar(5) NOT NULL COMMENT '国际化编码',
  `LOGIN_ID` varchar(64) DEFAULT NULL COMMENT '登录ID（t_sys_user_login.ID）',
  `SCORE` tinyint(4) NOT NULL COMMENT '评分',
  `TITLE` varchar(32) DEFAULT NULL COMMENT '标题',
  `VERSIONX` tinyint(4) NOT NULL COMMENT '版本号（大版本号）',
  `VERSIONY` tinyint(4) NOT NULL COMMENT '版本号（中版本号）',
  `VERSIONZ` smallint(6) NOT NULL COMMENT '版本号（小版本号）',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='客户端评分信息表';

-- DROP TABLE IF EXISTS `t_sys_app_feedback`;
CREATE TABLE IF NOT EXISTS `t_sys_app_feedback` (
  `ID` varchar(64) NOT NULL COMMENT '主键',
  `INSERT_TIME` varchar(17) NOT NULL COMMENT '新增时间（yyyyMMddHHmmssSSS）',
  `USING_STATUS` varchar(10) NOT NULL COMMENT '在用状态（枚举）',
  `APP_KEY` varchar(64) NOT NULL COMMENT '客户端唯一标识（字典）',
  `CLIENT_TYPE` varchar(10) NOT NULL COMMENT '客户端类型（枚举）',
  `CONTENT` varchar(1024) NOT NULL COMMENT '内容',
  `IMG` longtext COMMENT '图片',
  `LOCALE` varchar(5) NOT NULL COMMENT '国际化编码',
  `LOGIN_ID` varchar(64) DEFAULT NULL COMMENT '登录ID（t_sys_user_login.ID）',
  `VERSIONX` tinyint(4) NOT NULL COMMENT '版本号（大版本号）',
  `VERSIONY` tinyint(4) NOT NULL COMMENT '版本号（中版本号）',
  `VERSIONZ` smallint(6) NOT NULL COMMENT '版本号（小版本号）',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='客户端反馈信息表';

-- DROP TABLE IF EXISTS `t_sys_app_sign_in_log`;
CREATE TABLE IF NOT EXISTS `t_sys_app_sign_in_log` (
  `ID` varchar(64) NOT NULL COMMENT '主键',
  `INSERT_TIME` varchar(17) NOT NULL COMMENT '新增时间（yyyyMMddHHmmssSSS）',
  `USING_STATUS` varchar(10) NOT NULL COMMENT '在用状态（枚举）',
  `APP_KEY` varchar(64) NOT NULL COMMENT '客户端唯一标识（字典）',
  `CLIENT_TYPE` varchar(10) NOT NULL COMMENT '客户端类型（枚举）',
  `LOCALE` varchar(5) NOT NULL COMMENT '国际化编码',
  `LOGIN_ID` varchar(64) NOT NULL COMMENT '登录ID（t_sys_user_login.ID）',
  `SIGN_DATE` varchar(10) NOT NULL COMMENT '签到日期',
  `VERSIONX` tinyint(4) NOT NULL COMMENT '版本号（大版本号）',
  `VERSIONY` tinyint(4) NOT NULL COMMENT '版本号（中版本号）',
  `VERSIONZ` smallint(6) NOT NULL COMMENT '版本号（小版本号）',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='客户端签到记录表';

-- DROP TABLE IF EXISTS `t_sys_app_banner`;
CREATE TABLE IF NOT EXISTS `t_sys_app_banner` (
  `ID` varchar(64) NOT NULL COMMENT '主键',
  `INSERT_TIME` varchar(17) NOT NULL COMMENT '新增时间（yyyyMMddHHmmssSSS）',
  `USING_STATUS` varchar(10) NOT NULL COMMENT '在用状态（枚举）',
  `COMP_ID` varchar(64) NOT NULL COMMENT '公司ID（t_sys_comp.ID）',
  `APP_KEY` varchar(64) NOT NULL COMMENT '客户端唯一标识（字典）',
  `AUTHOR` varchar(64) DEFAULT NULL COMMENT '作者',
  `BANNER` varchar(512) NOT NULL COMMENT '轮播图',
  `BRIEF` varchar(128) DEFAULT NULL COMMENT '简介',
  `CATEGORY_CODE` varchar(64) NOT NULL COMMENT '新闻类目（字典）',
  `CLIENT_TYPE` varchar(10) NOT NULL COMMENT '客户端类型（枚举）',
  `CONTENT` longtext COMMENT '内容',
  `KEYWORDS` varchar(64) DEFAULT NULL COMMENT '关键字',
  `LINK_URL` varchar(512) DEFAULT NULL COMMENT '外链地址',
  `LOCALE` varchar(5) NOT NULL COMMENT '国际化编码',
  `LOGIN_ID` varchar(64) NOT NULL COMMENT '登录ID（t_sys_admin_login.ID）',
  `ORDER_ID` tinyint(4) NOT NULL COMMENT '排序号',
  `PUBLISH_TIME` varchar(17) DEFAULT NULL COMMENT '发布时间（yyyyMMddHHmmssSSS）',
  `TEMPLATE_CODE` varchar(64) NOT NULL COMMENT '模板编码（字典）',
  `TITLE` varchar(64) NOT NULL COMMENT '标题',
  `VERSIONS` varchar(1024) NOT NULL COMMENT '版本号',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='客户端轮播信息表';

-- DROP TABLE IF EXISTS `t_sys_app_news`;
CREATE TABLE IF NOT EXISTS `t_sys_app_news` (
  `ID` varchar(64) NOT NULL COMMENT '主键',
  `INSERT_TIME` varchar(17) NOT NULL COMMENT '新增时间（yyyyMMddHHmmssSSS）',
  `USING_STATUS` varchar(10) NOT NULL COMMENT '在用状态（枚举）',
  `COMP_ID` varchar(64) NOT NULL COMMENT '公司ID（t_sys_comp.ID）',
  `APP_KEY` varchar(64) NOT NULL COMMENT '客户端唯一标识（字典）',
  `AUTHOR` varchar(64) DEFAULT NULL COMMENT '作者',
  `BRIEF` varchar(128) DEFAULT NULL COMMENT '简介',
  `CATEGORY_CODE` varchar(64) NOT NULL COMMENT '新闻类目（字典）',
  `CLIENT_TYPE` varchar(10) NOT NULL COMMENT '客户端类型（枚举）',
  `CONTENT` longtext COMMENT '内容',
  `IMAGE_URL1` varchar(512) DEFAULT NULL COMMENT '图片',
  `IMAGE_URL2` varchar(512) DEFAULT NULL COMMENT '图片',
  `IMAGE_URL3` varchar(512) DEFAULT NULL COMMENT '图片',
  `IMAGE_URL4` varchar(512) DEFAULT NULL COMMENT '图片',
  `IMAGE_URL5` varchar(512) DEFAULT NULL COMMENT '图片',
  `IMAGE_URL6` varchar(512) DEFAULT NULL COMMENT '图片',
  `IMAGE_URL7` varchar(512) DEFAULT NULL COMMENT '图片',
  `IMAGE_URL8` varchar(512) DEFAULT NULL COMMENT '图片',
  `IMAGE_URL9` varchar(512) DEFAULT NULL COMMENT '图片',
  `KEYWORDS` varchar(64) DEFAULT NULL COMMENT '关键字',
  `LINK_URL` varchar(512) DEFAULT NULL COMMENT '外链地址',
  `LOCALE` varchar(5) NOT NULL COMMENT '国际化编码',
  `LOGIN_ID` varchar(64) NOT NULL COMMENT '登录ID（t_sys_admin_login.ID）',
  `ORDER_ID` tinyint(4) NOT NULL COMMENT '排序号',
  `PUBLISH_TIME` varchar(17) DEFAULT NULL COMMENT '发布时间（yyyyMMddHHmmssSSS）',
  `TEMPLATE_CODE` varchar(64) NOT NULL COMMENT '模板编码（字典）',
  `TITLE` varchar(64) NOT NULL COMMENT '标题',
  `VERSIONS` varchar(1024) NOT NULL COMMENT '版本号',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='客户端新闻信息表';

-- DROP TABLE IF EXISTS `t_sys_comp_schedule_config`;
CREATE TABLE IF NOT EXISTS `t_sys_comp_schedule_config` (
  `ID` varchar(64) NOT NULL COMMENT '主键',
  `INSERT_TIME` varchar(17) NOT NULL COMMENT '新增时间（yyyyMMddHHmmssSSS）',
  `USING_STATUS` varchar(10) NOT NULL COMMENT '在用状态（枚举）',
  `COMP_ID` varchar(64) NOT NULL COMMENT '公司ID（t_sys_comp.ID）',
  `SCHEDULE_TYPE` varchar(7) NOT NULL COMMENT '排班类型（枚举）',
  `SCHEDULE_NAME` varchar(16) NOT NULL COMMENT '排班名称',
  `START_TIME0` varchar(5) NOT NULL COMMENT '上班时间（HH:mm）',
  `END_TIME0` varchar(5) NOT NULL COMMENT '下班时间（HH:mm）',
  `START_TIME1` varchar(5) DEFAULT NULL COMMENT '上班时间（HH:mm）',
  `END_TIME1` varchar(5) DEFAULT NULL COMMENT '下班时间（HH:mm）',
  `START_TIME2` varchar(5) DEFAULT NULL COMMENT '上班时间（HH:mm）',
  `END_TIME2` varchar(5) DEFAULT NULL COMMENT '下班时间（HH:mm）',
  `ALLOW_BEFORE_START_TIME_MINUTES` smallint(6) DEFAULT NULL COMMENT '上班允许提前打卡时间（分钟）',
  `ALLOW_AFTER_START_TIME_MINUTES` smallint(6) DEFAULT NULL COMMENT '上班允许延迟打卡时间（分钟）',
  `ALLOW_BEFORE_END_TIME_MINUTES` smallint(6) DEFAULT NULL COMMENT '下班允许提前打卡时间（分钟）',
  `ALLOW_AFTER_END_TIME_MINUTES` smallint(6) DEFAULT NULL COMMENT '下班允许延迟打卡时间（分钟）',
  `REMARKS` varchar(512) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='公司排班配置表';

-- DROP TABLE IF EXISTS `t_sys_employee_schedule_config`;
CREATE TABLE IF NOT EXISTS `t_sys_employee_schedule_config` (
  `ID` varchar(64) NOT NULL COMMENT '主键',
  `INSERT_TIME` varchar(17) NOT NULL COMMENT '新增时间（yyyyMMddHHmmssSSS）',
  `USING_STATUS` varchar(10) NOT NULL COMMENT '在用状态（枚举）',
  `COMP_ID` varchar(64) NOT NULL COMMENT '公司ID（t_sys_comp.ID）',
  `LOGIN_ID` varchar(64) NOT NULL COMMENT '员工ID（t_sys_employee.ID）',
  `SCHEDULE_ID` varchar(64) NOT NULL COMMENT '公司排班ID（t_sys_comp_schedule_config.ID）',
  `SCHEDULE_INFO` varchar(36) NOT NULL COMMENT '一周的排班信息（标准分隔符）',
  `CONFIG_TIME` varchar(17) NOT NULL COMMENT '最后一次配置时间（yyyyMMddHHmmssSSS）',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='员工排班配置表';

-- DROP TABLE IF EXISTS `t_sys_employee_attendance`;
CREATE TABLE IF NOT EXISTS `t_sys_employee_attendance` (
  `ID` varchar(64) NOT NULL COMMENT '主键',
  `INSERT_TIME` varchar(17) NOT NULL COMMENT '新增时间（yyyyMMddHHmmssSSS）',
  `USING_STATUS` varchar(10) NOT NULL COMMENT '在用状态（枚举）',
  `COMP_ID` varchar(64) NOT NULL COMMENT '公司ID（t_sys_comp.ID）',
  `LOGIN_ID` varchar(64) NOT NULL COMMENT '员工ID（t_sys_employee.ID）',
  `WORK_DATE` varchar(10) NOT NULL COMMENT '工作日期（yyyy-MM-dd）',
  `ALLOW_BEFORE_START_TIME` varchar(19) DEFAULT NULL COMMENT '上班允许提前打卡时间（yyyy-MM-dd HH:mm:ss）',
  `START_TIME` varchar(19) DEFAULT NULL COMMENT '上班时间（yyyy-MM-dd HH:mm:ss）',
  `ALLOW_AFTER_START_TIME` varchar(19) DEFAULT NULL COMMENT '上班允许延迟打卡时间（yyyy-MM-dd HH:mm:ss）',
  `ALLOW_BEFORE_END_TIME` varchar(19) DEFAULT NULL COMMENT '下班允许提前打卡时间（yyyy-MM-dd HH:mm:ss）',
  `END_TIME` varchar(19) DEFAULT NULL COMMENT '下班时间（yyyy-MM-dd HH:mm:ss）',
  `ALLOW_AFTER_END_TIME` varchar(19) DEFAULT NULL COMMENT '下班允许延迟打卡时间（yyyy-MM-dd HH:mm:ss）',
  `DAY_OFF` bit(1) DEFAULT NULL COMMENT '是否休息日（true:是;false:否.）',
  `TAKE_WORKING_DAY_OFF` bit(1) DEFAULT NULL COMMENT '是否调休（true:是;false:否.）',
  `ASK_FOR_LEAVE` bit(1) DEFAULT NULL COMMENT '是否请假（true:是;false:否.）',
  `ABSENTEEISM` bit(1) DEFAULT NULL COMMENT '是否旷工（true:是;false:否.）',
  `BE_LATE` bit(1) DEFAULT NULL COMMENT '是否迟到（true:是;false:否.）',
  `LEAVE_EARLY` bit(1) DEFAULT NULL COMMENT '是否早退（true:是;false:否.）',
  `FIRST_PUNCH_TIME` varchar(19) DEFAULT NULL COMMENT '首次打卡时间（yyyy-MM-dd HH:mm:ss）',
  `LAST_PUNCH_TIME` varchar(19) DEFAULT NULL COMMENT '末次打卡时间（yyyy-MM-dd HH:mm:ss）',
  `REMARKS` varchar(512) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='员工考勤记录表';

-- DROP TABLE IF EXISTS `t_sys_comp_attendance_area_config`;
CREATE TABLE IF NOT EXISTS `t_sys_comp_attendance_area_config` (
  `ID` varchar(64) NOT NULL COMMENT '主键',
  `COMP_ID` varchar(64) NOT NULL COMMENT '公司ID（t_sys_comp.ID）',
  `LATITUDE` double NOT NULL COMMENT '纬度',
  `LONGITUDE` double NOT NULL COMMENT '经度',
  `ALTITUDE` double DEFAULT NULL COMMENT '高度',
  `RADIUS` tinyint(4) NOT NULL COMMENT '水平面半径',
  `OGHAM` tinyint(4) DEFAULT NULL COMMENT '垂直面落差',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='公司考勤范围配置表';

-- DROP TABLE IF EXISTS `t_sys_employee_punch_the_clock`;
CREATE TABLE IF NOT EXISTS `t_sys_employee_punch_the_clock` (
  `ID` varchar(64) NOT NULL COMMENT '主键',
  `INSERT_TIME` varchar(17) NOT NULL COMMENT '新增时间（yyyyMMddHHmmssSSS）',
  `USING_STATUS` varchar(10) NOT NULL COMMENT '在用状态（枚举）',
  `APP_KEY` varchar(64) NOT NULL COMMENT '客户端唯一标识（字典）',
  `CLIENT_TYPE` varchar(10) NOT NULL COMMENT '客户端类型（枚举）',
  `VERSIONX` tinyint(4) NOT NULL COMMENT '客户端版本号（大版本号）',
  `VERSIONY` tinyint(4) NOT NULL COMMENT '客户端版本号（中版本号）',
  `VERSIONZ` smallint(6) NOT NULL COMMENT '客户端版本号（小版本号）',
  `LOGIN_ID` varchar(64) NOT NULL COMMENT '员工ID（t_sys_employee.ID）',
  `MAP_TYPE` varchar(4) NOT NULL COMMENT '地图API类型（枚举）',
  `LATITUDE` double NOT NULL COMMENT '纬度',
  `LONGITUDE` double NOT NULL COMMENT '经度',
  `ALTITUDE` double NOT NULL COMMENT '高度',
  `ADDRESS` varchar(1024) NOT NULL COMMENT '地址',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='员工打卡记录表';

-- DROP TABLE IF EXISTS `t_sys_pss_storage`;
CREATE TABLE IF NOT EXISTS `t_sys_pss_storage` (
  `ID` varchar(64) NOT NULL COMMENT '主键',
  `INSERT_TIME` varchar(17) NOT NULL COMMENT '新增时间（yyyyMMddHHmmssSSS）',
  `USING_STATUS` varchar(10) NOT NULL COMMENT '在用状态（枚举）',
  `COMP_ID` varchar(64) NOT NULL COMMENT '公司ID（t_sys_comp.ID）',
  `STORAGE_CODE` varchar(64) DEFAULT NULL COMMENT '仓库编码',
  `STORAGE_NAME` varchar(32) NOT NULL COMMENT '仓库名称',
  `ADDRESS` varchar(50) DEFAULT NULL COMMENT '仓库地址',
  `RESPONSIBLE_PERSON` varchar(64) DEFAULT NULL COMMENT '负责人ID（t_sys_employee.ID）',
  `REMARKS` varchar(512) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='仓库表';

-- DROP TABLE IF EXISTS `t_sys_pss_supplier`;
CREATE TABLE IF NOT EXISTS `t_sys_pss_supplier` (
  `ID` varchar(64) NOT NULL COMMENT '主键',
  `INSERT_TIME` varchar(17) NOT NULL COMMENT '新增时间（yyyyMMddHHmmssSSS）',
  `USING_STATUS` varchar(10) NOT NULL COMMENT '在用状态（枚举）',
  `COMP_ID` varchar(64) NOT NULL COMMENT '公司ID（t_sys_comp.ID）',
  `SUPPLIER_TYPE` varchar(32) DEFAULT NULL COMMENT '供应商类型（字典）',
  `SUPPLIER_CODE` varchar(64) DEFAULT NULL COMMENT '供应商编码',
  `SUPPLIER_NAME` varchar(32) NOT NULL COMMENT '供应商名称',
  `LINKMAN_CONTACT_WAY` varchar(100) DEFAULT NULL COMMENT '联系人联系方式',
  `LINKMAN_NAME` varchar(32) DEFAULT NULL COMMENT '联系人姓名',
  `RESPONSIBLE_PERSON` varchar(64) DEFAULT NULL COMMENT '负责人ID（t_sys_employee.ID）',
  `ADDRESS` varchar(50) DEFAULT NULL COMMENT '供应商地址',
  `REMARKS` varchar(512) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='供应商表';

-- DROP TABLE IF EXISTS `t_sys_pss_product_category`;
CREATE TABLE IF NOT EXISTS `t_sys_pss_product_category` (
  `ID` varchar(64) NOT NULL COMMENT '主键',
  `INSERT_TIME` varchar(17) NOT NULL COMMENT '新增时间（yyyyMMddHHmmssSSS）',
  `USING_STATUS` varchar(10) NOT NULL COMMENT '在用状态（枚举）',
  `COMP_ID` varchar(64) NOT NULL COMMENT '公司ID（t_sys_comp.ID）',
  `PARENT_CODE` varchar(64) NOT NULL COMMENT '上级类别编码（工具类规则）',
  `CATEGORY_CODE` varchar(64) NOT NULL COMMENT '类别编码（工具类规则）',
  `CATEGORY_NAME` varchar(64) NOT NULL COMMENT '类别名称',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='产品类别表';

-- DROP TABLE IF EXISTS `t_sys_pss_product`;
CREATE TABLE IF NOT EXISTS `t_sys_pss_product` (
  `ID` varchar(64) NOT NULL COMMENT '主键',
  `INSERT_TIME` varchar(17) NOT NULL COMMENT '新增时间（yyyyMMddHHmmssSSS）',
  `USING_STATUS` varchar(10) NOT NULL COMMENT '在用状态（枚举）',
  `COMP_ID` varchar(64) NOT NULL COMMENT '公司ID（t_sys_comp.ID）',
  `PRODUCT_CATEGORY` varchar(64) NOT NULL COMMENT '产品类别（t_sys_pss_product_category.ID）',
  `PRODUCT_CODE` varchar(64) DEFAULT NULL COMMENT '产品编码',
  `PRODUCT_NAME` varchar(32) NOT NULL COMMENT '产品名称 ',
  `BARCODE` varchar(64) DEFAULT NULL COMMENT '条形码',
  `UNIT` varchar(64) DEFAULT NULL COMMENT '单位（字典）',
  `SUB_PRODUCT` varchar(64) DEFAULT NULL COMMENT '下级产品ID（t_sys_pss_product.ID）',
  `SUB_PRODUCT_COUNT` smallint(6) DEFAULT NULL COMMENT '下级产品个数',
  `PURCHASE_PRICE` varchar(10) DEFAULT NULL COMMENT '参考进价',
  `REFERENCE_PRICE` varchar(10) DEFAULT NULL COMMENT '参考售价',
  `RETAIL_PRICE` varchar(10) NOT NULL COMMENT '零售价',
  `REMARKS` varchar(512) DEFAULT NULL COMMENT '备注',
  `IMAGE_URL1` varchar(512) DEFAULT NULL COMMENT '图片（URL）',
  `IMAGE_URL2` varchar(512) DEFAULT NULL COMMENT '图片（URL）',
  `IMAGE_URL3` varchar(512) DEFAULT NULL COMMENT '图片（URL）',
  `IMAGE_URL4` varchar(512) DEFAULT NULL COMMENT '图片（URL）',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='产品表';

-- DROP TABLE IF EXISTS `t_sys_pss_store`;
CREATE TABLE IF NOT EXISTS `t_sys_pss_store` (
  `ID` varchar(64) NOT NULL COMMENT '主键',
  `INSERT_TIME` varchar(17) NOT NULL COMMENT '新增时间（yyyyMMddHHmmssSSS）',
  `USING_STATUS` varchar(10) NOT NULL COMMENT '在用状态（枚举）',
  `COMP_ID` varchar(64) NOT NULL COMMENT '公司ID（t_sys_comp.ID）',
  `STORAGE_ID` varchar(64) NOT NULL COMMENT '仓库ID（t_sys_pss_storage.ID）',
  `STORE_CODE` varchar(64) DEFAULT NULL COMMENT '门店编码',
  `STORE_NAME` varchar(32) NOT NULL COMMENT '门店名称',
  `ADDRESS` varchar(50) DEFAULT NULL COMMENT '门店地址',
  `RESPONSIBLE_PERSON` varchar(64) DEFAULT NULL COMMENT '负责人ID（t_sys_employee.ID）',
  `REMARKS` varchar(512) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='门店表';

-- DROP TABLE IF EXISTS `t_sys_pss_store_cashier`;
CREATE TABLE IF NOT EXISTS `t_sys_pss_store_cashier` (
  `ID` varchar(64) NOT NULL COMMENT '主键',
  `COMP_ID` varchar(64) NOT NULL COMMENT '公司ID（t_sys_comp.ID）',
  `CASHIER` varchar(64) NOT NULL COMMENT '收银员登录ID（t_sys_employee.ID）',
  `STORE_ID` varchar(64) NOT NULL COMMENT '门店ID（t_sys_pss_store.ID）',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='门店收银员表';

-- DROP TABLE IF EXISTS `t_sys_pss_stock`;
CREATE TABLE IF NOT EXISTS `t_sys_pss_stock` (
  `ID` varchar(64) NOT NULL COMMENT '主键',
  `COMP_ID` varchar(64) NOT NULL COMMENT '公司ID（t_sys_comp.ID）',
  `STORAGE_ID` varchar(64) NOT NULL COMMENT '仓库ID（t_sys_pss_storage.ID）',
  `PRODUCT_ID` varchar(64) NOT NULL COMMENT '产品ID（t_sys_pss_product.ID）',
  `QUANTITY` int(11) NOT NULL COMMENT '产品数量',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='库存表';

-- DROP TABLE IF EXISTS `t_sys_pss_purchase_order`;
CREATE TABLE IF NOT EXISTS `t_sys_pss_purchase_order` (
  `ID` varchar(64) NOT NULL COMMENT '主键',
  `INSERT_TIME` varchar(17) NOT NULL COMMENT '新增时间（yyyyMMddHHmmssSSS）',
  `USING_STATUS` varchar(10) NOT NULL COMMENT '在用状态（枚举）',
  `COMP_ID` varchar(64) NOT NULL COMMENT '公司ID（t_sys_comp.ID）',
  `APPROVAL_STATUS` varchar(9) NOT NULL COMMENT '审批状态（枚举）',
  `APPROVAL_TIME` varchar(17) DEFAULT NULL COMMENT '审批时间（yyyyMMddHHmmssSSS）',
  `ORDER_NO` varchar(32) NOT NULL COMMENT '订单号（yyyyMMddHHmmssSSS+15位随即）',
  `BILL_DATE` varchar(10) NOT NULL COMMENT '订单日期（yyyy-MM-dd）',
  `REMARKS` varchar(512) DEFAULT NULL COMMENT '备注',
  `SUPPLIER_ID` varchar(64) NOT NULL COMMENT '供应商ID（t_sys_pss_supplier.ID）',
  `PURCHASER_ID` varchar(64) DEFAULT NULL COMMENT '采购人ID（t_sys_employee.ID）',
  `ORDER_AMOUNT` varchar(10) NOT NULL COMMENT '订单金额',
  `INVENTORY_STATUS` varchar(4) NOT NULL COMMENT '入库状态（枚举）',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='采购订单表';

-- DROP TABLE IF EXISTS `t_sys_pss_purchase_order_product`;
CREATE TABLE IF NOT EXISTS `t_sys_pss_purchase_order_product` (
  `ID` varchar(64) NOT NULL COMMENT '主键',
  `ORDER_ID` varchar(64) NOT NULL COMMENT '订单ID（t_sys_pss_purchase_order.ID）',
  `PRODUCT_ID` varchar(64) NOT NULL COMMENT '产品ID（t_sys_pss_product.ID）',
  `QUANTITY` int(11) NOT NULL COMMENT '产品数量',
  `SORT_ID` int(11) NOT NULL COMMENT '排序号',
  `INVENTORY_QUANTITY` int(11) NOT NULL COMMENT '已入库数量',
  `UNIT_PRICE` varchar(10) NOT NULL COMMENT '单价',
  `SUB_TOTAL_PRICE` varchar(10) NOT NULL COMMENT '小计（UNIT_PRICE*QUANTITY）',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='采购订单产品表';

-- DROP TABLE IF EXISTS `t_sys_pss_purchase_stock_order`;
CREATE TABLE IF NOT EXISTS `t_sys_pss_purchase_stock_order` (
  `ID` varchar(64) NOT NULL COMMENT '主键',
  `INSERT_TIME` varchar(17) NOT NULL COMMENT '新增时间（yyyyMMddHHmmssSSS）',
  `USING_STATUS` varchar(10) NOT NULL COMMENT '在用状态（枚举）',
  `COMP_ID` varchar(64) NOT NULL COMMENT '公司ID（t_sys_comp.ID）',
  `APPROVAL_STATUS` varchar(9) NOT NULL COMMENT '审批状态（枚举）',
  `APPROVAL_TIME` varchar(17) DEFAULT NULL COMMENT '审批时间（yyyyMMddHHmmssSSS）',
  `ORDER_NO` varchar(32) NOT NULL COMMENT '订单号（yyyyMMddHHmmssSSS+15位随即）',
  `BILL_DATE` varchar(10) NOT NULL COMMENT '订单日期（yyyy-MM-dd）',
  `REMARKS` varchar(512) DEFAULT NULL COMMENT '备注',
  `STORAGE_ID` varchar(64) NOT NULL COMMENT '仓库ID（t_sys_pss_storage.ID）',
  `ORDER_TYPE` bit(1) NOT NULL COMMENT '订单类型（true:入库;false:出库;）',
  `ORDER_ID` varchar(64) NOT NULL COMMENT '采购单ID（t_sys_pss_purchase_order.ID）',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT '采购库存单表';

-- DROP TABLE IF EXISTS `t_sys_pss_purchase_stock_order_product`;
CREATE TABLE IF NOT EXISTS `t_sys_pss_purchase_stock_order_product` (
  `ID` varchar(64) NOT NULL COMMENT '主键',
  `ORDER_ID` varchar(64) NOT NULL COMMENT '订单ID（t_sys_pss_purchase_stock_order.ID）',
  `PRODUCT_ID` varchar(64) NOT NULL COMMENT '产品ID（t_sys_pss_product.ID）',
  `QUANTITY` int(11) NOT NULL COMMENT '产品数量',
  `SORT_ID` int(11) NOT NULL COMMENT '排序号',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT '采购库存单产品表';

-- DROP TABLE IF EXISTS `t_sys_pss_sell_order`;
CREATE TABLE IF NOT EXISTS `t_sys_pss_sell_order` (
  `ID` varchar(64) NOT NULL COMMENT '主键',
  `INSERT_TIME` varchar(17) NOT NULL COMMENT '新增时间（yyyyMMddHHmmssSSS）',
  `USING_STATUS` varchar(10) NOT NULL COMMENT '在用状态（枚举）',
  `COMP_ID` varchar(64) NOT NULL COMMENT '公司ID（t_sys_comp.ID）',
  `APPROVAL_STATUS` varchar(9) NOT NULL COMMENT '审批状态（枚举）',
  `APPROVAL_TIME` varchar(17) DEFAULT NULL COMMENT '审批时间（yyyyMMddHHmmssSSS）',
  `ORDER_NO` varchar(32) NOT NULL COMMENT '订单号（yyyyMMddHHmmssSSS+15位随即）',
  `BILL_DATE` varchar(10) NOT NULL COMMENT '订单日期（yyyy-MM-dd）',
  `REMARKS` varchar(512) DEFAULT NULL COMMENT '备注',
  `SALES_ID` varchar(64) DEFAULT NULL COMMENT '销售人ID（t_sys_employee.ID）',
  `ORDER_AMOUNT` varchar(10) NOT NULL COMMENT '订单金额',
  `INVENTORY_STATUS` varchar(4) NOT NULL COMMENT '出库状态（枚举）',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT '销售订单表';

-- DROP TABLE IF EXISTS `t_sys_pss_sell_order_product`;
CREATE TABLE IF NOT EXISTS `t_sys_pss_sell_order_product` (
  `ID` varchar(64) NOT NULL COMMENT '主键',
  `ORDER_ID` varchar(64) NOT NULL COMMENT '订单ID（t_sys_pss_sell_order.ID）',
  `PRODUCT_ID` varchar(64) NOT NULL COMMENT '产品ID（t_sys_pss_product.ID）',
  `QUANTITY` int(11) NOT NULL COMMENT '产品数量',
  `SORT_ID` int(11) NOT NULL COMMENT '排序号',
  `INVENTORY_QUANTITY` int(11) NOT NULL COMMENT '已出库数量',
  `UNIT_PRICE` varchar(10) NOT NULL COMMENT '单价',
  `SUB_TOTAL_PRICE` varchar(10) NOT NULL COMMENT '小计（UNIT_PRICE*QUANTITY）',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT '销售订单产品表';

-- DROP TABLE IF EXISTS `t_sys_pss_sell_stock_order`;
CREATE TABLE IF NOT EXISTS `t_sys_pss_sell_stock_order` (
  `ID` varchar(64) NOT NULL COMMENT '主键',
  `INSERT_TIME` varchar(17) NOT NULL COMMENT '新增时间（yyyyMMddHHmmssSSS）',
  `USING_STATUS` varchar(10) NOT NULL COMMENT '在用状态（枚举）',
  `COMP_ID` varchar(64) NOT NULL COMMENT '公司ID（t_sys_comp.ID）',
  `APPROVAL_STATUS` varchar(9) NOT NULL COMMENT '审批状态（枚举）',
  `APPROVAL_TIME` varchar(17) DEFAULT NULL COMMENT '审批时间（yyyyMMddHHmmssSSS）',
  `ORDER_NO` varchar(32) NOT NULL COMMENT '订单号（yyyyMMddHHmmssSSS+15位随即）',
  `BILL_DATE` varchar(10) NOT NULL COMMENT '订单日期（yyyy-MM-dd）',
  `REMARKS` varchar(512) DEFAULT NULL COMMENT '备注',
  `STORAGE_ID` varchar(64) NOT NULL COMMENT '仓库ID（t_sys_pss_storage.ID）',
  `ORDER_TYPE` bit(1) NOT NULL COMMENT '订单类型（true:入库;false:出库;）',
  `ORDER_ID` varchar(64) NOT NULL COMMENT '销售单ID（t_sys_pss_sell_order.ID）',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT '销售库存单表';

-- DROP TABLE IF EXISTS `t_sys_pss_sell_stock_order_product`;
CREATE TABLE IF NOT EXISTS `t_sys_pss_sell_stock_order_product` (
  `ID` varchar(64) NOT NULL COMMENT '主键',
  `ORDER_ID` varchar(64) NOT NULL COMMENT '订单ID（t_sys_pss_sell_stock_order.ID）',
  `PRODUCT_ID` varchar(64) NOT NULL COMMENT '产品ID（t_sys_pss_product.ID）',
  `QUANTITY` int(11) NOT NULL COMMENT '产品数量',
  `SORT_ID` int(11) NOT NULL COMMENT '排序号',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT '销售库存单产品表';

-- DROP TABLE IF EXISTS `t_sys_pss_other_stock_order`;
CREATE TABLE IF NOT EXISTS `t_sys_pss_other_stock_order` (
  `ID` varchar(64) NOT NULL COMMENT '主键',
  `INSERT_TIME` varchar(17) NOT NULL COMMENT '新增时间（yyyyMMddHHmmssSSS）',
  `USING_STATUS` varchar(10) NOT NULL COMMENT '在用状态（枚举）',
  `COMP_ID` varchar(64) NOT NULL COMMENT '公司ID（t_sys_comp.ID）',
  `APPROVAL_STATUS` varchar(9) NOT NULL COMMENT '审批状态（枚举）',
  `APPROVAL_TIME` varchar(17) DEFAULT NULL COMMENT '审批时间（yyyyMMddHHmmssSSS）',
  `ORDER_NO` varchar(32) NOT NULL COMMENT '订单号（yyyyMMddHHmmssSSS+15位随即）',
  `BILL_DATE` varchar(10) NOT NULL COMMENT '订单日期（yyyy-MM-dd）',
  `REMARKS` varchar(512) DEFAULT NULL COMMENT '备注',
  `STORAGE_ID` varchar(64) NOT NULL COMMENT '仓库ID（t_sys_pss_storage.ID）',
  `ORDER_TYPE` bit(1) NOT NULL COMMENT '订单类型（true:入库;false:出库;）',
  `STORAGE_TYPE` varchar(64) NOT NULL COMMENT '出入库类型（字典）',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT '其它库存单表';

-- DROP TABLE IF EXISTS `t_sys_pss_other_stock_order_product`;
CREATE TABLE IF NOT EXISTS `t_sys_pss_other_stock_order_product` (
  `ID` varchar(64) NOT NULL COMMENT '主键',
  `ORDER_ID` varchar(64) NOT NULL COMMENT '订单ID（t_sys_pss_other_stock_order.ID）',
  `PRODUCT_ID` varchar(64) NOT NULL COMMENT '产品ID（t_sys_pss_product.ID）',
  `QUANTITY` int(11) NOT NULL COMMENT '产品数量',
  `SORT_ID` int(11) NOT NULL COMMENT '排序号',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT '其它库存单表产品表';

-- DROP TABLE IF EXISTS `t_sys_pss_allot_order`;
CREATE TABLE IF NOT EXISTS `t_sys_pss_allot_order` (
  `ID` varchar(64) NOT NULL COMMENT '主键',
  `INSERT_TIME` varchar(17) NOT NULL COMMENT '新增时间（yyyyMMddHHmmssSSS）',
  `USING_STATUS` varchar(10) NOT NULL COMMENT '在用状态（枚举）',
  `COMP_ID` varchar(64) NOT NULL COMMENT '公司ID（t_sys_comp.ID）',
  `APPROVAL_STATUS` varchar(9) NOT NULL COMMENT '审批状态（枚举）',
  `APPROVAL_TIME` varchar(17) DEFAULT NULL COMMENT '审批时间（yyyyMMddHHmmssSSS）',
  `ORDER_NO` varchar(32) NOT NULL COMMENT '订单号（yyyyMMddHHmmssSSS+15位随即）',
  `BILL_DATE` varchar(10) NOT NULL COMMENT '订单日期（yyyy-MM-dd）',
  `REMARKS` varchar(512) DEFAULT NULL COMMENT '备注',
  `OUT_STORAGE_ID` varchar(64) NOT NULL COMMENT '出库仓库ID（t_sys_pss_storage.ID）',
  `IN_STORAGE_ID` varchar(64) NOT NULL COMMENT '入库仓库ID（t_sys_pss_storage.ID）',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT '调拨单表';

-- DROP TABLE IF EXISTS `t_sys_pss_allot_order_product`;
CREATE TABLE IF NOT EXISTS `t_sys_pss_allot_order_product` (
  `ID` varchar(64) NOT NULL COMMENT '主键',
  `ORDER_ID` varchar(64) NOT NULL COMMENT '订单ID（t_sys_pss_allot_order.ID）',
  `PRODUCT_ID` varchar(64) NOT NULL COMMENT '产品ID（t_sys_pss_product.ID）',
  `QUANTITY` int(11) NOT NULL COMMENT '产品数量',
  `SORT_ID` int(11) NOT NULL COMMENT '排序号',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT '调拨单产品表';

-- DROP TABLE IF EXISTS `t_sys_pss_stock_check_order`;
CREATE TABLE IF NOT EXISTS `t_sys_pss_stock_check_order` (
  `ID` varchar(64) NOT NULL COMMENT '主键',
  `INSERT_TIME` varchar(17) NOT NULL COMMENT '新增时间（yyyyMMddHHmmssSSS）',
  `USING_STATUS` varchar(10) NOT NULL COMMENT '在用状态（枚举）',
  `COMP_ID` varchar(64) NOT NULL COMMENT '公司ID（t_sys_comp.ID）',
  `APPROVAL_STATUS` varchar(9) NOT NULL COMMENT '审批状态（枚举）',
  `APPROVAL_TIME` varchar(17) DEFAULT NULL COMMENT '审批时间（yyyyMMddHHmmssSSS）',
  `ORDER_NO` varchar(32) NOT NULL COMMENT '订单号（yyyyMMddHHmmssSSS+15位随即）',
  `BILL_DATE` varchar(10) NOT NULL COMMENT '订单日期（yyyy-MM-dd）',
  `REMARKS` varchar(512) DEFAULT NULL COMMENT '备注',
  `STORAGE_ID` varchar(64) NOT NULL COMMENT '仓库ID（t_sys_pss_storage.ID）',
  `STOCK_CHECK_COUNT` int(11) NOT NULL COMMENT '盘点产品数',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT '盘点订单表';

-- DROP TABLE IF EXISTS `t_sys_pss_stock_check_order_product`;
CREATE TABLE IF NOT EXISTS `t_sys_pss_stock_check_order_product` (
  `ID` varchar(64) NOT NULL COMMENT '主键',
  `ORDER_ID` varchar(64) NOT NULL COMMENT '订单ID（t_sys_pss_stock_check_order.ID）',
  `PRODUCT_ID` varchar(64) NOT NULL COMMENT '产品ID（t_sys_pss_product.ID）',
  `QUANTITY` int(11) NOT NULL COMMENT '产品数量',
  `SORT_ID` int(11) NOT NULL COMMENT '排序号',
  `STOCK_QUANTITY` int(11) NOT NULL COMMENT '库存数量',
  `DIFFERENCE_QUANTITY` int(11) NOT NULL COMMENT '盘盈盘亏数量（盘点数量 - 库存数量）',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT '盘点订单产品表';

