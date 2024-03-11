//***********************github.com/AkshayTR2023*************************//
package com.vaccination.service;

import com.vaccination.entity.AdminUser;

public interface AdminUserService {

	public AdminUser getByUserNamePwd(String username, String password);

	public String registerUser(AdminUser user);

	public AdminUser getByUserName(String username);

}
