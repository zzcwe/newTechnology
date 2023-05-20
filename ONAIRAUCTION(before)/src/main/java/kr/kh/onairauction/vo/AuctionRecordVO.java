package kr.kh.onairauction.vo;

import java.text.SimpleDateFormat;
import java.util.Date;
import org.springframework.format.annotation.DateTimeFormat;
import lombok.Data;

@Data
public class AuctionRecordVO {
	int ar_num;
	Date ar_bidtime;
	double ar_bidprice;
	String ar_me_id;
	int ar_ac_num;
	 
public String getAr_bidtime() {
	SimpleDateFormat bidtime = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	return bidtime.format(ar_bidtime);
 	}
public double getAr_nextBidprice() {
	double unit = 0;
	if( ar_bidprice < 20){
		unit = 1;
	}
	if(20 <= ar_bidprice && ar_bidprice < 50) {
		unit = 4;
	}
	if(50 <= ar_bidprice && ar_bidprice < 200) {
		unit = 7;
	}
	if(200 <= ar_bidprice && ar_bidprice < 400) {
		unit = 15;
	}
	if(400 <= ar_bidprice && ar_bidprice < 800) {
		unit = 35;
	}
	if(800 <= ar_bidprice) {
		unit = 70;
	}
	double nextBidPrice = ar_bidprice + unit;
	
	return nextBidPrice;
}
public double getAr_nextBidprice(double price) {
	double unit = 0;
	if( price < 20){
		unit = 1;
	}
	if(20 <= price && price < 50) {
		unit = 4;
	}
	if(50 <= price && price < 200) {
		unit = 7;
	}
	if(200 <= price && price < 400) {
		unit = 15;
	}
	if(400 <= price && price < 800) {
		unit = 35;
	}
	if(800 <= price) {
		unit = 70;
	}
	double nextBidPrice = price + unit;
	
	return nextBidPrice;
}

}
	
	
