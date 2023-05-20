package kr.kh.onairauction.vo;

import java.text.SimpleDateFormat;
import java.util.Date;
import org.springframework.format.annotation.DateTimeFormat;
import lombok.Data;

@Data
public class ChattingRecordVO {
	int cr_num;
	String  content;
	Date cr_time;
	String cr_me_id;
	int cr_ch_num;
	
public String getCr_time() {//웹페이지에 나타낼 때, 날짜형식을 지정해주기 위해서
		SimpleDateFormat sendtime = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		return sendtime.format(cr_time);
	 	}
}
	
	
