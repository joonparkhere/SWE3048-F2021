package edu.skku.wpl2021f.main.domain;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.Optional;

public interface UserRepository extends JpaRepository<User, Long> {

    @Query("select u from User u where u.oAuth2Id = :oAuth2Id")
    Optional<User> findByOAuth2Id(@Param("oAuth2Id") String oAuth2Id);

}
