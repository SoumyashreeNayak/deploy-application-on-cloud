//***********************github.com/AkshayTR2023*************************//
package com.vaccination.repo;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.vaccination.entity.VaccinationCenter;

public interface VaccinationCenterRepository extends JpaRepository<VaccinationCenter, Integer> {
	@Query("SELECT center FROM VaccinationCenter center WHERE center.id=?1")
	public VaccinationCenter getCenterById(int id);

	@Query("SELECT center FROM VaccinationCenter center WHERE center.city=?1")
	public List<VaccinationCenter> getCenterByCity(String cityName);

}
