package kr.kh.onairauction.vo;

import java.util.Date;
import org.springframework.format.annotation.DateTimeFormat;
import lombok.Data;

@Data
public class ProductVO {
	int pr_code;
	String pr_name;
	String pr_intro;
	String pr_condition;
	String pr_detail;
	String pr_location;
	String pr_refundreason;
	int pr_startprice;
	String pr_origin;
	String pr_size;
	int pr_pc_num;
	int pr_st_num;
}
	
	
