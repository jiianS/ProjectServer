package com.java.jian.controller;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.java.jian.dao.DaoInterface;
import com.java.jian.util.FinalUtil;
import com.java.jian.util.HttpUtil;


@Controller
public class UserController {

	@RequestMapping("/admin")
	public String	admin() {
		return "admin/login";
	}
	@RequestMapping("/join")
	public String	join() {
		return "admin/join";
	}
	@RequestMapping("/logout")
	public String	logout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}
	
	@Autowired
	DaoInterface di;
	
	@RequestMapping("/userInsert")
	public String	userInsert(HttpServletRequest req) {
		HashMap<String, Object> param =  HttpUtil.getParamMap(req);
		
		System.out.println("test  __  " +  param);
		param.put("sqlType", "user.userInsert");
		param.put("sql", "insert");
		
		int status = (int) di.call(param);
		
		return "redirect:/";
	}
	
	@RequestMapping("/adList")
	public String	adList() {
		return "admin/adList";
	}
	
	//로그인 후 
	@RequestMapping("/userSelect")
	public String	userSelect(HttpServletRequest req, RedirectAttributes attr, HttpSession session) {
		HashMap<String, Object> param =  HttpUtil.getParamMap(req);
		
		param.put("sqlType", "user.userSelect");
		param.put("sql", "selectOne");
		
		HashMap<String, Object> resultMap = (HashMap<String, Object>) di.call(param);
		
		if(resultMap == null) {
			resultMap = new HashMap<String, Object>();
			resultMap.put("status",FinalUtil.NO);
		}else {
			resultMap.put("status", FinalUtil.OK);		
		}
		
		session.setAttribute("user", resultMap);
		
//		attr.addFlashAttribute("data", resultMap);
		
		return "redirect:/";
	}
	
}
