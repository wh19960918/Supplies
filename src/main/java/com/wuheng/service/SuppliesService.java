package com.wuheng.service;

import java.util.List;

import com.wuheng.pojo.Supplies;

public interface SuppliesService {

	//查询所有
	//List<Supplies> findAll(String suppliesname,String pselect);
	
	//根据id进行查询
	Supplies findById(Integer id);
	
	//修改
	Boolean update(Supplies supplies);
	
	//删除
	Boolean delete(Integer id);

	List<Supplies> findAll(String suppliesname, String pselect, Integer minprice, Integer maxprice);
	
}
