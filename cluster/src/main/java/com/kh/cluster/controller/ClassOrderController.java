package com.kh.cluster.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
 import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
 import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import com.kh.cluster.entity.MyClassOrder;
import com.kh.cluster.entity.MyCoupon;
 import com.kh.cluster.entity.OffClassVo;
import com.kh.cluster.entity.Offclass;
 import com.kh.cluster.service.ClassDetailService;
import com.kh.cluster.service.ClassOrderService;

@Controller
@RequestMapping("/class_order")
public class ClassOrderController {
	public static Logger log =
			LoggerFactory.getLogger(ClassDetailController.class);
	@Autowired
	private ClassDetailService service;
	
	@Autowired
	private ClassOrderService orderService;
	
	@Value("${upload.path}")
	private String uploadPath;
	HttpSession session;

	
 	@RequestMapping(value = {"/order/{classNo}"} ,method=RequestMethod.GET )
 	public ModelAndView order(HttpServletRequest req, @PathVariable int classNo) throws Exception{
		log.info("orderForm()");
		
		ModelAndView view = new ModelAndView();
		
		session= req.getSession();
		int memberNo = (int) session.getAttribute("no");
		
		//회원이 가지고 있는 쿠폰 조회
		List<MyCoupon> couponList = orderService.couponList(memberNo);
		
		OffClassVo offClass = service.read(classNo);  
		 
		//클래스 이미지
		List<Offclass> readImg = service.readImg(classNo); 
		
    	view.setViewName("class_order/order");
 		view.addObject("offClass", offClass);
       	view.addObject("readImg", readImg);
      	view.addObject("couponList", couponList);
      	
 		return view;
		
	}
	
 	@RequestMapping(value= {"/order/{classNo}"} ,method=RequestMethod.POST)
 	public RedirectView orderForm(HttpServletRequest req, @ModelAttribute("myClassOrder") MyClassOrder myClassOrder, @PathVariable int classNo) throws Exception{
 		
  		
 		orderService.order(myClassOrder);
 		orderService.useCoupon(myClassOrder);
 		orderService.changePhone(myClassOrder);
 		
 		session= req.getSession();
		int memberNo = (int) session.getAttribute("no");
		
		int orderNo = orderService.getNo(memberNo);
 		
 		System.out.println(orderNo);
 		return new  RedirectView("/class_order/kakaopay/"+orderNo);
 	}
 	
 	
 	@RequestMapping(value = {"/order_result"} ,method=RequestMethod.GET )
 	public void result()throws Exception{
 		log.info("result");
 	}
 	
  	@RequestMapping(value = {"/kakaopay/{orderNo}"} ,method=RequestMethod.GET )
 	public ModelAndView pay(Model model, @PathVariable int orderNo )throws Exception{
  		log.info("kakao");
  		
		ModelAndView view = new ModelAndView();
		
		view.setViewName("class_order/kakaopay");
		view.addObject("kakaopay", orderService.kakaopay(orderNo));
		
		return view;
 	}
 	
 	@ResponseBody
 	@RequestMapping(value = {"/kakaopay/{orderNo}"} ,method=RequestMethod.POST )
 	public void pay2(Model model, @PathVariable int orderNo )throws Exception{
  		log.info("kakao");
  		
  		orderService.payOk(orderNo);
		
//		return new RedirectView("/class_order/pay_fail");
 	}
 
 
	@RequestMapping(value = {"/pay_fail"} ,method=RequestMethod.GET )
 	public String fail()throws Exception{
   		log.info("fail");
 		
 		return "class_order/pay_fail";
 	}
 	
}
