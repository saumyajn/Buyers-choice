package com.buyerschoice.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.ListIterator;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.buyerschoice.dao.AddCartDao;
import com.buyerschoice.dao.DestinationDao;
import com.buyerschoice.dao.OrderDetailsDao;
import com.buyerschoice.dao.UserDao;
import com.buyerschoice.model.AddCart;
import com.buyerschoice.model.Destination;
import com.buyerschoice.model.OrderDetails;
import com.buyerschoice.model.User;
import com.google.gson.Gson;


@Controller
public class CartController {
	
	@Autowired
	DestinationDao cdao;
	@Autowired
	AddCartDao acdao;
	@Autowired
	UserDao rdao;
	@Autowired
	OrderDetailsDao odao;
	public CartController()
	{}
	
	
	public int getGrandTotal(List<AddCart> li)
	{
		ListIterator<AddCart> itr=li.listIterator();
		int grandtotal=0;
		while(itr.hasNext())
		{
			AddCart cd1=(AddCart)itr.next();

			grandtotal=grandtotal+(cd1.getQty()*cd1.getPrice());
			
		}
		return grandtotal;
	}

	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/Carddetails", method = RequestMethod.GET)
	public String CardDetails(@RequestParam("pid")int cid,HttpSession session,Model m) 
	{
		
		System.out.println("This is my id"+ " "+cid);
		Destination ob=cdao.DisplayImage(cid);
		System.out.println("Thisssssssssss is my id"+ " "+cid);
		
		AddCart cd=new AddCart();
		cd.setPrice(ob.getPrice());
		cd.setDestid(ob.getDestid());
		cd.setStock(ob.getStock());
		cd.setDestname(ob.getDestname());
		
		
		System.out.println("okkkkkkkkkk is my id"+ " "+cid);
		System.out.println("My Session"+session.getId());
		
		
		List<AddCart> li=(ArrayList<AddCart>)session.getAttribute("mycart");
		
		li.add(cd);
		int size=li.size();
		session.setAttribute("count",size);
		session.setAttribute("grandtotal",String.valueOf(getGrandTotal(li)));
		   m.addAttribute("cartitm",li);
		System.out.println(session.getAttribute("cart"));
		
		return "addToCart";
	}
	@RequestMapping(value="/Removecart", method=RequestMethod.GET)
	public ModelAndView DeleteCart(@RequestParam("pid")int cid,HttpSession session)
	{
		System.out.println("This is my id"+ " "+cid);
		List<AddCart> ld=(ArrayList<AddCart>)session.getAttribute("mycart");
		ListIterator<AddCart> lit=(ListIterator<AddCart>) ld.listIterator();
		while(lit.hasNext())
		{
			AddCart d=lit.next();
		if(d.getDestid()==cid)
		{
			
			System.out.println(ld.indexOf(d));
			ld.remove(ld.indexOf(d));
			break;
		}
		}
		int size=ld.size();
		session.setAttribute("mycart",ld);
		session.setAttribute("count",size);
		ModelAndView mv = new ModelAndView("addToCart", "addcart", new AddCart());
		mv.addObject("cartitm",ld);
		session.setAttribute("grandtotal",String.valueOf(getGrandTotal(ld)));
		return mv;
	
	}
	
