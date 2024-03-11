//***********************github.com/AkshayTR2023*************************//
package com.vaccination.service_impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.vaccination.entity.VaccinationCenter;
import com.vaccination.repo.VaccinationCenterRepository;
import com.vaccination.service.VaccinationCenterService;

@Service
public class VaccinationCenterServiceImpl implements VaccinationCenterService {
	@Autowired
	VaccinationCenterRepository centerRepo;

	public List<VaccinationCenter> getAllCenters() {
		return centerRepo.findAll();
	}

	public VaccinationCenter getCenterById(int id) {
		return centerRepo.getCenterById(id);
	}

	public VaccinationCenter updateCenter(VaccinationCenter center) {
		return centerRepo.save(center);
	}

	public VaccinationCenter addCenter(VaccinationCenter center) {
		return centerRepo.save(center);
	}

	public void delCenter(int id) {
		centerRepo.deleteById(id);
	}

	public List<VaccinationCenter> getCentersByCity(String cityName) {
		return centerRepo.getCenterByCity(cityName);
	}
}
