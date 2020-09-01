
select * from hf_like;

delete hf_like;
select * from hf_auc_goods;

update HF_AUC_GOODS set like_cnt = 0;
commit;

select * from hf_goods_photo;
select * from hf_auc_goods;

select no, auc_no as aucNo, save_name as saveName, ori_name as oriName, file_size as fileSize
		 from hf_goods_photo
		 where auc_no = 120;
         
select no, name, category, reg_date, start_date, end_date, start_price, member_nick, method, detail,
				view_cnt, like_cnt 
		 from hf_auc_goods
			where no = 120;
            
update hf_m_account set balance = 1000000 where member_nick ='nacastle';    

select * from hf_m_account;
commit;



select no, ori_name, auc_no
		 from hf_goods_photo
		 where auc_no = 120;
         
         select *
		 from hf_goods_photo
		 where auc_no = 120;

desc hf_goods_photo;


         