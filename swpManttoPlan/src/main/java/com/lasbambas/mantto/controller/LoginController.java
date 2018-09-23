package com.lasbambas.mantto.controller;



import javax.persistence.NoResultException;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.UnexpectedRollbackException;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.lasbambas.mantto.data.UserManttoDao;
import com.lasbambas.mantto.model.UserMantto;

@Controller
@RequestMapping(value = "/login")
@SessionAttributes("loginUser")
public class LoginController {
	@Autowired
	private UserManttoDao userManttoDao;
	
    @RequestMapping(method = RequestMethod.GET)
    public String displaySortedMembers(Model model) {
        model.addAttribute("loginUser", new UserMantto());
        return "login";
    }
	
	@RequestMapping(method = RequestMethod.POST)	
    public String loginUserMantto(HttpServletRequest request,@ModelAttribute("loginUser") UserMantto userMantto, BindingResult result, Model model) {
        //if (!result.hasErrors()) {
            try {
            	UserMantto userLogin=userManttoDao.findByUserPass(userMantto.getUserName(), userMantto.getPass());
            	if(userLogin!=null){
            		//request.getSession().setAttribute("userLogin", String.valueOf(userLogin.getId()));
            		model.addAttribute("loginUser", userLogin);
            		return "redirect:/system";
            	}
            	else
            		return "login";
            } catch (UnexpectedRollbackException e) {
                model.addAttribute("error", e.getCause().getCause());
                System.out.println(e);
                return "login";
            }catch (NoResultException e) {
            	 System.out.println(e);
            return "login";
            	
			}
      /*  } else {
           // model.addAttribute("members", memberDao.findAllOrderedByName());
            return "login";
        }*/
    }
}