	@RequestMapping(value = "/HeyOrderConfirmation", method = RequestMethod.GET)
	public ModelAndView orderConfirm(HttpSession session)
	{
		@SuppressWarnings("unchecked")
		List<AddCart>	li	=  (ArrayList<AddCart>)session.getAttribute("mycart");
	

		Gson gsonli = new Gson();
		String gs = gsonli.toJson(li);
		session.setAttribute("cart", gs);
			ModelAndView  mv = new ModelAndView("OrderConfirmation","addcart",new AddCart());
			mv.addObject("cart",gs);
			mv.addObject("useraddr",rdao.address((String)session.getAttribute("Userid")));
			mv.addObject("email",rdao.emailid((String)session.getAttribute("Userid")));
			mv.addObject("mobile",rdao.mobile((String)session.getAttribute("Userid")));
			session.setAttribute("grandtotal",String.valueOf(getGrandTotal(li)));
			return mv;
	}
	@RequestMapping(value = "/AddToCartgoback", method = RequestMethod.GET)
	public ModelAndView  cartgoback(HttpSession session,Model m)
	{		
		
		@SuppressWarnings("unchecked")
		List<AddCart>	li	=  (ArrayList<AddCart>)session.getAttribute("mycart");
		ModelAndView mv = new ModelAndView("addToCart", "addcart", new AddCart());

		mv.addObject("cartitm",li);
		System.out.println(session.getAttribute("mycart"));
		session.setAttribute("grandtotal",String.valueOf(getGrandTotal(li)));
		System.out.println("grandtotal");
		return mv;
			
	}
	
	
	@RequestMapping(value = "/updateqty", method = RequestMethod.GET)
	public String updateqty(@RequestParam("qty")int qty,@RequestParam("pid")int cid,HttpSession session,Model m) 
	{

		System.out.println("Quantity:"+qty);
		System.out.println("Destination ID:"+cid);
		ArrayList<AddCart> li = (ArrayList<AddCart>) session.getAttribute("mycart");
		ListIterator<AddCart> lit = (ListIterator<AddCart>) li.listIterator();
		while (lit.hasNext()) 
		{
			AddCart d = lit.next();
			if (d.getDestid() == cid) 
			{
				d.setQty(qty);
				d.setTotal(d.getQty()*d.getPrice());
				lit.set(d);
				break;
			}
			
		}
		m.addAttribute("cartitm",li);
		session.setAttribute("grandtotal",String.valueOf(getGrandTotal(li)));
		
		return "addToCart";
		

}
	@RequestMapping(value = "/GoToCart", method = RequestMethod.GET)
	public ModelAndView gotocart(HttpSession session) {

		ArrayList<AddCart> li = (ArrayList<AddCart>) session.getAttribute("mycart");

		ModelAndView mv = new ModelAndView("addToCart", "addcart", new AddCart());
		mv.addObject("cartitm", li);

		System.out.println(session.getAttribute("cart"));
		session.setAttribute("grandtotal",String.valueOf(getGrandTotal(li)));
		return mv;

	}	
	@RequestMapping(value = "/empty", method = RequestMethod.GET)
	public ModelAndView gotoemptycart(HttpSession session) {

		ArrayList<AddCart> li = (ArrayList<AddCart>) session.getAttribute("mycart");

		ModelAndView mv = new ModelAndView("emptyCart", "addcart", new AddCart());
		return mv;

	}	

	
	@RequestMapping(value = "/OrderConfirmed", method = RequestMethod.GET)
	public ModelAndView  orderconfirmed(HttpSession session) {
		List<AddCart>	li	=  (ArrayList<AddCart>)session.getAttribute("mycart");
		User userdetails=rdao.display((String)session.getAttribute("Userid"));
		
		 
	       String email=userdetails.getEmailid();
	       String phon= userdetails.getMobile();
	       String addr=userdetails.getAddress();
	       String user= userdetails.getUsername();
		
	      String fullAddress= user +"\t"+addr +"\t"+phon;
	       OrderDetails d= new OrderDetails();
			d.setPaymentMode("Credit/Debit Card");
	       d.setUserId(session.getAttribute("Userid").toString());
	       d.setOrderDate(new Date());
	       d.setOrderStatus("processing");
	       
	       String f = session.getAttribute("grandtotal").toString();
	       
	       d.setGrandTotal(Integer.valueOf(f));
	       d.setAddress(fullAddress);
	       
	       odao.addOrderDetails(d);
	       System.out.print("Order saved");
	       int ordId=d.getOrderId();
	       session.setAttribute("oid", ordId);
	       for(AddCart cd:li)
	       {
	    	   cd.setOrderID(ordId);
	    	   acdao.showCardDetails(cd);
	    	  System.out.print("Cart detail saved");
	    	   
	       }
	       String data=odao.getOrderDetail(d.getOrderId());
	       ModelAndView mv= new ModelAndView("AfterConfirmed");
	       
			mv.addObject("data",data);
			System.out.println(data);
			return mv ;
	}
	@RequestMapping(value = "/last", method = RequestMethod.GET)
	public ModelAndView  lastpagedone(HttpSession session) {
		List<AddCart>	li	=  (ArrayList<AddCart>)session.getAttribute("mycart");
		 int oid=(Integer)session.getAttribute("oid");
		 
		 OrderDetails d= new OrderDetails();
	      String data=odao.getOrderDetail(oid);
				ModelAndView v= new ModelAndView("Last","OrderDetail",new OrderDetails());
			v.addObject("data",data);

			return v ;
		
		
	}

	@RequestMapping(value = "/PaymentConfirmed", method = RequestMethod.GET)
	public ModelAndView  paymentconfirm(HttpSession session) {
		List<AddCart>	li	=  (ArrayList<AddCart>)session.getAttribute("mycart");
		
		for(AddCart cd:li)
		{
			acdao.showCardDetails(cd);
		}
		ModelAndView mv = new ModelAndView("PaymentConfirmation", "addcart", new AddCart());

		return mv;

	}
	@RequestMapping(value = "/thanku", method = RequestMethod.POST)
	public ModelAndView  Thanku(HttpSession session) {

			ModelAndView v= new ModelAndView("Thankyou","OrderDetails",new OrderDetails());
			
			return v ;
			
	    }

}
