package com.lasbambas.mantto.controller;


//import javax.persistence.NoResultException;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.lasbambas.mantto.data.UserManttoDao;
import com.lasbambas.mantto.model.UserMantto;

@Controller
@RequestMapping(value = "/system")
@SessionAttributes("loginUser")
public class SystemController {
	@Autowired
	private UserManttoDao userManttoDao;
	
	@RequestMapping(method = RequestMethod.GET)
    public String displayWelcome(@ModelAttribute("loginUser")UserMantto userMantto,
    		//@ModelAttribute("apps")List<String> apps,					
    		Model model) {
		try{
			if(userMantto !=null){
				if(userMantto.getId()==null) return "redirect:/login";
				model.addAttribute("loginUser", userMantto);
        		model.addAttribute("apps",userManttoDao.getApplications(userMantto));
				return "system";
	        }
			else return "redirect:/login";
		}
		catch (Exception e){
			System.out.println(e);
			return "redirect:/login";
		}
		
    }
	
	@RequestMapping(value = "/{appName}",method = RequestMethod.GET)
	public String viewHome(@PathVariable("appName") String appName,@ModelAttribute("loginUser")UserMantto userMantto, Model model)
	{
		if(userMantto !=null){
			return "redirect:/"+appName;
        }
		else
	   return "redirect:/login";
	}

}
