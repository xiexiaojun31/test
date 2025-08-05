
-- -- public.lc_inp_ird definition

-- -- Drop table

-- -- DROP TABLE lc_inp_ird;
-- drop table IF EXISTS lc_inp_ird;
-- CREATE TABLE IF NOT EXISTS lc_inp_ird (
-- 	mrp_control_class varchar(3) NOT NULL,
-- 	sys_owner_cd varchar(4) NOT NULL,
-- 	itemno varchar(30) NOT NULL,
-- 	supplier varchar(4) NOT NULL,
-- 	usercd varchar(4) NOT NULL,
-- 	order_no varchar(5) NOT NULL,
-- 	start_date varchar(8) NOT NULL,
-- 	order_through_no varchar(6) NOT NULL,
-- 	order_through_no_source_flg varchar(1) NOT NULL,
-- 	rd_class varchar(1) NOT NULL,
-- 	ind_user_class varchar(1) NOT NULL,
-- 	ind_user_code varchar(4) NOT NULL,
-- 	rls_start_date varchar(8) NOT NULL,
-- 	order_status varchar(1) NOT NULL,
-- 	reason_code varchar(2) NOT NULL,
-- 	fixed_ymd varchar(8) NOT NULL,
-- 	pilot_class varchar(1) NOT NULL,
-- 	pilot_condition_type varchar(1) NOT NULL,
-- 	required_qty numeric(15, 5) NOT NULL,
-- 	remark varchar(64) NOT NULL,
-- 	request_system_code varchar(2) NOT NULL,
-- 	group_receive_flg varchar(1) NOT NULL,
-- 	ship_qty numeric(15, 5) NOT NULL,
-- 	bo_qty numeric(15, 5) NOT NULL,
-- 	delivery_card_status varchar(1) NOT NULL,
-- 	item_card_status varchar(1) NOT NULL,
-- 	ship_date varchar(8) NOT NULL,
-- 	transfer_class varchar(1) NOT NULL,
-- 	transfer_code varchar(4) NOT NULL,
-- 	transfer_reason_code varchar(2) NOT NULL,
-- 	account_heading varchar(5) NOT NULL,
-- 	account_detail varchar(4) NOT NULL,
-- 	budget_no varchar(4) NOT NULL,
-- 	account_code_sales varchar(4) NOT NULL,
-- 	sp_order_class varchar(1) NOT NULL,
-- 	sp_delivery_code varchar(4) NOT NULL,
-- 	sp_dealer_no varchar(4) NOT NULL,
-- 	sp_order_no varchar(7) NOT NULL,
-- 	operation_no int4 NOT NULL,
-- 	operation_seq int4 NOT NULL,
-- 	batch_status varchar(1) NOT NULL,
-- 	mrp_date varchar(8) NOT NULL,
-- 	delete_ymd varchar(8) NOT NULL,
-- 	register_user_name varchar(30) NOT NULL,
-- 	update_counter numeric(10) NOT NULL,
-- 	create_datetime timestamp(6) NOT NULL,
-- 	create_author varchar(15) NOT NULL,
-- 	update_datetime timestamp(6) NOT NULL,
-- 	update_author varchar(15) NOT NULL,
-- 	update_pgmid varchar(15) NOT NULL,
-- 	CONSTRAINT lc_inp_ird_pk PRIMARY KEY (itemno, supplier, usercd, order_no, start_date, sys_owner_cd, mrp_control_class)
-- )
-- --WITH (
-- --	fillfactor=90
-- --)
-- ;


-- -- public.lc_inp_pymac_date definition

-- -- Drop table

-- -- DROP TABLE lc_inp_pymac_date;
-- drop table IF EXISTS lc_inp_pymac_date;
-- CREATE TABLE IF NOT EXISTS lc_inp_pymac_date (
-- 	mrp_control_class varchar(3) NOT NULL,
-- 	sys_owner_cd varchar(4) NOT NULL,
-- 	pymac_date varchar(8) NOT NULL,
-- 	batch_start_datetime timestamp(6) NULL,
-- 	batch_end_datetime timestamp(6) NULL,
-- 	online_start_datetime timestamp(6) NULL,
-- 	base_datetime timestamp(6) NULL,
-- 	update_counter numeric(10) NOT NULL,
-- 	create_datetime timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
-- 	create_author varchar(15) NOT NULL,
-- 	update_datetime timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
-- 	update_author varchar(15) NOT NULL,
-- 	update_pgmid varchar(15) NOT NULL,
-- 	CONSTRAINT lc_inp_pymac_date_pk PRIMARY KEY (sys_owner_cd, mrp_control_class)
-- )
-- --WITH (
-- --	fillfactor=90
-- --)
-- ;


