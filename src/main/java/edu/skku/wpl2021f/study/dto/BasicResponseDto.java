package edu.skku.wpl2021f.study.dto;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter @Setter
@NoArgsConstructor
public class BasicResponseDto {

    private boolean result;

    public BasicResponseDto(boolean result) {
        this.result = result;
    }

}
