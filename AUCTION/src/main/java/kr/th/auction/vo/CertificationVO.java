package kr.th.auction.vo;

import java.text.SimpleDateFormat;
import java.util.Date;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class CertificationVO {
	String ce_me_id;
	String ce_certification_number;
	Date ce_time;

public CertificationVO(String ce_me_id, String ce_certification_number) {
	this.ce_me_id = ce_me_id;
	this.ce_certification_number = ce_certification_number;
	this.ce_time = new Date();
}	
public String getCe_time() {
	SimpleDateFormat date = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	return date.format(ce_time);
 	}
}
	
	
