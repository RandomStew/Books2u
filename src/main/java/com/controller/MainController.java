package com.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.event.EventListener;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.GetMapping;

import com.dto.curation.CurationDTO;
import com.service.curation.CurationService;

@Controller
public class MainController {
	@Autowired
	CurationService service;
	
	@GetMapping("/")
	public String start() {
		return "redirect:main";
	}
	
	@GetMapping("/main")
	public String main(Model m) throws Exception {
		List<CurationDTO> novelList = service.selectList("소설");
		List<CurationDTO> artList = service.selectList("예술대중문화");
		List<CurationDTO> cookList = service.selectList("요리");
		m.addAttribute("novelList", new ArrayList(novelList.subList(0, getCurationMaxSize(novelList))));
		m.addAttribute("artList", new ArrayList(artList.subList(0, getCurationMaxSize(artList))));
		m.addAttribute("cookList", new ArrayList(cookList.subList(0, getCurationMaxSize(cookList))));
		return "main";
	}
	
	@ExceptionHandler({Exception.class})
	public String error() {
		return "error/error";
	}
	
	private int getCurationMaxSize(List<CurationDTO> list) {
		return Integer.min(list.size(), 5);
	}
}
