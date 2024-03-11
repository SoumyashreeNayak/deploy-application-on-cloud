//***********************github.com/AkshayTR2023*************************//
package com.vaccination.service_impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.vaccination.entity.City;
import com.vaccination.repo.CityRepository;
import com.vaccination.service.CityService;

@Service
public class CityServiceImpl implements CityService {
	@Autowired
	CityRepository cityRepo;

	public List<City> getAllCities() {
		return cityRepo.findAll();
	}

}
//The City Names are inserted directly from MySQL by the admin if another city needs to be added.
//So there is no method created to insert city names from the Application