//***********************github.com/AkshayTR2023*************************//
package com.vaccination.entity;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Data
@NoArgsConstructor
@AllArgsConstructor
public class Citizen {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;

	private String citizenName;
	private int doses;
	@ManyToOne
	@JoinColumn(name = "center_id")
	private VaccinationCenter center;
	// Many to One relationship is used as more than 1 citizen can be associated
	// with a single Center
}
