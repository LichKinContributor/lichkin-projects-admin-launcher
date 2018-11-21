-- 调拨单
DELETE FROM t_sys_pss_allot_order_product WHERE ORDER_ID IN (SELECT ID FROM t_sys_pss_allot_order WHERE COMP_ID = '20180101000000000_t_sys_comp_000000000000000000000000000_alibaba');
DELETE FROM t_sys_pss_allot_order WHERE COMP_ID = '20180101000000000_t_sys_comp_000000000000000000000000000_alibaba';

-- 其它出入库订单
DELETE FROM t_sys_pss_other_stock_order_product WHERE ORDER_ID IN (SELECT ID FROM t_sys_pss_other_stock_order WHERE COMP_ID = '20180101000000000_t_sys_comp_000000000000000000000000000_alibaba');
DELETE FROM t_sys_pss_other_stock_order WHERE COMP_ID = '20180101000000000_t_sys_comp_000000000000000000000000000_alibaba';

-- 采购出入库订单
DELETE FROM t_sys_pss_purchase_stock_order_product WHERE ORDER_ID IN (SELECT ID FROM t_sys_pss_purchase_stock_order WHERE COMP_ID = '20180101000000000_t_sys_comp_000000000000000000000000000_alibaba');
DELETE FROM t_sys_pss_purchase_stock_order WHERE COMP_ID = '20180101000000000_t_sys_comp_000000000000000000000000000_alibaba';

-- 采购单
DELETE FROM t_sys_pss_purchase_order_product WHERE ORDER_ID IN (SELECT ID FROM t_sys_pss_purchase_order WHERE COMP_ID = '20180101000000000_t_sys_comp_000000000000000000000000000_alibaba');
DELETE FROM t_sys_pss_purchase_order WHERE COMP_ID = '20180101000000000_t_sys_comp_000000000000000000000000000_alibaba';

-- 销售出入库订单
DELETE FROM t_sys_pss_sell_stock_order_product WHERE ORDER_ID IN (SELECT ID FROM t_sys_pss_sell_stock_order WHERE COMP_ID = '20180101000000000_t_sys_comp_000000000000000000000000000_alibaba');
DELETE FROM t_sys_pss_sell_stock_order WHERE COMP_ID = '20180101000000000_t_sys_comp_000000000000000000000000000_alibaba';

-- 销售单
DELETE FROM t_sys_pss_sell_order_product WHERE ORDER_ID IN (SELECT ID FROM t_sys_pss_sell_order WHERE COMP_ID = '20180101000000000_t_sys_comp_000000000000000000000000000_alibaba');
DELETE FROM t_sys_pss_sell_order WHERE COMP_ID = '20180101000000000_t_sys_comp_000000000000000000000000000_alibaba';

-- 盘点单
DELETE FROM t_sys_pss_stock_check_order_product WHERE ORDER_ID IN (SELECT ID FROM t_sys_pss_stock_check_order WHERE COMP_ID = '20180101000000000_t_sys_comp_000000000000000000000000000_alibaba');
DELETE FROM t_sys_pss_stock_check_order WHERE COMP_ID = '20180101000000000_t_sys_comp_000000000000000000000000000_alibaba';

-- 库存
DELETE FROM t_sys_pss_stock WHERE COMP_ID = '20180101000000000_t_sys_comp_000000000000000000000000000_alibaba';

-- 基础表
-- DELETE FROM t_sys_pss_storage WHERE COMP_ID = '20180101000000000_t_sys_comp_000000000000000000000000000_alibaba';
-- DELETE FROM t_sys_pss_store WHERE COMP_ID = '20180101000000000_t_sys_comp_000000000000000000000000000_alibaba';
-- DELETE FROM t_sys_pss_store_cashier WHERE COMP_ID = '20180101000000000_t_sys_comp_000000000000000000000000000_alibaba';
-- DELETE FROM t_sys_pss_supplier WHERE COMP_ID = '20180101000000000_t_sys_comp_000000000000000000000000000_alibaba';
-- DELETE FROM t_sys_pss_product WHERE COMP_ID = '20180101000000000_t_sys_comp_000000000000000000000000000_alibaba';
-- DELETE FROM t_sys_pss_product_category WHERE COMP_ID = '20180101000000000_t_sys_comp_000000000000000000000000000_alibaba';
