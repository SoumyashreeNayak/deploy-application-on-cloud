//***********************github.com/AkshayTR2023*************************//
package com.vaccination.repo;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.vaccination.entity.Citizen;

public interface CitizenRepository extends JpaRepository<Citizen, Integer> {

	@Query("SELECT citizen FROM Citizen citizen JOIN citizen.center citizen_center WHERE citizen_center.id = ?1")
	public List<Citizen> getByCenterId(int centerId);

}
