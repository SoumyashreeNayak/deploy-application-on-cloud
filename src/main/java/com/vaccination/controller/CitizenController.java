//***********************github.com/AkshayTR2023*************************//
package com.vaccination.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.vaccination.entity.Citizen;
import com.vaccination.entity.City;
import com.vaccination.entity.VaccinationCenter;
import com.vaccination.service.CitizenService;
import com.vaccination.service.CityService;
import com.vaccination.service.VaccinationCenterService;

@Controller
@RequestMapping("/citizens")
public class CitizenController {
	@Autowired
	VaccinationCenterService centerService;
	@Autowired
	CitizenService citizenService;
	@Autowired
	CityService cityService;

	@RequestMapping("/")
	public ModelAndView getCitizens(HttpServletRequest request, HttpServletResponse response) {

		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("citizens");

		List<Citizen> citizens = citizenService.getAllCitizens();

		modelAndView.addObject("citizens", citizens);
		return modelAndView;
	}

	@RequestMapping("/add")
	public ModelAndView addCitizen(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("addCitizen");
		List<City> cities = cityService.getAllCities();
		modelAndView.addObject("cities", cities);
		return modelAndView;
	}

	@PostMapping("/add-getcenter")
	public ModelAndView intermed(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("add-Citizen");

		List<City> cities = cityService.getAllCities();
		modelAndView.addObject("citizenName", request.getParameter("citizenName"));
		modelAndView.addObject("cities", cities);
		String selectedCity = request.getParameter("city");
		modelAndView.addObject("selectedCity", selectedCity);
		List<VaccinationCenter> centers = centerService.getCentersByCity(selectedCity);

		modelAndView.addObject("centers", centers);
		modelAndView.addObject("doses", request.getParameter("doses"));
		return modelAndView;
	}

	@PostMapping("/addCitizen")
	public ModelAndView addCenter(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("redirect:/citizens/");
		Citizen citizen = new Citizen();
		citizen.setCitizenName(request.getParameter("citizenName"));
		citizen.setDoses(Integer.parseInt(request.getParameter("doses")));
		citizen.setCenter(centerService.getCenterById(Integer.parseInt(request.getParameter("center"))));

		if (citizenService.addCitizen(citizen) != null)
			return modelAndView;
		else {
			modelAndView.setViewName("errorOper");
			return modelAndView;
		}
	}

	@RequestMapping("/view")
	public ModelAndView viewCitizen(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("viewCitizen");
		int citizenId = Integer.parseInt(request.getParameter("id"));

		Citizen citizen = citizenService.getCitizenById(citizenId);
		modelAndView.addObject("citizen", citizen);
		return modelAndView;
	}

	@RequestMapping("/edit")
	public ModelAndView getForEdit(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("/editCitizen");
		Citizen citizen = citizenService.getCitizenById(Integer.parseInt(request.getParameter("id")));
		List<City> cities = cityService.getAllCities();
		modelAndView.addObject("cities", cities);
		modelAndView.addObject("citizen", citizen);
		return modelAndView;
	}

	@PostMapping("/edit-getcenter")
	public ModelAndView intermedEdit(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("/edit-Citizen");

		List<City> cities = cityService.getAllCities();
		modelAndView.addObject("citizenId", Integer.parseInt(request.getParameter("id")));
		modelAndView.addObject("citizenName", request.getParameter("citizenName"));
		modelAndView.addObject("cities", cities);
		String selectedCity = request.getParameter("city");
		modelAndView.addObject("selectedCity", selectedCity);
		List<VaccinationCenter> centers = centerService.getCentersByCity(selectedCity);

		modelAndView.addObject("centers", centers);
		modelAndView.addObject("doses", request.getParameter("doses"));
		return modelAndView;
	}

	@PostMapping("/editCitizen")
	public ModelAndView editCitizen(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("redirect:/citizens/");
		Citizen citizen = new Citizen();
		citizen.setId(Integer.parseInt(request.getParameter("id")));
		citizen.setCitizenName(request.getParameter("citizenName"));
		citizen.setDoses(Integer.parseInt(request.getParameter("doses")));
		citizen.setCenter(centerService.getCenterById(Integer.parseInt(request.getParameter("center"))));

		if (citizenService.updateCitizen(citizen) != null)
			return modelAndView;
		else {
			modelAndView.setViewName("errorOper");
			return modelAndView;
		}
	}

	@RequestMapping("delete")
	public ModelAndView delCitizen(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("redirect:/citizens/");
		citizenService.delCitizenById(Integer.parseInt(request.getParameter("id")));
		return modelAndView;

	}
}
