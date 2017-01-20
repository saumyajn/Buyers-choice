package com.buyerschoice.controller;

import java.util.List;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;

import javax.servlet.http.HttpServletRequest;
import javax.transaction.HeuristicMixedException;
import javax.transaction.HeuristicRollbackException;
import javax.transaction.RollbackException;
import javax.transaction.SystemException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.*;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.buyerschoice.dao.DestinationDao;
import com.buyerschoice.dao.PackageDao;
import com.buyerschoice.dao.SupplierDao;
import com.buyerschoice.model.Destination;
import com.buyerschoice.model.Package;
import com.buyerschoice.model.Supplier;
import com.google.gson.Gson;

@Controller
public class DestinationController {

	@Autowired
	DestinationDao cdao;

	@Autowired
	PackageDao cdao1;

	@Autowired
	SupplierDao cdao2;

	public DestinationController() 
	{
		

	}

	@RequestMapping(value = "/diffdest", method = RequestMethod.GET)
	public ModelAndView showDest() {
		ModelAndView mvc = new ModelAndView("destinationView", "dest", new Destination());
		String destinations = cdao.Retrive();
		String packages = cdao1.Retrive();
		String suppliers = cdao2.Retrive();
		System.out.println();
		mvc.addObject("packlist", packages);
		mvc.addObject("supplist", suppliers);
		mvc.addObject("destlist", destinations);
		return mvc;
	}

	@RequestMapping(value ="/userdest",method=RequestMethod.GET)
	public ModelAndView showUserDest() 
	{	
		
		ModelAndView mvc=new ModelAndView("userDest","dest",new Destination());
		String dests=cdao.Retrive();
		mvc.addObject("destlist",dests);
		return mvc;
	}
	@RequestMapping(value ="/viewdest",method=RequestMethod.GET)
	public ModelAndView showDestdetails(@RequestParam("pid")int cid) 
	{	
		System.out.println(cid);
		Destination ok=cdao.DisplayImage(cid);
		Gson gsonlist=new Gson();
		String  rec=gsonlist.toJson(ok);
		ModelAndView mvc=new ModelAndView("displayDest","dest",new Destination());
	
		mvc.addObject("destlist",rec);
		return mvc;
	}
	@RequestMapping(value = "/insertdest", method = RequestMethod.POST)
	public ModelAndView addDest(@ModelAttribute("dest") Destination dest, BindingResult result) {
		ModelAndView m1 = new ModelAndView("destinationView", "dest", new Destination());
		cdao.insert(dest);
		System.out.println("This is ID:"+dest.getDestid());
		System.out.println("This is price: "+dest.getPrice());
		
		String path = "C:\\diginxt\\BuyersChoice\\src\\main\\webapp\\resources\\images\\";
		path = path + String.valueOf(dest.getDestid()) + ".jpg";
		File f = new File(path);

		MultipartFile filedet = dest.getPimage();

		if (!filedet.isEmpty()) {
			try {
				byte[] bytes = filedet.getBytes();
				System.out.println(bytes.length);
				FileOutputStream fos = new FileOutputStream(f);
				BufferedOutputStream bs = new BufferedOutputStream(fos);
				bs.write(bytes);
				bs.close();
				fos.close();
				System.out.println("File Uploaded Successfully");
			} catch (Exception e) {
				System.out.println("Exception Arised" + e);
			}
		} else {
			System.out.println("File is Empty not Uploaded");

		}
		boolean data = false;
		String packages = cdao1.Retrive();
		String suppliers = cdao2.Retrive();
		String destinations = cdao.Retrive();
		System.out.println(destinations);
		m1.addObject("packlist", packages);
		m1.addObject("supplist", suppliers);
		m1.addObject("destlist", destinations);
		m1.addObject("checkk",data);
		return m1;
		
	}
	


	@RequestMapping(value="/Deletedest", method=RequestMethod.GET)
	public ModelAndView Deletedest(@RequestParam("pid")int cid)
	{
	
		cdao.Delete(cid);
		ModelAndView mvc=new ModelAndView("destinationView","dest",new Destination());
		String destinations=cdao.Retrive();
		String packages = cdao1.Retrive();
		String suppliers = cdao2.Retrive();
		mvc.addObject("packlist", packages);
		mvc.addObject("supplist", suppliers);
		mvc.addObject("destlist",destinations);
		return mvc;
	}
	
	@RequestMapping(value="/plzUpdateddest", method=RequestMethod.GET)
	public ModelAndView plzUpdateddest(@RequestParam("pid")int cid)
	{
		Destination doc=cdao.Updatedest(cid);
		 boolean data=true;
		ModelAndView mvc=new ModelAndView("destinationView","dest",doc);
		String packages = cdao1.Retrive();
		String suppliers = cdao2.Retrive();
		String destinations=cdao.Retrive();
		mvc.addObject("destlist",destinations);
		mvc.addObject("packlist", packages);
		mvc.addObject("supplist", suppliers);
		mvc.addObject("checkk",data);
	   return mvc;
	}
	
	@RequestMapping(value="/plzNowUpdateddest", method=RequestMethod.POST)
	public ModelAndView plzNowUpdateddest(HttpServletRequest request)
	{
		 String cid=request.getParameter("destid");                                                 
		String cname=request.getParameter("destname");
		String cdesc=request.getParameter("destdesc");
		 String cprice=request.getParameter("price");     
		 String cstock=request.getParameter("stock");     
        String cpackname=request.getParameter("packagename");
		String csuppname=request.getParameter("suppliername");
		boolean data=false;
		int cid1=Integer.parseInt(cid);
		int cprice1=Integer.parseInt(cprice);
		int cstock1=Integer.parseInt(cstock);
		cdao.NowUpdatedest(cid1,cname,cdesc,cprice1,cstock1,cpackname,csuppname);
		ModelAndView mvc=new ModelAndView("destinationView","dest",new Destination());
		String destinations=cdao.Retrive();
		String packages = cdao1.Retrive();
		String suppliers = cdao2.Retrive();
		mvc.addObject("destlist",destinations);
		mvc.addObject("packlist", packages);
		mvc.addObject("supplist", suppliers);
		mvc.addObject("checkk",data);
	   return mvc;
	}

}