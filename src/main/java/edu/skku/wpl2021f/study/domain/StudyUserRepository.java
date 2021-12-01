package edu.skku.wpl2021f.study.domain;

import edu.skku.wpl2021f.main.domain.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.Set;

public interface StudyUserRepository extends JpaRepository<StudyUser, Long> {

    @Query("select su from StudyUser su where su.user = :user and su.isEvicted = false")
    Set<StudyUser> findByUser(User user);

    @Query("select su from StudyUser su where su.study = :study")
    Set<StudyUser> findByStudy(Study study);

}
