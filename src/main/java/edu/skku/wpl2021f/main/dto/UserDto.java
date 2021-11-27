package edu.skku.wpl2021f.main.dto;

import lombok.Builder;
import lombok.Getter;

@Getter
public class UserDto {

    private final String email;

    private final String nickname;

    @Builder
    public UserDto(String email, String nickname) {
        this.email = email;
        this.nickname = nickname;
    }

}
