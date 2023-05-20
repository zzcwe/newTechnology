package kr.kh.onairauction.vo;

import java.util.Date;
import org.springframework.format.annotation.DateTimeFormat;
import lombok.Data;

@Data
public class EstimateVO {
	int es_num;
	int es_price;
	int es_exchange;
	int es_ar_num;
}
	
	
