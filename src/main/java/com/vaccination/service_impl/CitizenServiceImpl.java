//***********************github.com/AkshayTR2023*************************//
package com.vaccination.service_impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.vaccination.entity.Citizen;
import com.vaccination.repo.CitizenRepository;
import com.vaccination.service.CitizenService;

@Service
public class CitizenServiceImpl implements CitizenService {

	@Autowired
	CitizenRepository citizenRepo;

	public List<Citizen> getAllCitizens() {
		return citizenRepo.findAll();
	}

	public List<Citizen> getCitizenByCenterId(int centerId) {
		return citizenRepo.getByCenterId(centerId);
	}

	public void delCitizenByCenterId(int centerId) {
		citizenRepo.deleteAll(citizenRepo.getByCenterId(centerId));
	}

	public Citizen addCitizen(Citizen citizen) {
		return citizenRepo.save(citizen);
	}

	public Citizen getCitizenById(int citizenId) {
		return citizenRepo.findById(citizenId).orElse(null);
	}

	public Citizen updateCitizen(Citizen citizen) {
		return citizenRepo.save(citizen);
	}

	public void delCitizenById(int citizenId) {
		citizenRepo.deleteById(citizenId);
	}

}
