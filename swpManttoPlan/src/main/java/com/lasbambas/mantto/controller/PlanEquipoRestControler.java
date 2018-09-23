package com.lasbambas.mantto.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.lasbambas.mantto.data.FlotaDao;
import com.lasbambas.mantto.model.Flota;
import com.lasbambas.mantto.model.UserMantto;
@Controller
@RequestMapping("/rest/planEquipo")
//@SessionAttributes("loginUser")
public class PlanEquipoRestControler {
	@Autowired
    private FlotaDao flotaDao;
	
//	@RequestMapping(value = "/flotas",method = RequestMethod.GET, produces = "application/json; charset=UTF-8")
//	public @ResponseBody List<Flota> listFlotas(@ModelAttribute("loginUser")UserMantto userMantto)
//	{
//		//if(userMantto !=null){
//			return flotaDao.findAllOrderedByFlota();
//		/*}
//		else
//			return null;*/
//	}
	@RequestMapping(value = "/flota",method = RequestMethod.GET, produces = "application/json; charset=UTF-8")
	public @ResponseBody List listFormatFlotas(@ModelAttribute("loginUser")UserMantto userMantto)
	{
		//if(userMantto !=null){
			return flotaDao.findAllFormat();
		/*}
		else
			return null;*/
	}
}
