package com.skilldistillery.beerhound.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.skilldistillery.beerhound.data.BeerDAO;
import com.skilldistillery.beerhound.data.BreweryDAO;
import com.skilldistillery.beerhound.entities.Beer;

@Controller
public class BeerController {

	@Autowired
	private BeerDAO beerDao;
	
@RequestMapping(path = "getBeer.do", method = RequestMethod.GET)
	public String getBeerById(Integer id, Model model) {
		Beer beer = beerDao.findBeer(id);
		model.addAttribute("beer", beer);
		return "beer/showBeer";
	}

	@RequestMapping(path = "getBeerByName.do", method = RequestMethod.GET)
	public String getBeerbyName(String name, Model model) {
		Beer beer = beerDao.findBeerbyName(name);
		model.addAttribute("beer", beer);
		return "beer/showBeer";
	}

	@RequestMapping(path = "getBeerList.do", method = RequestMethod.GET)
	public String getBeerKeyWordSearch(String keyword, Model model) {
		List<Beer> beer = beerDao.findByKeyword(keyword);
		model.addAttribute("beer", beer);
		return "beer/beerList";
	}

	@RequestMapping(path = "addBeerForm.do")
	public String addBeerForm(Beer beer) {
		return "beer/addBeer";
	}

	@RequestMapping(path = "addBeer.do")
	public String addBeer(Beer beer, Model model) {
		model.addAttribute("beer", beerDao.createBeer(beer));
		return "beer/beerAction";
	}

	@RequestMapping(path = "updateBeerForm.do")
	public String updateBeerForm(Integer id, Model model) {
		Beer beer = beerDao.findBeer(id);
		model.addAttribute("beer", beer);

		return "beer/updateBeer";
	}

	@RequestMapping(path = "updateBeer.do")
	public String updateBeer(Beer beer, Integer id, Model model) {
		Beer updatedBeer = beerDao.findBeer(id);
		updatedBeer = beerDao.updateBeer(updatedBeer);
		model.addAttribute("beer", beer);
		return "beer/beerAction";
	}

	@RequestMapping(path = "deleteBeer.do")
	public String deleteBeer(Model model, int id) {
		Beer beer = beerDao.findBeer(id);
		beerDao.deleteBeer(id);
		model.addAttribute("beer", beer);
		return "beer/beerAction";
	}

}