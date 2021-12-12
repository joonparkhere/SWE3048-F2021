package edu.skku.wpl2021f.study.domain;

import edu.skku.wpl2021f.main.domain.User;
import edu.skku.wpl2021f.main.domain.UserService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Set;
import java.util.stream.Collectors;

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

    @Transactional(readOnly = true)
    public List<Study> loadStudyListByNickname(String nickname, boolean isComplete) {
        User user = userService.loadUserByNickname(nickname);
        Set<StudyUser> studyUserSet = studyUserRepository.findByUser(user);
        return studyUserSet.stream()
                .map(StudyUser::getStudy)
                .filter(study -> !study.isDelete())
                .filter(study -> study.isComplete() == isComplete)
                .sorted((o1, o2) -> o1.getCreatedDate().compareTo(o2.getCreatedDate()))
                .collect(Collectors.toList());
    }

    @Transactional
    public Study create(Long recruitId, String title, String description, String leaderNickname) {
        User leader = userService.loadUserByNickname(leaderNickname);
        String parsedDescription = description.replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\n", "<br>");
        Study study = Study.builder()
                .recruitId(recruitId)
                .title(title)
                .description(parsedDescription)
                .leader(leader)
                .build();
        return studyRepository.save(study);
    }

    @Transactional
    public void remove(Long studyId) {
        Study study = loadStudyById(studyId);
        study.delete();
    }

    @Transactional
    public void complete(Long studyId) {
        Study study = loadStudyById(studyId);
        study.complete();
    }

    @Transactional(readOnly = true)
    public StudyUser loadStudyUserById(Long studyUserId) {
        return studyUserRepository.findById(studyUserId).orElseThrow(RuntimeException::new);
    }

    @Transactional(readOnly = true)
    public List<StudyUser> loadStudyUserListByStudyIdAsLeader(Long studyId, String leaderNickname) {
        Study study = loadStudyById(studyId);
        User leader = userService.loadUserByNickname(leaderNickname);

        if (leader != study.getLeader()) {
            throw new RuntimeException();
        }

        Set<StudyUser> studyUserSet = studyUserRepository.findByStudy(study);
        return studyUserSet.stream()
                .filter(studyUser -> !studyUser.isEvicted())
                .sorted((o1, o2) -> o1.getCreatedDate().compareTo(o2.getCreatedDate()))
                .collect(Collectors.toList());
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
