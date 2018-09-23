package com.lasbambas.mantto.controller;

import java.io.FileOutputStream;
import java.io.IOException;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;

import javax.persistence.NoResultException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.UnexpectedRollbackException;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.lasbambas.mantto.controller.respons.DataTableResponse;
//import com.lasbambas.mantto.controller.respons.PARAM_REFRESH;
import com.lasbambas.mantto.controller.respons.planConfig;
import com.lasbambas.mantto.controller.respons.planData;
import com.lasbambas.mantto.data.FlotaDao;
import com.lasbambas.mantto.data.HorometroDao;
import com.lasbambas.mantto.data.PlanAdicionalDao;
import com.lasbambas.mantto.data.PlanComponenteDao;
import com.lasbambas.mantto.data.PlanEquipoDao;
import com.lasbambas.mantto.data.PlanManttoDao;
import com.lasbambas.mantto.data.PlanPMDao;
import com.lasbambas.mantto.model.PlanAdicional;
//import com.lasbambas.mantto.model.PlanComponente;
import com.lasbambas.mantto.model.PlanEquipo;
import com.lasbambas.mantto.model.PlanMantto;
import com.lasbambas.mantto.model.PlanPM;
import com.lasbambas.mantto.model.UserMantto;
import com.lasbambas.mantto.utils.FileMeta;

