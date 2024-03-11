//***********************github.com/AkshayTR2023*************************//
package com.vaccination.entity;

import javax.persistence.Entity;
import javax.persistence.Id;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Data
@NoArgsConstructor
@AllArgsConstructor
public class AdminUser {
	@Id
	private String username;
	private String password;
	private String email;

}