-- -- public.lc_system_parameter definition

-- -- Drop table

-- -- DROP TABLE lc_system_parameter;
-- drop table IF EXISTS lc_system_parameter;
-- CREATE TABLE IF NOT EXISTS lc_system_parameter (
-- 	sys_owner_cd varchar(4) NOT NULL,
-- 	system_code varchar(10) NOT NULL,
-- 	order_delete_days numeric(3) NOT NULL,
-- 	history_delete_days numeric(3) NOT NULL,
-- 	rd_auto_delete_days numeric(3) NOT NULL,
-- 	delete_holding_days numeric(3) NOT NULL,
-- 	complete_holding_days numeric(3) NOT NULL,
-- 	extra_plan_pdf_holding_days numeric(3) NOT NULL,
-- 	plan_pdf_holding_generations numeric(2) NOT NULL,
-- 	rd_input_days numeric(3) NOT NULL,
-- 	rd_delete_input_days numeric(3) NOT NULL,
-- 	multiple_qty_confirm_days numeric(3) NOT NULL,
-- 	fix_safety_stock_confirm_days numeric(3) NOT NULL,
-- 	safety_stock_day numeric(3) NOT NULL,
-- 	safety_stock_confirm_days numeric(3) NOT NULL,
-- 	safety_stock_past_days numeric(3) NOT NULL,
-- 	time_deliv_lot_sizing_qty numeric(15, 5) NOT NULL,
-- 	time_deliv_lot_qty_class varchar(1) NOT NULL,
-- 	line_split_class varchar(1) NOT NULL,
-- 	pp_orderno_class varchar(1) NOT NULL,
-- 	fullpeg_max_days numeric(3) NOT NULL,
-- 	scplan_forecast_days numeric(3) NOT NULL,
-- 	scplan_fix_days numeric(3) NOT NULL,
-- 	od_rd_allocated_days numeric(3) NOT NULL,
-- 	assy_lot_synchro_days numeric(3) NOT NULL,
-- 	bt_sum_days numeric(3) NOT NULL,
-- 	mrp_run_mode varchar(3) NOT NULL,
-- 	scplan_sys_owner_cd varchar(2) NOT NULL,
-- 	max_shift_qty varchar(2) NOT NULL,
-- 	shift_begin_time varchar(4) NOT NULL,
-- 	raw_material_sign varchar(1) NOT NULL,
-- 	rec_dtl_holding_days numeric(3) NOT NULL,
-- 	rec_dtl_out_his_holding_days numeric(3) NOT NULL,
-- 	vendor_plan_holding_days numeric(3) NOT NULL,
-- 	vendor_extra_plan_holding_days numeric(3) NOT NULL,
-- 	vendor_plan_display_days numeric(3) NOT NULL,
-- 	vendor_print_pg_latest_ver varchar(10) NOT NULL,
-- 	vendor_print_pg_support_ver varchar(10) NOT NULL,
-- 	update_counter numeric(10) NOT NULL,
-- 	create_datetime timestamp(6) NOT NULL,
-- 	create_author varchar(15) NOT NULL,
-- 	update_datetime timestamp(6) NOT NULL,
-- 	update_author varchar(15) NOT NULL,
-- 	update_pgmid varchar(15) NOT NULL,
-- 	CONSTRAINT lc_system_parameter_pk PRIMARY KEY (sys_owner_cd, system_code)
-- )
-- --WITH (
-- --	fillfactor=90
-- --)
-- ;


-- ----------------------------------------


