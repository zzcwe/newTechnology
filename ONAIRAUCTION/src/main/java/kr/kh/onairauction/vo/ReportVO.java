package kr.kh.onairauction.vo;

import java.sql.Date;
import java.text.SimpleDateFormat;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class ReportVO {
	int re_num;
	String re_title;
	String re_content;
	Date re_date;
	String re_result;
	String re_me_id;
	int re_rc_num;
	String re_report_id;
	int re_pr_code;
	
public String getRe_date() {
		SimpleDateFormat date = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		return date.format(re_date);
	 	}
}
