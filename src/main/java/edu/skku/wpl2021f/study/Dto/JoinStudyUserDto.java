package edu.skku.wpl2021f.study.Dto;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter @Setter
@NoArgsConstructor
public class JoinStudyUserDto {

    private Long recruitId;

    private String title;

    private String description;

    private String leaderNickname;

    private String followerNickname;

}
