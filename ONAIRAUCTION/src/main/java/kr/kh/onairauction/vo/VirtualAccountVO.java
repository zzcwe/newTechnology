package kr.kh.onairauction.vo;

import java.text.SimpleDateFormat;
import java.util.Date;

import lombok.Data;

@Data
public class VirtualAccountVO {
	String va_me_id;
	double va_holdingamount;
	Date va_chargedate;
	Date va_withdrawdate;
	String va_pw;
	int va_ch_num;
	
public String getVa_chargedate() {
SimpleDateFormat date = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
return date.format(va_chargedate);
}
public String getVa_withdrawdate() {
SimpleDateFormat date = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
return date.format(va_withdrawdate);
}
}
