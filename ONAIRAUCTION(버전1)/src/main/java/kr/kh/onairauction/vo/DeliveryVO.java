package kr.kh.onairauction.vo;

import java.text.SimpleDateFormat;
import java.util.Date;
import org.springframework.format.annotation.DateTimeFormat;
import lombok.Data;

@Data
public class DeliveryVO {
	int de_num;
	String de_state;
	Date de_startdate;
	Date de_completedate;
	int de_or_num;
	int de_bl_num;
	
public String getDe_startdate() {
		SimpleDateFormat date = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		return date.format(de_startdate);
	 	}
public String getDe_completedate() {
	SimpleDateFormat date = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	return date.format(de_completedate);
 	}
}
	
	
