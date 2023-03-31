package kr.kh.onairauction.vo;

import java.util.Date;
import org.springframework.format.annotation.DateTimeFormat;
import lombok.Data;

@Data
public class MemberVO {
	String me_id;
	String me_pw;
	String me_email;
	String me_board;
	String me_phone;
	String me_name;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	Date me_birthday;
	int me_certification;
	int me_authority;
	String me_account;
	String me_region;
	Date me_join_time;
	String me_ml_name;
}
	
	
