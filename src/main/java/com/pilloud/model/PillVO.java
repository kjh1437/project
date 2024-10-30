package com.pilloud.model;

import javax.persistence.Entity;

import lombok.Data;


@Data
@Entity
public class PillVO {
	//품목일련번호
	private String item_seq;
	
	//품목명
	private String item_name;
	private String itemNm;
	
	//업체일련번호
	private String entp_seq;
	
	//업체명
	private String entp_name;
	
	//성상
	private String chartn;
	
	//큰제품이미지
	private String item_image;
	
	//표시(앞)
	private String print_front;
	
	//표시(뒤)
	private String print_back;
	
	//의약품모양
	private String drug_shape;
	
	//색깔(앞)
	private String color_class1;
	
	//색깔(뒤)
	private String color_class2;
	
	//분할선(앞)
	private String line_front;
	 
	//분할선(뒤)
	private String line_back;
	
	//크기(장축)
	private String leng_long;
	
	//크기(단축)
	private String leng_short;
	
	//크기(두께)
	private String thick;
	
	//약학정보원 이미지 생성일
	private String img_regist_ts;
	
	//분류번호
	private String class_no;
	
	//전문/일반
	private String etc_otc_code;
	
	//품목허가일자
	private String item_permit_date;
	
	//모양코드
	private String shape_code;
	
	//마크내용(앞)
	private String mark_code_front_anal;
	
	//마크내용(뒤)
	private String mark_code_back_anal;
	
	//마크이미지(앞)
	private String mark_code_front_img;
	
	//마크이미지(뒤)
	private String mark_code_back_img;
	
	//제품영문명
	private String item_eng_name;
	
	//보험코드
	private String edi_code;
	
	//모양
	private String shape;
	
	//색상1 + 색상2
	private String color;
	
	//분할선 앞 + 분할선 뒤
	private String line;
	
	//프린트 앞 + 프린트 뒤
	private String print;
	
	//id(북마크때문에 추가해줌)
	private String id;
	
	private String warnYn;
	
	//복용 요일
	private String take_day;
	
	//복용 시작 일자
	private String take_begin;
	
	//복용 종료 일자
	private String take_end;
	
	//복용 시간
	private String take_time;
	
	//복용 주기 
	private String take_frequency;

	//키워트
	private String keyword;
}
