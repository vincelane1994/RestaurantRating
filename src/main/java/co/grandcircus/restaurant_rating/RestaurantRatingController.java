package co.grandcircus.restaurant_rating;

import java.util.List;
import java.util.Optional;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;


import co.grandcircus.restaurant_rating.dao.RestaurantRepository;
import co.grandcircus.restaurant_rating.dao.UserRepository;
import co.grandcircus.restaurant_rating.entities.Restaurant;
import co.grandcircus.restaurant_rating.entities.User;


@Controller
public class RestaurantRatingController {

	@Autowired
	RestaurantRepository dao;
	
	@Autowired
	UserRepository userDao;
	
	@RequestMapping("/")
	public ModelAndView index() {
		List<Restaurant> restaurant = dao.findAllByOrderByRatingDesc();
		return new ModelAndView("list", "restaurant", restaurant);
	}
	@RequestMapping("/add")
	public ModelAndView showAdd() {
		return new ModelAndView("add");
	}
	@RequestMapping("/add-confirmation")
	public ModelAndView submitSignup(Restaurant restaurant, HttpSession session) {
		System.out.println(restaurant);
		dao.save(restaurant);
		session.setAttribute("restaurant", restaurant);
		ModelAndView mv = new ModelAndView("redirect:/");
		mv.addObject(restaurant);
		return mv;
	}
	
	@RequestMapping("/add-rating")
	public ModelAndView addRating(@RequestParam("id") Long id, HttpSession session) {
		Restaurant rest = dao.getOne(id);
//		System.out.println(rest);
//		System.out.println("Rating B: " + rest.getRating());
		rest.setRating(rest.getRating() + 1);
//		System.out.println(rest);
		dao.save(rest);
		return new ModelAndView("redirect:/");
	}

	@RequestMapping("/remove-rating")
	public ModelAndView removeRating(@RequestParam("id") Long id, HttpSession session) {
		Restaurant rest = dao.getOne(id);
//		System.out.println(rest);
//		System.out.println("Rating B: " + rest.getRating());
		rest.setRating(rest.getRating() - 1);
//		System.out.println(rest);
		dao.save(rest);
		return new ModelAndView("redirect:/");
	}
	
	@RequestMapping("/login")
	public ModelAndView login() {
		return new ModelAndView("login-form");
	}
	
	@PostMapping("/login")
	public ModelAndView submitLogin(
			@RequestParam("email")String email,
			@RequestParam("password")String password,
			HttpSession session) {
		User user = userDao.findByEmailAndPassword(email, password);
		System.out.println(user);
		if(user == null) {
			return new ModelAndView("login-form", "message", "Incorrect username or password");
		}
		
		session.setAttribute("user", user);
		return new ModelAndView("redirect:/");
	}
	@RequestMapping("/signup")
	public ModelAndView showSignup() {
		return new ModelAndView("signup-form");
	}
	
	@RequestMapping("/signup-confirmation")
	public ModelAndView submitSignup(User user, HttpSession session) {
		userDao.save(user);
		session.setAttribute("user", user);
		ModelAndView mv = new ModelAndView("list");
		mv.addObject(user);
		return mv;
	}
	
	@RequestMapping("/logout")
	public ModelAndView logout(HttpSession session) {
		session.invalidate();//This scraps current session
		return new ModelAndView("redirect:/");
	}
	
	

}
