select distinct REQUEST_URL from t_sys_admin_oper_log where REQUEST_URL not in (select DICT_CODE from t_sys_dictionary where CATEGORY_CODE = 'ADMIN_BUS_TYPE');
