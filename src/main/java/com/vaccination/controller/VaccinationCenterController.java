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
@RequestMapping("/vaccinationcenter")
public class VaccinationCenterController {
	@Autowired
	VaccinationCenterService centerService;
	@Autowired
	CitizenService citizenService;
	@Autowired
	CityService cityService;

	@RequestMapping("/")
	public ModelAndView getVaccCenters(HttpServletRequest request, HttpServletResponse response) {

		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("/vaccinationCenters");

		List<VaccinationCenter> centers = centerService.getAllCenters();

		modelAndView.addObject("centers", centers);
		return modelAndView;
	}

	@RequestMapping("/add")
	public ModelAndView sendCity(HttpServletRequest request, HttpServletResponse response) {

		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("/addCenter");
		List<City> cities = cityService.getAllCities();
		modelAndView.addObject("cities", cities);
		return modelAndView;
	}

	@PostMapping("/addCenter")
	public ModelAndView addCenter(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("redirect:/vaccinationcenter/");
		VaccinationCenter center = new VaccinationCenter();
		center.setCenterName(request.getParameter("center"));
		center.setCity(request.getParameter("city"));

		if (centerService.addCenter(center) != null)
			return modelAndView;
		else {
			modelAndView.setViewName("errorOper");
			return modelAndView;
		}
	}

	@RequestMapping("/view")
	public ModelAndView viewCenter(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("viewCenter");
		int centerId = Integer.parseInt(request.getParameter("id"));

		VaccinationCenter center = centerService.getCenterById(centerId);
		List<Citizen> citizens = citizenService.getCitizenByCenterId(centerId);
		modelAndView.addObject("citizens", citizens);
		modelAndView.addObject("center", center);
		return modelAndView;
	}

	@RequestMapping("/edit")
	public ModelAndView getForEdit(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("/editCenter");

		VaccinationCenter center = centerService.getCenterById(Integer.parseInt(request.getParameter("id")));
		List<City> cities = cityService.getAllCities();
		modelAndView.addObject("cities", cities);
		modelAndView.addObject("center", center);
		return modelAndView;
	}

	@RequestMapping("/editCenter")
	public ModelAndView editCenter(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("redirect:/vaccinationcenter/");
		VaccinationCenter center = new VaccinationCenter();
		center.setId(Integer.parseInt(request.getParameter("id")));
		center.setCenterName(request.getParameter("center"));
		center.setCity(request.getParameter("city"));

		center = centerService.updateCenter(center);
		if (center != null)
			return modelAndView;
		else {
			modelAndView.setViewName("errorOper");
			return modelAndView;
		}
	}

	@RequestMapping("/delete")
	public ModelAndView delCenter(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("redirect:/vaccinationcenter/");
		citizenService.delCitizenByCenterId(Integer.parseInt(request.getParameter("id")));
		centerService.delCenter(Integer.parseInt(request.getParameter("id")));

		return modelAndView;

	}
}
