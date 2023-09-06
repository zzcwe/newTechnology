package kr.th.auction.vo;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.time.format.DateTimeParseException;
import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class AuctionVO {
	int au_num;
	int au_calculation;
	int au_limit_bid_time;
	public LocalDateTime au_start_date;
	public LocalDateTime au_final_date;
	int au_extension;
	int au_faild;
	int au_immediate;
	int au_limit_level;
	String au_delivery_way;
	int au_pr_code;
	String au_me_id;
	int au_ac_num;
	int ac_num;
	String ac_name;
	String pr_name;
	String pr_intro;
	String pr_location;
	int pr_code;
	
public String getAu_start_date() {
		DateTimeFormatter formatter1 = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
		if(au_start_date == null) {
			return null;
		}
	return formatter1.format(au_start_date);
}

public void setAu_start_date(String au_start_date) throws ParseException {
    DateTimeFormatter formatter1 = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
    DateTimeFormatter formatter2 = DateTimeFormatter.ofPattern("yyyy-MM-dd'T'HH:mm");

    try {
        this.au_start_date = LocalDateTime.parse(au_start_date, formatter1);
    } catch (DateTimeParseException e1) {
        try {
            this.au_start_date = LocalDateTime.parse(au_start_date, formatter2);
        } catch (DateTimeParseException e2) {
            throw new ParseException("Unparseable date: " + au_start_date, 0);
        }
    }
}

public String getAu_final_date() {
		DateTimeFormatter formatter1 = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
		if(au_final_date == null) {
			return null;
		}
	return formatter1.format(au_final_date);
}

//html input태그의 타입 datetime-local의 형식과 DB에서 date형식을 바인딩해주는 코드(예외처리)
public void setAu_final_date(String au_final_date) throws ParseException {
    DateTimeFormatter formatter1 = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
    DateTimeFormatter formatter2 = DateTimeFormatter.ofPattern("yyyy-MM-dd'T'HH:mm");
    
    if (au_final_date == null || au_final_date.isEmpty()) {
        this.au_final_date = null;
    } 
    else {
    	try {
            this.au_final_date = LocalDateTime.parse(au_final_date, formatter1);
        } catch (DateTimeParseException e1) {
            try {
                this.au_final_date = LocalDateTime.parse(au_final_date, formatter2);
            } catch (DateTimeParseException e2) {
                throw new ParseException("Unparseable date: " + au_final_date, 0);
            }
        }
    }
}


public void setAu_immediate(String au_immediate) throws ParseException {
	 if (au_immediate == null || au_immediate.isEmpty()) {
	        this.au_immediate = 0;
	    } else {
	        this.au_immediate = Integer.parseInt(au_immediate);
	    }
}

public String getAu_delivery_date() {
	SimpleDateFormat date = new SimpleDateFormat("yyyy-MM-dd" + "일 부터 3일이내");
	return date.format(au_final_date);
	}
	
}
	
	
