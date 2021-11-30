package edu.skku.wpl2021f.study.domain;

import org.springframework.data.jpa.repository.JpaRepository;

import java.util.Optional;

public interface StudyRepository extends JpaRepository<Study, Long> {

    boolean existsByRecruitId(Long recruitId);

    Optional<Study> findByRecruitId(Long recruitId);

}
