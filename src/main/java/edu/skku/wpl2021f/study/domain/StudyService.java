package edu.skku.wpl2021f.study.domain;

import edu.skku.wpl2021f.main.domain.User;
import edu.skku.wpl2021f.main.domain.UserService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Set;

@Service
@RequiredArgsConstructor
public class StudyService {

    private final StudyRepository studyRepository;
    private final StudyUserRepository studyUserRepository;
    private final UserService userService;

    @Transactional(readOnly = true)
    public boolean existsStudyByRecruitId(Long recruitId) {
        return studyRepository.existsByRecruitId(recruitId);
    }

    @Transactional(readOnly = true)
    public Study loadStudyById(Long studyId) {
        return studyRepository.findById(studyId).orElseThrow(RuntimeException::new);
    }

    @Transactional(readOnly = true)
    public Study loadStudyByRecruitId(Long recruitId) {
        return studyRepository.findByRecruitId(recruitId).orElseThrow(RuntimeException::new);
    }

    @Transactional
    public Study create(Long recruitId, String title, String description, String leaderNickname) {
        User leader = userService.loadUserByNickname(leaderNickname);
        Study study = Study.builder()
                .recruitId(recruitId)
                .title(title)
                .description(description)
                .leader(leader)
                .build();
        return studyRepository.save(study);
    }

//    @Transactional
//    public void remove(Long studyId) {
//        Study study = loadStudyById(studyId);
//        Set<StudyUser> studyUserSet = study.getUserSet();
//        for (StudyUser studyUser : studyUserSet) {
//            studyUserRepository.delete(studyUser);
//        }
//        studyRepository.delete(study);
//    }

    @Transactional
    public void complete(Long studyId) {
        Study study = loadStudyById(studyId);
        study.complete();
    }

    @Transactional(readOnly = true)
    public StudyUser loadStudyUserById(Long studyUserId) {
        return studyUserRepository.findById(studyUserId).orElseThrow(RuntimeException::new);
    }

    @Transactional
    public StudyUser join(Long recruitId, String nickname) {
        Study study = loadStudyByRecruitId(recruitId);
        User user = userService.loadUserByNickname(nickname);
        StudyUser studyUser = StudyUser.builder()
                .study(study)
                .user(user)
                .build();
        return studyUserRepository.save(studyUser);
    }

    @Transactional
    public void evict(Long studyUserId) {
        StudyUser studyUser = loadStudyUserById(studyUserId);
        studyUser.evict();
    }

}
