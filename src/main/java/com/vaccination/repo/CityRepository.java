//***********************github.com/AkshayTR2023*************************//
package com.vaccination.repo;

import org.springframework.data.jpa.repository.JpaRepository;

import com.vaccination.entity.City;

public interface CityRepository extends JpaRepository<City, Integer> {

}
