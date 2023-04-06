package kr.kh.onairauction.vo;

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
}
