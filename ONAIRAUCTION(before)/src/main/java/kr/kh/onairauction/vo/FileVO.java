package kr.kh.onairauction.vo;

import java.util.Date;
import org.springframework.format.annotation.DateTimeFormat;
import lombok.Data;

@Data
public class FileVO {
	int fi_num;
	String fi_name;
	String fi_savename;
	String fi_tablename;
	int tablenum;
}
	
	
