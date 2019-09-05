package com.wuheng.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wuheng.dao.SuppliesDao;
import com.wuheng.pojo.Supplies;
import com.wuheng.service.SuppliesService;

@Service
public class SuppliesServiceImpl implements SuppliesService {
	
	@Autowired
	private SuppliesDao suppliesDao;

	

	@Override
	public Supplies findById(Integer id) {
		return suppliesDao.findById(id);
	}

	@Override
	public Boolean update(Supplies supplies) {
		return suppliesDao.update(supplies);
	}

	@Override
	public Boolean delete(Integer id) {
		return suppliesDao.delete(id);
	}


	@Override
	public List<Supplies> findAll(String suppliesname, String pselect,Integer minprice,Integer maxprice) {
		return suppliesDao.findAll(suppliesname, pselect,minprice,maxprice);
	}

}
