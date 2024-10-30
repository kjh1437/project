package com.pilloud.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.json.simple.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.pilloud.model.PillVO;
import com.pilloud.model.UserVO;
import com.pilloud.service.CommonService;
import com.pilloud.service.PillService;
import com.pilloud.service.ShapeService;
import com.pilloud.service.UserService;

@Controller
public class PillController {
	private static final Logger logger = LoggerFactory.getLogger(PillController.class);
	String pillAPIKey = "RlP5Qs6W7JzE4R72UmPN5dqZ5zMcFWMluYCsSwarFUzSHvlUdP3ZRc8t72i4LF9oM2SbnfiD%2FF4YOVKFJvVQqw%3D%3D";


	@Autowired
	private PillService pillService;
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private CommonService commonService;
	
	
	// 의약품 검색리스트
    @ResponseBody
    @RequestMapping(value = "/searchPillNm", method = RequestMethod.POST, produces = "application/json")
    public List<PillVO> searchPillNm(@RequestBody PillVO searchVo) throws Exception {
        // 서비스를 호출하여 검색 결과를 가져옴
    	UserVO vo=new UserVO();	
        List<PillVO> resultList = pillService.searchPillNm(searchVo);
        
        
        return resultList;
    }
    
    // 의약품 검색리스트(키워드로 검색)
    @ResponseBody
    @RequestMapping(value = "/searchKeyword", method = RequestMethod.POST, produces = "application/json")
    public List<PillVO> searchKeyword(@RequestBody PillVO searchVo) throws Exception {
        // 서비스를 호출하여 검색 결과를 가져옴
        List<PillVO> resultList = pillService.searchKeyword(searchVo);
        
        
        return resultList;
    }
	/*
	 * @PostMapping("/addPillData") public ResponseEntity<String>
	 * addPillData(@RequestBody PillDataDto pillData) { // 데이터베이스에 저장하는 로직 구현
	 * pillMstService.savePillData(pillData);
	 * 
	 * return ResponseEntity.ok("복용 데이터 저장 완료"); }
	 */

}