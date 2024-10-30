package com.pilloud.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		return "home";
	}
	
	@RequestMapping(value = "/addmedicine", method = RequestMethod.GET)
	public String addmedicine() {
		return "addmedicine";
	}
	@RequestMapping(value = "/pillSear", method = RequestMethod.GET)
	public String pillSear() {
		return "pillSear";
	}
	
	@RequestMapping(value = "/shapeSear", method = RequestMethod.GET)
	public String shapeSear() {
		return "shapeSear";
	}
	
	@RequestMapping(value = "/alarm", method = RequestMethod.GET)
	public String alarm() {
		return "alarm";
	}
	
	@RequestMapping(value = "/quickinfo", method = RequestMethod.GET)
	public String quickinfo() {
		return "quickinfo";
	}
	@RequestMapping(value = "/emlsignup", method = RequestMethod.GET)
	public String emlsignup() {
		return "emlsignup";
	}
	
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String list() {
		return "list";
	}
	
	@RequestMapping(value = "/detailPage", method = RequestMethod.GET)
	public String detailPage() {
		return "detailPage";
	}
	
	@RequestMapping(value = "/bookmark", method = RequestMethod.GET)
	public String bookmark() {
		return "bookmark";
	}
	
	@RequestMapping(value = "/caution", method = RequestMethod.GET)
	public String caution() {
		return "caution";
	}
	@RequestMapping(value = "/mypage", method = RequestMethod.GET)
	public String mypage() {
		return "mypage";
	}
	@RequestMapping(value = "/map", method = RequestMethod.GET)
	public String map() {
		return "map";
	}
	@RequestMapping(value = "/calendar", method = RequestMethod.GET)
	public String calendar() {
		return "calendar";
	}
	
	@RequestMapping(value = "/calendar2", method = RequestMethod.GET)
	public String calendar2() {
		return "calendar2";
	}
	
	@RequestMapping(value = "/selectpill", method = RequestMethod.GET)
	public String selectpill() {
		return "selectpill";
	}
	@RequestMapping(value = "/test", method = RequestMethod.GET)
	public String test() {
		return "test";
	}
}
