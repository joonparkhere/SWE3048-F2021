package edu.skku.wpl2021f.study.dto;

import edu.skku.wpl2021f.main.dto.UserResponseDto;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.time.LocalDateTime;

@Getter @Setter
@NoArgsConstructor
public class StudyResponseDto {

    private Long id;
    private LocalDateTime createdDate;
    private LocalDateTime lastModifiedDate;
    private Long recruitId;
    private String title;
    private String description;
    private boolean isDelete;
    private boolean isComplete;
    private UserResponseDto leader;

}
