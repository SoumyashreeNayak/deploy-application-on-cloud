//***********************github.com/AkshayTR2023*************************//
package com.vaccination.service;

import java.util.List;

import com.vaccination.entity.VaccinationCenter;

public interface VaccinationCenterService {

	public List<VaccinationCenter> getAllCenters();

	public VaccinationCenter getCenterById(int id);

	public VaccinationCenter updateCenter(VaccinationCenter center);

	public VaccinationCenter addCenter(VaccinationCenter center);

	public void delCenter(int id);

	public List<VaccinationCenter> getCentersByCity(String cityName);

}
