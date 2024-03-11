//***********************github.com/AkshayTR2023*************************//
package com.vaccination.service;

import java.util.List;

import com.vaccination.entity.Citizen;

public interface CitizenService {

	public List<Citizen> getAllCitizens();

	public List<Citizen> getCitizenByCenterId(int centerId);

	public void delCitizenByCenterId(int centerId);

	public Citizen addCitizen(Citizen citizen);

	public Citizen getCitizenById(int citizenId);

	public Citizen updateCitizen(Citizen citizen);

	public void delCitizenById(int citizenId);

}