-- INSERT INTO lc_inp_ird
-- (mrp_control_class, sys_owner_cd, itemno, supplier, usercd, order_no, start_date, order_through_no, order_through_no_source_flg, rd_class, ind_user_class, ind_user_code, rls_start_date, order_status, reason_code, fixed_ymd, pilot_class, pilot_condition_type, required_qty, remark, request_system_code, group_receive_flg, ship_qty, bo_qty, delivery_card_status, item_card_status, ship_date, transfer_class, transfer_code, transfer_reason_code, account_heading, account_detail, budget_no, account_code_sales, sp_order_class, sp_delivery_code, sp_dealer_no, sp_order_no, operation_no, operation_seq, batch_status, mrp_date, delete_ymd, register_user_name, update_counter, create_datetime, create_author, update_datetime, update_author, update_pgmid)
-- VALUES('XXX', '0000', 'CS343813Y00080', '9340', '9340', 'Q0096', '20151215', '000000', '0', '0', '1', '8998', '20151215', '2', '91', '20151203', ' ', '0', 288.00000, 'a', '15', '0', 240.00000, 48.00000, '1', '0', '20151215', '1', '8998', '11', ' ', ' ', ' ', '9999', '9', '0000', '9999', '0000000', 0, 0, '0', '20151203', ' ', 'a', 0, '2015-12-03 08:00:00.000', 'TOUGOU', '2015-12-15 14:05:00.000', '04l5060', 'CONV');
-- INSERT INTO lc_inp_ird
-- (mrp_control_class, sys_owner_cd, itemno, supplier, usercd, order_no, start_date, order_through_no, order_through_no_source_flg, rd_class, ind_user_class, ind_user_code, rls_start_date, order_status, reason_code, fixed_ymd, pilot_class, pilot_condition_type, required_qty, remark, request_system_code, group_receive_flg, ship_qty, bo_qty, delivery_card_status, item_card_status, ship_date, transfer_class, transfer_code, transfer_reason_code, account_heading, account_detail, budget_no, account_code_sales, sp_order_class, sp_delivery_code, sp_dealer_no, sp_order_no, operation_no, operation_seq, batch_status, mrp_date, delete_ymd, register_user_name, update_counter, create_datetime, create_author, update_datetime, update_author, update_pgmid)
-- VALUES('XXX', '0000', '04111748610T80', '9338', '9338', 'X0008', '20160115', '111111', '1', '0', '1', '9731', '20160115', '9', '94', '20151217', ' ', '0', 1.00000, 'aa', '14', '1', 0.00000, 1.00000, '1', '1', ' ', '2', '1604', '22', '781', '52', '1404', '8888', '8', '1111', '8888', '1111111', 0, 0, '0', '20151217', '20160114', 'b', 0, '2015-12-16 07:21:37.000', '040S206', '2016-01-14 07:19:42.000', '0s0s203', 'CONV');
-- INSERT INTO lc_inp_ird
-- (mrp_control_class, sys_owner_cd, itemno, supplier, usercd, order_no, start_date, order_through_no, order_through_no_source_flg, rd_class, ind_user_class, ind_user_code, rls_start_date, order_status, reason_code, fixed_ymd, pilot_class, pilot_condition_type, required_qty, remark, request_system_code, group_receive_flg, ship_qty, bo_qty, delivery_card_status, item_card_status, ship_date, transfer_class, transfer_code, transfer_reason_code, account_heading, account_detail, budget_no, account_code_sales, sp_order_class, sp_delivery_code, sp_dealer_no, sp_order_no, operation_no, operation_seq, batch_status, mrp_date, delete_ymd, register_user_name, update_counter, create_datetime, create_author, update_datetime, update_author, update_pgmid)
-- VALUES('XXX', '0000', '10218416000080', '3567', '7574', 'A0014', '20160427', '222222', '2', '2', ' ', ' ', '00000000', '2', '95', '20160602', ' ', ' ', 2426.00000, ' ', ' ', '2', 226.00000, 2200.00000, '0', '0', ' ', ' ', ' ', '33', ' ', ' ', ' ', '7777', '7', '2222', '7777', '2222222', 0, 0, '0', '20160602', ' ', 'c', 0, '2016-06-02 08:00:00.000', ' ', '2016-06-02 08:00:00.000', ' ', 'CONV');
-- INSERT INTO lc_inp_ird
-- (mrp_control_class, sys_owner_cd, itemno, supplier, usercd, order_no, start_date, order_through_no, order_through_no_source_flg, rd_class, ind_user_class, ind_user_code, rls_start_date, order_status, reason_code, fixed_ymd, pilot_class, pilot_condition_type, required_qty, remark, request_system_code, group_receive_flg, ship_qty, bo_qty, delivery_card_status, item_card_status, ship_date, transfer_class, transfer_code, transfer_reason_code, account_heading, account_detail, budget_no, account_code_sales, sp_order_class, sp_delivery_code, sp_dealer_no, sp_order_no, operation_no, operation_seq, batch_status, mrp_date, delete_ymd, register_user_name, update_counter, create_datetime, create_author, update_datetime, update_author, update_pgmid)
-- VALUES('XXX', '0000', '04111748610T80', '9338', '9338', 'X0028', '20160615', '333333', '3', '0', '1', '9731', '20160615', '2', '94', '20160602', ' ', '0', 1.00000, 'b', '14', '3', 0.00000, 1.00000, '1', '1', '20160101', '2', '1604', '44', '781', '52', '1404', '6666', '6', '3333', '6666', '3333333', 17669912, 1, '0', '20160602', ' ', 'd', 0, '2016-05-20 07:29:20.000', '040S206', '2016-06-02 23:14:54.000', 'SYSTEM', 'CONV');
-- INSERT INTO lc_inp_ird
-- (mrp_control_class, sys_owner_cd, itemno, supplier, usercd, order_no, start_date, order_through_no, order_through_no_source_flg, rd_class, ind_user_class, ind_user_code, rls_start_date, order_status, reason_code, fixed_ymd, pilot_class, pilot_condition_type, required_qty, remark, request_system_code, group_receive_flg, ship_qty, bo_qty, delivery_card_status, item_card_status, ship_date, transfer_class, transfer_code, transfer_reason_code, account_heading, account_detail, budget_no, account_code_sales, sp_order_class, sp_delivery_code, sp_dealer_no, sp_order_no, operation_no, operation_seq, batch_status, mrp_date, delete_ymd, register_user_name, update_counter, create_datetime, create_author, update_datetime, update_author, update_pgmid)
-- VALUES('XXX', '0000', '04111748610T80', '9338', '9338', 'X0009', '20160115', '444444', '4', '0', '1', '9731', '20160115', '9', '94', '20151217', ' ', '0', 1.00000, 'bb', '14', '4', 0.00000, 1.00000, '1', '1', ' ', '2', '1604', '55', '781', '52', '1404', '5555', '5', '4444', '5555', '4444444', 0, 0, '0', '20151217', '20160114', 'e', 0, '2015-12-16 07:21:37.000', '040S206', '2017-01-14 07:19:42.000', '0s0s203', 'CONV');
-- INSERT INTO lc_inp_ird
-- (mrp_control_class, sys_owner_cd, itemno, supplier, usercd, order_no, start_date, order_through_no, order_through_no_source_flg, rd_class, ind_user_class, ind_user_code, rls_start_date, order_status, reason_code, fixed_ymd, pilot_class, pilot_condition_type, required_qty, remark, request_system_code, group_receive_flg, ship_qty, bo_qty, delivery_card_status, item_card_status, ship_date, transfer_class, transfer_code, transfer_reason_code, account_heading, account_detail, budget_no, account_code_sales, sp_order_class, sp_delivery_code, sp_dealer_no, sp_order_no, operation_no, operation_seq, batch_status, mrp_date, delete_ymd, register_user_name, update_counter, create_datetime, create_author, update_datetime, update_author, update_pgmid)
-- VALUES('XXX', '0000', '1RC11531000080', '9141', '9141', 'M0044', '20160615', '555555', '5', '0', '1', '9937', '20160615', '2', '29', '20160602', '4', ' ', 50.00000, 'HB82-036', ' ', '5', 0.00000, 50.00000, '1', '1', ' ', '1', '9141', '66', ' ', ' ', ' ', '4444', '4', '5555', '4444', '5555555', 17581542, 4, '0', '20160602', ' ', 'f', 0, '2016-04-22 09:27:29.000', '0135883', '2016-06-02 23:14:54.000', 'SYSTEM', 'CONV');
-- INSERT INTO lc_inp_ird
-- (mrp_control_class, sys_owner_cd, itemno, supplier, usercd, order_no, start_date, order_through_no, order_through_no_source_flg, rd_class, ind_user_class, ind_user_code, rls_start_date, order_status, reason_code, fixed_ymd, pilot_class, pilot_condition_type, required_qty, remark, request_system_code, group_receive_flg, ship_qty, bo_qty, delivery_card_status, item_card_status, ship_date, transfer_class, transfer_code, transfer_reason_code, account_heading, account_detail, budget_no, account_code_sales, sp_order_class, sp_delivery_code, sp_dealer_no, sp_order_no, operation_no, operation_seq, batch_status, mrp_date, delete_ymd, register_user_name, update_counter, create_datetime, create_author, update_datetime, update_author, update_pgmid)
-- VALUES('XXX', '0000', '10360880A40T80', '7581', '9305', 'P0081', '20160617', '666666', '6', '3', ' ', ' ', '20160617', '2', ' ', '20160602', ' ', ' ', 36.00000, 'c', '13', '6', 0.00000, 36.00000, '0', '0', '20160401', ' ', '  ', '77', ' ', ' ', ' ', '3333', '3', '6666', '3333', '6666666', 17731146, 33, '0', '20160602', ' ', 'g', 0, '2016-06-02 21:03:29.000', 'SYSTEM', '2016-06-02 21:03:29.000', 'SYSTEM', 'CONV');


