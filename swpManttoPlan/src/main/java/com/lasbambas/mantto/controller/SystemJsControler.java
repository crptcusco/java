package com.lasbambas.mantto.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.lasbambas.mantto.model.UserMantto;


@Controller
@RequestMapping("/js")
@SessionAttributes("loginUser")
public class SystemJsControler {	
	@RequestMapping(value = "/{appName}",method = RequestMethod.GET, produces = "text/javascript")
	public String viewHome(@PathVariable("appName") String appName, @ModelAttribute("loginUser")UserMantto userMantto)
	{
		if(userMantto !=null){
			return "js/js_"+appName;
		}
		else
			return "...:-P...";
	}
}
