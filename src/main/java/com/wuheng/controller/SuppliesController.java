package com.wuheng.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.wuheng.pojo.Product;
import com.wuheng.pojo.Supplies;
import com.wuheng.service.ProductService;
import com.wuheng.service.SuppliesService;

@RestController
@RequestMapping("/supplies")
public class SuppliesController {

	@Autowired
	private SuppliesService suppliesService;

	@Autowired
	private ProductService productService;

	@RequestMapping("/findAll")
	public ModelAndView findAll(Integer minprice,Integer maxprice,@RequestParam(value = "cp", defaultValue = "1") Integer cp,String suppliesname,String pselect) {
		PageHelper.startPage(cp, 5);
		ModelAndView mv = new ModelAndView("index");
		
		System.out.println("minprice:"+minprice);
		System.out.println("maxprice:"+maxprice);
		if(suppliesname=="") {
			suppliesname=null;
		}
		if(pselect=="") {
			pselect=null;
		}
		
		List<Supplies> list = suppliesService.findAll(suppliesname, pselect,minprice,maxprice);
		System.out.println(list);
		PageInfo<Supplies> pageInfo = new PageInfo<Supplies>(list);
		List<Product> plist = productService.findAll();
		mv.addObject("plist", plist);
		mv.addObject("pageInfo", pageInfo);
		
		return mv;
	}

	@RequestMapping("/findById")
	public ModelAndView findById(Integer id) {
		ModelAndView mv = new ModelAndView("update");
		Supplies supplies = suppliesService.findById(id);
		List<Product> list = productService.findAll();
		mv.addObject("supplies", supplies);
		mv.addObject("list", list);
		return mv;
	}

	@RequestMapping("/update")
	public Boolean update(Integer id, String sname, Integer snum, Double sprice, Integer sele) {
		Supplies supplies = new Supplies();
		supplies.setSid(id);
		supplies.setSname(sname);
		supplies.setSnum(snum);
		supplies.setSprice(sprice);
		supplies.setSproduct(sele);

		Boolean flag = suppliesService.update(supplies);
		System.out.println(flag);
		return flag;
	}

	@RequestMapping("/delete")
	public ModelAndView delete(Integer id) {
		Boolean flag = suppliesService.delete(id);
		ModelAndView mv=new ModelAndView("forward:/supplies/findAll");
		return mv;
	}

	@RequestMapping("/deleteSelect")
	public ModelAndView deleteSelect(HttpServletRequest request) {
		String[] ids = request.getParameterValues("sid");
		ModelAndView mv=new ModelAndView("forward:/supplies/findAll");

		for (String id : ids) {
			suppliesService.delete(Integer.parseInt(id));
		}
		return mv;
	}
	
	/*
	 * @RequestMapping("/selected") public ModelAndView selected(@RequestParam(value
	 * = "cp", defaultValue = "1") Integer cp,String suppliesname,String pselect) {
	 * 
	 * PageHelper.startPage(cp, 5); ModelAndView mv = new ModelAndView("select");
	 * List<Supplies> list = suppliesService.findAllSelect(suppliesname, pselect);
	 * System.out.println(list); PageInfo<Supplies> pageInfo = new
	 * PageInfo<Supplies>(list); List<Product> plist = productService.findAll();
	 * mv.addObject("plist", plist); mv.addObject("pageInfo", pageInfo); return mv;
	 * 
	 * }
	 */
}