-- INSERT INTO lc_inp_pymac_date
-- (mrp_control_class, sys_owner_cd, pymac_date, batch_start_datetime, batch_end_datetime, online_start_datetime, base_datetime, update_counter, create_datetime, create_author, update_datetime, update_author, update_pgmid)
-- VALUES('XXX', '0000', '20160616', '2016-06-16 10:21:54.762', '2016-06-16 10:21:54.762', '2016-06-16 10:21:54.762', '2016-06-16 10:21:54.762', 7, '2016-06-16 10:21:54.762', 'CONV', '2016-05-26 10:19:53.465', 'LZAJ0002', 'LZAJ0002');


-- INSERT INTO lc_system_parameter
-- (sys_owner_cd, system_code, order_delete_days, history_delete_days, rd_auto_delete_days, delete_holding_days, complete_holding_days, extra_plan_pdf_holding_days, plan_pdf_holding_generations, rd_input_days, rd_delete_input_days, multiple_qty_confirm_days, fix_safety_stock_confirm_days, safety_stock_day, safety_stock_confirm_days, safety_stock_past_days, time_deliv_lot_sizing_qty, time_deliv_lot_qty_class, line_split_class, pp_orderno_class, fullpeg_max_days, scplan_forecast_days, scplan_fix_days, od_rd_allocated_days, assy_lot_synchro_days, bt_sum_days, mrp_run_mode, scplan_sys_owner_cd, max_shift_qty, shift_begin_time, raw_material_sign, rec_dtl_holding_days, rec_dtl_out_his_holding_days, vendor_plan_holding_days, vendor_extra_plan_holding_days, vendor_plan_display_days, vendor_print_pg_latest_ver, vendor_print_pg_support_ver, update_counter, create_datetime, create_author, update_datetime, update_author, update_pgmid)
-- VALUES('0000', 'XX', 10, 150, 220, 7, 7, 30, 4, 120, 220, 20, 15, 10, 30, 180, 100.00000, '1', '1', '1', 50, 730, 180, 100, 100, 100, 'MRP', 'L0', '08', '0800', 'Y', 40, 180, 10, 10, 10, '1.0', '1.0.0', 0, '2016-04-01 00:00:00.000', 'CONV', '2016-04-01 00:00:00.000', 'CONV', 'CONV');


