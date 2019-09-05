package com.wuheng.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.wuheng.pojo.Product;

@Mapper
public interface ProductDao {
	
	//根据product进行查询
	Product findById(Integer id);
	
	//查询所有
	List<Product> findAll();
	

}
