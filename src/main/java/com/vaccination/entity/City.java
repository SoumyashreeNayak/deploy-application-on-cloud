//***********************github.com/AkshayTR2023*************************//
package com.vaccination.entity;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

import lombok.Data;

@Data
@Entity
public class City {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	private String cityname;
	
}
// The City Names are inserted directly from MySQL by the admin if another city needs to be added.