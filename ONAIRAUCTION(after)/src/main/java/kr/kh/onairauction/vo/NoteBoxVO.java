package kr.kh.onairauction.vo;

import java.text.SimpleDateFormat;
import java.util.Date;

import lombok.Data;

@Data
public class NoteBoxVO {
	int nb_num;
	Date nb_sendtime;
	Date nb_readtime;
	String nb_sendid;
	String nb_receiveid;
	String nb_title;
	String nb_content;
	
	public String getNb_sendtime() {
		SimpleDateFormat sendtime = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		return sendtime.format(nb_sendtime);
	 	}
	public String getNb_readtime() {
		SimpleDateFormat readtime = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		return readtime.format(nb_readtime);
	 	}
}
