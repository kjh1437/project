package com.pilloud.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.pilloud.model.PillVO;
import com.pilloud.model.ShapeVO;
import com.pilloud.service.ShapeService;

@Controller
public class ShapeController {
	private static final Logger logger = LoggerFactory.getLogger(ShapeController.class);

	@Autowired
	private ShapeService shapeService;
	
	// 모양 리스트
    @RequestMapping(value="selectShape", method=RequestMethod.POST)
    @ResponseBody
    public List<String> selectShape() throws Exception{
    	//ModelAndView model = new ModelAndView("jsonView");
    	
        return shapeService.selectShape();
        //model.addObject("result", shape);
        
        //return model;
 
    }
    
    // 제형 리스트
    @RequestMapping(value="selectChartn", method=RequestMethod.POST)
    @ResponseBody
    public List<String> selectChartn() throws Exception{
    	
        return shapeService.selectChartn();
 
    }
    
    // 색상 리스트
    @RequestMapping(value="selectColor", method=RequestMethod.POST)
    @ResponseBody
    public List<String> selectColor() throws Exception{
    	
        return shapeService.selectColor();
 
    }
    
    // 약물 검색리스트
    @ResponseBody
    @RequestMapping(value = "/searchPill", method = RequestMethod.POST, produces = "application/json")
    public List<PillVO> searchPill(@RequestBody PillVO searchVo) throws Exception {
        // 서비스를 호출하여 검색 결과를 가져옴
        List<PillVO> resultList = shapeService.searchPill(searchVo);
        return resultList;
    }
    
}


