package co.grandcircus.restaurant_rating.dao;

import java.util.List;
import java.util.Optional;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.stereotype.Repository;


import co.grandcircus.restaurant_rating.entities.Restaurant;


public interface RestaurantRepository extends JpaRepository<Restaurant, Long>{
	public List<Restaurant> findAllByOrderByRatingDesc();
}
