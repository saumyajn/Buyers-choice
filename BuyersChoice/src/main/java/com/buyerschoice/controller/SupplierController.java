package com.buyerschoice.controller;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.transaction.HeuristicMixedException;
import javax.transaction.HeuristicRollbackException;
import javax.transaction.RollbackException;
import javax.transaction.SystemException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.buyerschoice.dao.SupplierDao;
import com.buyerschoice.model.Supplier;

@Controller
public class SupplierController {

	@Autowired
	SupplierDao cdao;
	
	public SupplierController()
	{}

	@RequestMapping(value = "/diff", method = RequestMethod.GET)
	public ModelAndView showSupplier() {

		ModelAndView mvc = new ModelAndView("supplierView", "supplier", new Supplier());
		String suppliers = cdao.Retrive();
		mvc.addObject("mylist", suppliers);
		return mvc;
	}
	@RequestMapping(value = "Insertsupp", method = RequestMethod.POST)
	public ModelAndView addSupplier(Supplier supplier, Model m) {

		ModelAndView m1 = new ModelAndView("supplierView", "supplier", new Supplier());
		System.out.println(supplier.getSupplierid());
		cdao.insert(supplier);

		String suppliers = cdao.Retrive();

		m1.addObject("mylist", suppliers);
		return m1;
	}

	@RequestMapping(value = "Deletesupp", method = RequestMethod.GET)
	public ModelAndView DeleteSupplier(@RequestParam("did") int cid) {

		cdao.Delete(cid);
		ModelAndView mvc = new ModelAndView("supplierView", "supplier", new Supplier());
		String suppliers = cdao.Retrive();
		mvc.addObject("mylist", suppliers);
		return mvc;
	}
	@RequestMapping(value="/plzUpdatedsupplier", method=RequestMethod.GET)
	public ModelAndView plzUpdatedSupplier(@RequestParam("did")int cid)
	{
		Supplier cat=cdao.UpdateSupplier(cid);
        boolean data=true;
		ModelAndView mvc=new ModelAndView("supplierView","supplier",cat);
		String suppliers=cdao.Retrive();
		mvc.addObject("mylist",suppliers);
		mvc.addObject("checkk",data);
	   return mvc;
	}

	@RequestMapping(value="/plzNowUpdatedsupplier", method=RequestMethod.POST)
	public ModelAndView plzNowUpdatedSupplier(@ModelAttribute("supplier")Supplier supplier,HttpServletRequest request)
	{
		
		String cid=request.getParameter("supplierid");
		String cname=request.getParameter("suppliername");
		String cdesc=request.getParameter("supplierdesc");
        
		boolean data=false;
		int cid1=Integer.parseInt(cid);
	
		cdao.NowUpdateCSupplier(cid1, cname, cdesc);
		ModelAndView mvc=new ModelAndView("supplierView","supplier",new Supplier());
		String suppliers=cdao.Retrive();
		mvc.addObject("mylist",suppliers);
		mvc.addObject("checkk",data);
	   return mvc;
	}
}
