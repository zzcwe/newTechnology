package kr.kh.onairauction.vo;

import java.text.SimpleDateFormat;
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
	Date me_birthday;
	int me_certification;
	int me_authority;
	String me_account;
	String me_region;
	Date me_join_time;
	String me_ml_name;
public String getMe_birthday() {
	SimpleDateFormat date = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	return date.format(me_birthday);
 	}
public String getMe_join_time() {
	SimpleDateFormat date = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	return date.format(me_join_time);
 	}
}
	
	
