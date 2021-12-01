package edu.skku.wpl2021f.study.dto;

import edu.skku.wpl2021f.main.dto.UserResponseDto;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.time.LocalDateTime;

@Getter @Setter
@NoArgsConstructor
public class StudyUserResponseDto {

    private Long id;
    private LocalDateTime createdDate;
    private LocalDateTime lastModifiedDate;
    private UserResponseDto user;
    private boolean isEvicted;

}
