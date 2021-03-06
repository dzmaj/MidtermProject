package com.skilldistillery.beerhound.controllers;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.skilldistillery.beerhound.data.BreweryDAO;
import com.skilldistillery.beerhound.entities.Bar;
import com.skilldistillery.beerhound.entities.Brewery;

@Controller
public class BreweryController {

	
	@Autowired
	private BreweryDAO breweryDAO;
	
	
	
	
	@RequestMapping(path = "breweryIndex.do", method = RequestMethod.GET)
	public String showAllBreweries(Model model, HttpSession session) {
		List<Brewery> breweryList = breweryDAO.listAllBreweries();
		model.addAttribute("breweries", breweryList);
		
		return "brewery/breweryIndex";
	}
	
	
	@RequestMapping(path = "getBrewery.do", method = RequestMethod.GET)
	public String showBreweryById(Integer id, Model model, HttpSession session) {
		
		Brewery brewery = breweryDAO.findBreweryById(id);
		
		model.addAttribute("brewery", brewery);
		
		return "brewery/show";
	}
	
	
	
	@RequestMapping(path = "getBreweryKeyword.do", method = RequestMethod.GET) 
	public String showBreweryByKeyword(String keyword, Model model, HttpSession session) {
		
		List<Brewery> brewery = breweryDAO.findBrewery(keyword);
		
		model.addAttribute("brewery", brewery);
		
		return "brewery/show";
	}
	
	
	
	@RequestMapping(path = "getBreweryUpdate.do", method = RequestMethod.GET)
	public String getBreweryToUpdate(Integer id, Model model, HttpSession session) {
		
		Brewery brewery = breweryDAO.findBreweryById(id);
		
		model.addAttribute("brewery", brewery);
		
		return "brewery/update";
	}
	
	
	@RequestMapping(path = "updateBrewery.do", method = RequestMethod.GET)
	public String updateBrewery(Model model, int id, Brewery brewery, HttpSession session) {
		
		Brewery dbBrewery = breweryDAO.findBreweryById(id);
		
		dbBrewery = breweryDAO.updateBrewery(dbBrewery);
		
		model.addAttribute("brewery", dbBrewery);
		
		return "brewery/updated";
	}
	
	
	@RequestMapping(path = "addBrewery.do", method = RequestMethod.GET)
	public String directToAdd() {
		return "brewery/add";
	}
	
	
	@RequestMapping(path = "addedBrewery.do", method = RequestMethod.GET)
	public String addBrewery(Model model, Brewery brewery, HttpSession session) {
		
		
		Brewery dbBrewery = breweryDAO.createBrewery(brewery);
		
		model.addAttribute("brewery", dbBrewery);
		
		return "brewery/updated";
	}
	
	
	@RequestMapping(path = "deleteBrewery.do", method = RequestMethod.GET)
	public String deleteBrewery(Model model, int id, HttpSession session) {
		
		
		boolean deleted = breweryDAO.deleteBrewery(id) ;
		
		model.addAttribute("deleted", deleted);
		
		return "brewery/updated";
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