-- ---------------------------------------------------------


-- CREATE OR REPLACE FUNCTION lcys0008(ps_mrp_control_class character varying, ps_sys_owner_cd character varying, ps_calendar_code character varying, ps_standard_date character varying, ps_days integer)
-- RETURNS TABLE(rn_status integer, rs_sql_code character varying, rs_err_code character varying, rs_err_msg character varying, rs_target_date character varying)
-- LANGUAGE plpgsql
-- AS $function$
-- DECLARE
--    --  lc_inp_calendar_sum Work Item  --
--    ln_days                     INTEGER;
--    ln_set_count                INTEGER;
--    ls_calendar_ymd             VARCHAR(08);

--    --  SQL Area  --
--    ls_select                   VARCHAR(500);
--    ls_from                     VARCHAR(50);
--    ls_where                    VARCHAR(500);
--    ls_order                    VARCHAR(50);
--    ls_sql                      VARCHAR(1000);

--    ls_where_ymd                VARCHAR(50);

--    --  record  --
--    rec_calendar                RECORD;

-- BEGIN

-- -------------------------------------------------------------------------------
-- --  Init
-- -------------------------------------------------------------------------------
--    ln_days                     :=  0 ;
--    ln_set_count                :=  0 ;
--    ls_calendar_ymd             := ' ';

