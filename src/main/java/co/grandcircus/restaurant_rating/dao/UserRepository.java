package co.grandcircus.restaurant_rating.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import co.grandcircus.restaurant_rating.entities.User;


public interface UserRepository extends JpaRepository<User, Long>{

	User findByEmailAndPassword(String email, String password);
	
}
