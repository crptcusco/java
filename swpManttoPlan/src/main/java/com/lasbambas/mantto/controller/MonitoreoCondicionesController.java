package com.lasbambas.mantto.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.lasbambas.mantto.data.FlotaDao;
import com.lasbambas.mantto.model.UserMantto;

@Controller
@RequestMapping(value = "/monitoreoCondiciones")
@SessionAttributes("loginUser")
public class MonitoreoCondicionesController {
	@Autowired 
	private FlotaDao flotaDao;
	
	@RequestMapping(method = RequestMethod.GET)
    public String viewBody(@ModelAttribute("loginUser")UserMantto userMantto, Model model) {
		if(userMantto !=null){
			model.addAttribute("loginUser", userMantto);
			model.addAttribute("listFlota", flotaDao.findAllFormat());
			return "monitoreoCondiciones";
        }
		else return "redirect:/login";
    }
}