--    rn_status                   :=  0 ;
--    rs_sql_code                 := ' ';
--    rs_err_code                 := ' ';
--    rs_err_msg                  := ' ';
--    rs_target_date              := ' ';

--    ls_select                   := ' ';
--    ls_from                     := ' ';
--    ls_where                    := ' ';
--    ls_order                    := ' ';
--    ls_sql                      := ' ';

--    ls_where_ymd                := ' ';

-- -------------------------------------------------------------------------------
-- --  Main
-- -------------------------------------------------------------------------------
-- --  << Argument Check >>  --
--    IF  ps_sys_owner_cd IS NULL OR TRIM(ps_sys_owner_cd) = '' THEN
--        rs_err_code    := 'E.LCP10015';
--        rs_err_msg     := 'Argument Error : [ ps_sys_owner_cd ] = ' ||
--                           COALESCE(ps_sys_owner_cd, 'NULL');
--        RAISE EXCEPTION ' ';
--    END IF;

--    IF  LENGTH(TRIM(ps_calendar_code)) <> 2  THEN
--        rs_err_code    := 'E.LCP10052';
--        rs_err_msg     := 'Argument Error : [ ps_calendar_code ] = ' ||
--                           COALESCE(ps_calendar_code, 'NULL');
--        RAISE EXCEPTION ' ';
--    END IF;

--    IF  LENGTH(TRIM(ps_standard_date)) <> 8  THEN
--        rs_err_code    := 'E.LCP10053';
--        rs_err_msg     := 'Argument Error : [ ps_standard_date ] = ' ||
--                           COALESCE(ps_standard_date, 'NULL');
--        RAISE EXCEPTION ' ';
--    END IF;

--    IF  ps_days IS NULL OR ps_days = 0  THEN
--        rs_err_code    := 'E.LCP10054';
--        rs_err_msg     := 'Argument Error : [ ps_days ] = ' ||
--                           COALESCE(to_char(ps_days,'999'), 'NULL');
--        RAISE EXCEPTION ' ';
--    END IF;

-- --  << Main Logic >>  --
--    --  return item set  --
--    rn_status       :=   0          ;
--    rs_sql_code     :=  ' '         ;
--    rs_err_code     :=  ' '         ;
--    rs_err_msg      :=  ' '         ;
--    rs_target_date  :=  '20250102'  ;

--    --  return item set ( Target Date Not Found )  --
--    -- rn_status       :=  100          ;
--    -- rs_sql_code     :=  ' '          ;
--    -- rs_err_code     :=  ' '          ;
--    -- rs_err_msg      :=  ' '          ;
--    -- rs_target_date  :=  ' '          ;

--    RETURN NEXT; 
--    RETURN;

-- EXCEPTION
--    WHEN RAISE_EXCEPTION THEN
--        rn_status              := -2;
--        rs_sql_code            := ' ';
-- --        rs_err_code            := ' ';
-- --        rs_err_msg             := SQLERRM;
--        rs_target_date         := ' ';

--        RETURN NEXT; 
--        RETURN;

--    WHEN OTHERS THEN
--        rn_status              := -1;
--        rs_sql_code            := SQLSTATE;
--        rs_err_code            := ' ';
--        rs_err_msg             := TRIM(SQLERRM);
--        rs_target_date         := ' ';

--        RETURN NEXT; 
--        RETURN;
-- END;
-- $function$
-- ;



