//***********************github.com/AkshayTR2023*************************//
package com.vaccination.service_impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.vaccination.entity.AdminUser;
import com.vaccination.repo.AdminUserRepository;
import com.vaccination.service.AdminUserService;

@Service
public class AdminUserServiceImpl implements AdminUserService {

	@Autowired
	AdminUserRepository adminRepo;

	public AdminUser getByUserNamePwd(String username, String password) {
		return (adminRepo.findByUserNamePwd(username, password));
	}

	public String registerUser(AdminUser user) {
		AdminUser checkUser1 = adminRepo.findByUsername(user.getUsername());
		if (checkUser1 != null)
			return "Duplicate username";

		AdminUser checkUser2 = adminRepo.findByEmail(user.getEmail());
		if (checkUser2 != null)
			return "Duplicate email";

		adminRepo.save(user);
		return "User added successfully";
	}

	
	public AdminUser getByUserName(String username) {
		return adminRepo.findByUsername(username);
	}
}
