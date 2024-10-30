package com.pilloud.model;

import lombok.Data;

@Data
public class ShapeVO {

	// 약품번호
	private String itemSeq;
	
	// 약품명
	private String itemName;
	
	// 약품모양
	private String drugShape;
	
	//모양
	private String shape;
	
	//제형
	private String chartn;
	
	//색상1
	private String colorClass1;
	
	//색상2
	private String colorClass2;
		
	//색상1 + 색상2
	private String color;
	
	//분할선 앞
	private String lineFront;
	
	//분할선 뒤
	private String lineBack;
	
	//분할선 앞 + 분할선 뒤
	private String line;
		
	//프린트 앞
	private String printFront;
	
	//프린트 뒤
	private String printBack;
	
	//프린트 앞 + 프린트 뒤
	private String print;
}
