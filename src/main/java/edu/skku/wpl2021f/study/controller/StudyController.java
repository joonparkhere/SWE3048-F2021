package edu.skku.wpl2021f.study.controller;

import edu.skku.wpl2021f.study.Dto.JoinStudyUserDto;
import edu.skku.wpl2021f.study.Dto.RequestStudyDto;
import edu.skku.wpl2021f.study.Dto.RequestStudyUserDto;
import edu.skku.wpl2021f.study.domain.Study;
import edu.skku.wpl2021f.study.domain.StudyService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

@Controller
@RequiredArgsConstructor
public class StudyController {

    private final StudyService studyService;

//    @DeleteMapping("/study")
//    public void removeStudy(
//            @RequestBody RequestStudyDto requestStudyDto
//    ) {
//        studyService.remove(requestStudyDto.getStudyId());
//    }

    @PutMapping("/study")
    public void completeStudy(
            @RequestBody RequestStudyDto requestStudyDto
    ) {
        studyService.complete(requestStudyDto.getStudyId());
    }

    @PostMapping("/study/user")
    public void joinStudyUser(
            @RequestBody JoinStudyUserDto joinStudyUserDto
            ) {
        if (!studyService.existsStudyByRecruitId(joinStudyUserDto.getRecruitId())) {
            studyService.create(
                    joinStudyUserDto.getRecruitId(),
                    joinStudyUserDto.getTitle(),
                    joinStudyUserDto.getDescription(),
                    joinStudyUserDto.getLeaderNickname()
            );
            studyService.join(joinStudyUserDto.getRecruitId(), joinStudyUserDto.getLeaderNickname());
        }

        studyService.join(joinStudyUserDto.getRecruitId(), joinStudyUserDto.getFollowerNickname());
    }

    @PutMapping("/study/user")
    public void evictStudyUser(
            @RequestBody RequestStudyUserDto requestStudyUserDto
    ) {
        studyService.evict(requestStudyUserDto.getStudyUserId());
    }

}
