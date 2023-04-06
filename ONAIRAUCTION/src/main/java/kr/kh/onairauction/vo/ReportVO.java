package kr.kh.onairauction.vo;

import java.sql.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class ReportVO {
	int re_num;
	String re_title;
	String re_content;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	Date re_date;
	String re_result;
	String re_me_id;
	String re_rc_name;
	String re_report_id;
	int re_pr_code;
}
