package kr.kh.onairauction.vo;

import java.text.SimpleDateFormat;
import java.util.Date;
import org.springframework.format.annotation.DateTimeFormat;
import lombok.Data;

@Data
public class AuctionVO {
	int ac_num;
	int ac_calculation;
	Date ac_bidtime;
	Date ac_startdate;
	Date ac_finaldate;
	int ac_extension;
	int ac_faild;
	int ac_immediate;
	String ac_limitlevel;
	String ac_state;
	String ac_deliveryway;
	int ac_pr_code;
	String ac_me_id;
	String ac_ac_name;
public String getAc_startdate() {
	SimpleDateFormat date = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	return date.format(ac_startdate);
 	}
public String getAc_finaldate() {
	SimpleDateFormat date = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	return date.format(ac_finaldate);
 	}
}
	
	
