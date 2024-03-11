//***********************github.com/AkshayTR2023*************************//
package com.vaccination.repo;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.vaccination.entity.AdminUser;

public interface AdminUserRepository extends JpaRepository<AdminUser, String> {
	@Query("SELECT au FROM AdminUser au WHERE au.username=?1 AND au.password=?2")
	public AdminUser findByUserNamePwd(String username, String password);

	@Query("SELECT au FROM AdminUser au WHERE au.email=?1")
	public AdminUser findByEmail(String email);

	@Query("SELECT au FROM AdminUser au WHERE au.username=?1")
	public AdminUser findByUsername(String username);

}
