package com.buyerschoice.controller;


import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.buyerschoice.dao.PackageDao;
import com.buyerschoice.model.Package;
import com.buyerschoice.model.Supplier;

import javax.servlet.http.*;

@Controller
public class PackageController {

	@Autowired
	PackageDao cdao;
	
	public PackageController()
	{
		
	}
	

	@RequestMapping(value ="/diffpackage",method=RequestMethod.GET)
	public ModelAndView showPackage() 
	{	
		
		ModelAndView mvc=new ModelAndView("packageView","pack",new Package());
		String packages=cdao.Retrive();
		mvc.addObject("mylist",packages);
		return mvc;
	}
	
	@RequestMapping(value="/Insertpackage", method=RequestMethod.POST)
	public ModelAndView addPackage(Package pack, Model m) 
	{
		
		ModelAndView m1=new ModelAndView("packageView","pack",new Package());
		System.out.println(pack.getPackageid());
		cdao.insert(pack);
		boolean data=false;
		String packages=cdao.Retrive();
		m1.addObject("checkk",data);
		m1.addObject("mylist",packages);
		return m1;
	}
	@RequestMapping(value = "Deletepackage", method = RequestMethod.GET)
	public ModelAndView DeletePackage(@RequestParam("did") int cid) {

		cdao.Delete(cid);
		ModelAndView mvc = new ModelAndView("packageView", "pack", new Package());
		String packages = cdao.Retrive();
		mvc.addObject("mylist", packages);
		return mvc;
	}
	@RequestMapping(value="/plzUpdatedpackage", method=RequestMethod.GET)
	public ModelAndView plzUpdatedPackage(@RequestParam("did")int cid)
	{
		Package cat=cdao.UpdatePackage(cid);
        boolean data=true;
		ModelAndView mvc=new ModelAndView("packageView","pack",cat);
		String packages=cdao.Retrive();
		mvc.addObject("mylist",packages);
		mvc.addObject("checkk",data);
	   return mvc;
	}

	@RequestMapping(value="/plzNowUpdatedpackage", method=RequestMethod.POST)
	public ModelAndView plzNowUpdatedPackage(@ModelAttribute("pack")Package pack,HttpServletRequest request)
	{
		
		String cid=request.getParameter("packageid");
		String cname=request.getParameter("packagename");
		String cdesc=request.getParameter("packagedescription");
        boolean data=false;
		int cid1=Integer.parseInt(cid);
		cdao.NowUpdatePackage(cid1, cname, cdesc);
		ModelAndView mvc=new ModelAndView("packageView","pack",new Package());
		String packages=cdao.Retrive();
		mvc.addObject("mylist",packages);
		mvc.addObject("checkk",data);
	   return mvc;
	}
}