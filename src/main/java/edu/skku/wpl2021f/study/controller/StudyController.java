package edu.skku.wpl2021f.study.controller;

import edu.skku.wpl2021f.study.domain.Study;
import edu.skku.wpl2021f.study.domain.StudyUser;
import edu.skku.wpl2021f.study.dto.*;
import edu.skku.wpl2021f.study.domain.StudyService;
import lombok.RequiredArgsConstructor;
import org.modelmapper.ModelMapper;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.stream.Collectors;

@RestController
@RequiredArgsConstructor
public class StudyController {

    private final ModelMapper modelMapper;
    private final StudyService studyService;

    @GetMapping("/study")
    public List<StudyResponseDto> inquiryStudy(
            @RequestParam(name = "nickname") String nickname,
            @RequestParam(name = "complete") boolean isComplete
    ) {
        List<Study> studyList = studyService.loadStudyListByNickname(nickname, isComplete);
        return studyList.stream()
                .map(study -> modelMapper.map(study, StudyResponseDto.class))
                .collect(Collectors.toList());
    }

    @PutMapping("/study")
    public BasicResponseDto completeStudy(
            @RequestParam(name = "studyId") Long studyId
    ) {
        studyService.complete(studyId);
        return new BasicResponseDto(true);
    }

    @DeleteMapping("/study")
    public BasicResponseDto removeStudy(
            @RequestParam(name = "studyId") Long studyId
    ) {
        studyService.remove(studyId);
        return new BasicResponseDto(true);
    }

    @GetMapping("/study/user")
    public List<StudyUserResponseDto> inquiryStudyUserList(
            @RequestParam(name = "studyId") Long studyId,
            @RequestParam(name = "leaderNickname") String leaderNickname
    ) {
        List<StudyUser> studyUserList = studyService.loadStudyUserListByStudyIdAsLeader(studyId, leaderNickname);
        return studyUserList.stream()
                .map(studyUser -> modelMapper.map(studyUser, StudyUserResponseDto.class))
                .collect(Collectors.toList());
    }

    @PostMapping("/study/user")
    public BasicResponseDto joinStudyUser(
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
        return new BasicResponseDto(true);
    }

    @PutMapping("/study/user")
    public BasicResponseDto evictStudyUser(
            @RequestParam(name = "studyUserId") Long studyUserId
    ) {
        studyService.evict(studyUserId);
        return new BasicResponseDto(true);
    }

}
