package com.wuheng.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.wuheng.pojo.Supplies;

@Mapper
public interface SuppliesDao {
	
	//查询所有
	List<Supplies> findAll(String suppliesname,String pselect,Integer minprice,Integer maxprice);
	
	//根据id进行查询
	Supplies findById(Integer id);
	
	//修改
	Boolean update(Supplies supplies);
	
	//删除
	Boolean delete(Integer id);
	

}