@Controller
@RequestMapping(value = "/planEquipos")
@SessionAttributes("loginUser")
public class PlanEquiposController {	
	@Autowired 
	private FlotaDao flotaDao;
	@Autowired 
	private PlanManttoDao planManttoDao;
	@Autowired 
	private HorometroDao horometroDao;
	@Autowired 
	private PlanPMDao planPMDao;
	@Autowired
	private PlanEquipoDao planEquipoDao; 
	@Autowired
	private PlanComponenteDao planComponenteDao;
	@Autowired
	private PlanAdicionalDao planAdicionalDao;
	
	
	@RequestMapping(method = RequestMethod.GET)
    public String viewBody(@ModelAttribute("loginUser")UserMantto userMantto, Model model) {
		if(userMantto !=null){
			model.addAttribute("loginUser", userMantto);
			model.addAttribute("listFlota", flotaDao.findAllFormat());
			model.addAttribute("listPlan", planManttoDao.findAllByUser(userMantto));
			return "planEquipos";
        }
		else return "redirect:/login";
    }
	@RequestMapping(value = "/getPlan",method = RequestMethod.POST, produces = "application/json; charset=UTF-8")
    public @ResponseBody HashMap<String, Object> getPlanMantto(@ModelAttribute("loginUser")UserMantto userMantto,
    		@RequestParam(value="plan_id") long planMantto_id) {
		HashMap<String, Object> rsta= new HashMap<String, Object>();
        try {
        		PlanMantto planMantto=planManttoDao.findById(planMantto_id);
        		rsta.put("rsta", "ok");
        		rsta.put("planConfig",new planConfig(planMantto,planManttoDao.findMapPlan_idEquipo_id(planMantto_id)));
        		rsta.put("planData", new planData(planManttoDao.findSourceDetalle(planMantto_id), planManttoDao.findSourceDetalleFlota(planMantto_id)));
                return rsta;
            } catch (UnexpectedRollbackException e) {
            	rsta.put("error", e.getCause().getCause());
                return rsta;                
            }        
    }
	@RequestMapping(value = "/save",method = RequestMethod.POST, produces = "application/json; charset=UTF-8")
    public @ResponseBody HashMap<String, Object> registerPlanMantto(@ModelAttribute("loginUser")UserMantto userMantto,
    		@RequestParam(value="fechaIni") @DateTimeFormat(pattern="yyyy-MM-dd") Date fechaIni,
    		@RequestParam(value="fechaFin") @DateTimeFormat(pattern="yyyy-MM-dd") Date fechaFin,
    		@RequestParam(value="nombre") String nombre,
    		@RequestParam(value="nroDias") int nroDias) {
		HashMap<String, Object> rsta= new HashMap<String, Object>();
        try {
        		PlanMantto newPlan=new PlanMantto();
        		newPlan.setFechaCreacion(new Date());
        		newPlan.setFechaHorometro(horometroDao.getCurrentData());
                newPlan.setUserMantto(userMantto);
                newPlan.setFechaIni(fechaIni);
                newPlan.setFechaFin(fechaFin);
                newPlan.setNombre(nombre);
                newPlan.setNroDiasPrediccion(nroDias);
        		planManttoDao.register(newPlan);
        		rsta.put("rsta", "ok");
        		rsta.put("planConfig",new planConfig(newPlan,planManttoDao.findMapPlan_idEquipo_id(newPlan.getId())));
        		rsta.put("planData", new planData(planManttoDao.findSourceDetalle(newPlan.getId()), planManttoDao.findSourceDetalleFlota(newPlan.getId())));
                return rsta;
            } catch (UnexpectedRollbackException e) {
            	rsta.put("error", e.getCause().getCause());
                return rsta;                
            }        
    }
/*	@RequestMapping(value = "/refresh",method = RequestMethod.POST, produces = "application/json; charset=UTF-8")
    public @ResponseBody HashMap<String, Object> refreshPlanMantto(@ModelAttribute("loginUser")UserMantto userMantto,
    		@RequestParam(value="plan_id") long planMantto_id,
    		@RequestParam(value="parametro") PARAM_REFRESH parametro,
    		@RequestParam(value="valor") long valor) {
		HashMap<String, Object> rsta= new HashMap<String, Object>();
        try {
        		rsta.put("rsta", "ok");
        		switch(parametro){
				case EQUIPO:
					rsta.put("planData",new planData(planManttoDao.findSourceDetalleByEquipo(valor), planManttoDao.findSourceDetalleFlotaByEquipo(valor)));
					break;
				case FLOTA:
					rsta.put("planData",new planData(planManttoDao.findSourceDetalleByFlota(planMantto_id,valor), planManttoDao.findSourceDetalleFlotaByFlota(planMantto_id,valor)));
					break;
				case PROCESO:
					rsta.put("planData",new planData(planManttoDao.findSourceDetalleByProceso(planMantto_id,valor), planManttoDao.findSourceDetalleFlotaByProceso(planMantto_id,valor)));
					break;	
        		}
        		return rsta;
            } catch (UnexpectedRollbackException e) {
            	rsta.put("error", e.getCause().getCause());
                return rsta;                
            }        
    }*/
	@RequestMapping(value = "/updatePlanPM",method = RequestMethod.POST, produces = "application/json; charset=UTF-8")
    public @ResponseBody HashMap<String, Object> updatePlanPM(@ModelAttribute("loginUser")UserMantto userMantto,
    		@RequestParam(value="planPM_id") long planPM_id,
    		@RequestParam(value="fechaEst") @DateTimeFormat(pattern="yyyy-MM-dd") Date fechaEst,
    		@RequestParam(value="planAdd_id") long planAdd_id,
    		@RequestParam(value="addRazon") String addRazon,
    		@RequestParam(value="addDur") Double addDur
    		) {
		HashMap<String, Object> rsta= new HashMap<String, Object>();
        try {
        		PlanPM planPM=planPMDao.findById(planPM_id);
        		planPM.setFechaEstimada(fechaEst);
        		planPMDao.merge(planPM);
        		if(planAdd_id==0){
        			if(addDur!=null && addDur>0){
                		PlanAdicional planAdd=new PlanAdicional();
                		planAdd.setPlanEquipo(planPM.getPlanEquipo());
                		planAdd.setFecha(planPM.getFechaEstimada());
                		planAdd.setDuracion(addDur);
                		planAdd.setRazon(addRazon);
                		planAdicionalDao.register(planAdd);
        			}
        		}else{
        			if(addDur!=null && addDur>0){
                		PlanAdicional planAdd=planAdicionalDao.findById(planAdd_id);
                		planAdd.setPlanEquipo(planPM.getPlanEquipo());
                		planAdd.setFecha(planPM.getFechaEstimada());
                		planAdd.setDuracion(addDur);
                		planAdd.setRazon(addRazon);
                		planAdicionalDao.merge(planAdd);
        			}
        			else{
        				planAdicionalDao.removeById(planAdd_id);
        			}
        		}
        		rsta.put("rsta", "ok");
        		rsta.put("planData", new planData(planManttoDao.findSourceDetalleByPlanEquipoId(planPM.getPlanEquipo().getId()),
        										  planManttoDao.findSourceDetalleFlotaByPlanEquipoId(planPM.getPlanEquipo().getId())));
        		return rsta;
            } catch (UnexpectedRollbackException e) {
            	rsta.put("error", e.getCause().getCause());
                return rsta;                
            }        
    }
	@RequestMapping(value = "/registerPlanAdd",method = RequestMethod.POST, produces = "application/json; charset=UTF-8")
    public @ResponseBody HashMap<String, Object> registerPlanAdd(@ModelAttribute("loginUser")UserMantto userMantto,
    		@RequestParam(value="planequipo_id") long planequipo_id ,
    		@RequestParam(value="fecha") @DateTimeFormat(pattern="yyyy-MM-dd") Date fecha,
    		@RequestParam(value="addRazon") String addRazon ,
    		@RequestParam(value="addDur") Double addDur
    		) {
		HashMap<String, Object> rsta= new HashMap<String, Object>();
        try {
        		PlanEquipo planEquipo= planEquipoDao.findById(planequipo_id);
        		PlanAdicional planAdd=new PlanAdicional();
        		planAdd.setPlanEquipo(planEquipo);
        		planAdd.setFecha(fecha);
        		planAdd.setDuracion(addDur);
        		planAdd.setRazon(addRazon);
        		planAdicionalDao.register(planAdd);
        		rsta.put("rsta", "ok");
        		rsta.put("planData", new planData(planManttoDao.findSourceDetalleByPlanEquipoId(planequipo_id),
						  planManttoDao.findSourceDetalleFlotaByPlanEquipoId(planequipo_id)));
        		return rsta;
            } catch (UnexpectedRollbackException e) {
            	rsta.put("error", e.getCause().getCause());
                return rsta;                
            }        
    }
	@RequestMapping(value = "/updatePlanAdd",method = RequestMethod.POST, produces = "application/json; charset=UTF-8")
    public @ResponseBody HashMap<String, Object> updatePlanAdd(@ModelAttribute("loginUser")UserMantto userMantto,
    		@RequestParam(value="planadd_id") long planAdd_id ,
    		@RequestParam(value="addRazon") String addRazon ,
    		@RequestParam(value="addDur") Double addDur
    		) {
		HashMap<String, Object> rsta= new HashMap<String, Object>();
        try {
        		PlanAdicional planAdd=planAdicionalDao.findById(planAdd_id);
        		long planequipo_id= planAdd.getPlanEquipo().getId();
        		if(addDur==null || addDur==0){
        			planAdicionalDao.removeById(planAdd_id);
        		}else{
	        		planAdd.setDuracion(addDur);
	        		planAdd.setRazon(addRazon);
	        		planAdicionalDao.merge(planAdd);
        		}
        		rsta.put("rsta", "ok");
        		rsta.put("planData", new planData(planManttoDao.findSourceDetalleByPlanEquipoId(planequipo_id),
						  planManttoDao.findSourceDetalleFlotaByPlanEquipoId(planequipo_id)));
        		return rsta;
            } catch (UnexpectedRollbackException e) {
            	rsta.put("error", e.getCause().getCause());
                return rsta;                
            }        
    }
	@RequestMapping(value="/planPM={planPM_id}",method = RequestMethod.GET)
    public String viewPlanPM(@ModelAttribute("loginUser")UserMantto userMantto, Model model,@PathVariable("planPM_id") Long planPM_id) {
		if(userMantto !=null){
			PlanPM planPM=planPMDao.findById(planPM_id);
			PlanAdicional adicional=null;
			try{
				adicional=planAdicionalDao.findByPlanEquipoAndDate(planPM.getPlanEquipo(),planPM.getFechaEstimada());
			}
			catch(NoResultException e){}
			model.addAttribute("loginUser", userMantto);
			model.addAttribute("planPM",planPM );
			model.addAttribute("planAdd",adicional);
			return "popoverPlanPM";
        }
		else return "redirect:/login";
    }
	/*@RequestMapping(value="/planComp={planComponete_ids}",method = RequestMethod.GET)
    public String viewPlanComp(@ModelAttribute("loginUser")UserMantto userMantto, Model model,@PathVariable("planEquipo_id") Long planComponete_ids) {
		if(userMantto !=null){
			//PlanComponente[] planComponente=planComponenteDao.findByIds(planComponete_ids);
			PlanPM planPM=null;
			try{
				planPM=planPMDao.findByPlanEquipoAndDate(planPM.getPlanEquipo(),planPM.getFechaEstimada());
			}
			catch(NoResultException e){}
			model.addAttribute("loginUser", userMantto);
			model.addAttribute("planPM",planPM );
			//model.addAttribute("planAdd",adicional);
			return "popoverPlanPM";
        }
		else return "redirect:/login";
    }*/
	@RequestMapping(value="/planAdd={planAdd_id}",method = RequestMethod.GET)
    public String viewPlanAdd(@ModelAttribute("loginUser")UserMantto userMantto, Model model,@PathVariable("planAdd_id") Long planAdd_id) {
		if(userMantto !=null){
			PlanAdicional planAdd=planAdicionalDao.findById(planAdd_id);
			model.addAttribute("loginUser", userMantto);
			model.addAttribute("planAdd",planAdd);
			return "popoverPlanAdd";
        }
		else return "redirect:/login";
    }
	@RequestMapping(value="/thorometros",method = RequestMethod.GET,produces = "application/json; charset=UTF-8")
    public @ResponseBody DataTableResponse viewHorometro(@ModelAttribute("loginUser")UserMantto userMantto, HttpServletRequest  request) {
		if(userMantto !=null){
			long nh= horometroDao.getSizeRecords();
			DataTableResponse dtr=new DataTableResponse(Integer.parseInt(request.getParameter("draw")),
					nh, nh,
					horometroDao.getPageData(
							Integer.parseInt(request.getParameter("start")),
							Integer.parseInt(request.getParameter("length")),
							"Fecha",
							1)
							);
			return dtr;
        }
		else return null;
    }
	@RequestMapping(value = "/loadHorometro",method = RequestMethod.POST, produces = "application/json; charset=UTF-8")
    public @ResponseBody HashMap<String, Object> loadHorometroFile(@ModelAttribute("loginUser")UserMantto userMantto,
    		MultipartHttpServletRequest request, HttpServletResponse response
    		) {
		 FileMeta fileMeta = null;
		HashMap<String, Object> rsta= new HashMap<String, Object>();
        try {
        	//1. build an iterator
            Iterator<String> itr =  request.getFileNames();
            MultipartFile mpf = null;
    
            //2. get each file
            while(itr.hasNext()){
    
                //2.1 get next MultipartFile
                mpf = request.getFile(itr.next()); 
                //System.out.println(mpf.getOriginalFilename() +" uploaded! "+files.size());               
    
                //2.3 create new fileMeta
                fileMeta = new FileMeta();
                fileMeta.setFileName(mpf.getOriginalFilename());
                fileMeta.setFileSize(mpf.getSize()/1024+" Kb");
                fileMeta.setFileType(mpf.getContentType());
    
                try {
                   fileMeta.setBytes(mpf.getBytes());
    
                    // copy file to local disk (make sure the path "e.g.)            
                    FileCopyUtils.copy(mpf.getBytes(), new FileOutputStream("/temp/"+mpf.getOriginalFilename()));
    
               } catch (IOException e) {
                   // TODO Auto-generated catch block
                   e.printStackTrace();
               }
                //2.4 add to files
               // files.add(fileMeta);
            }
           // result will be like this
           // [{"fileName":"app_engine-85x77.png","fileSize":"8 Kb","fileType":"image/png"},...]
           //return files;
        		rsta.put("rsta", "ok");
        		rsta.put("file", fileMeta);
        		return rsta;
            } catch (UnexpectedRollbackException e) {
            	rsta.put("error", e.getCause().getCause());
                return rsta;                
            }        
    }
}
