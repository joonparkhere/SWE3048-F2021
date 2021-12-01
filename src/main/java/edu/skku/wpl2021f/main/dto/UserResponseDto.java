package edu.skku.wpl2021f.main.dto;

import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter @Setter
@NoArgsConstructor
public class UserResponseDto {

    private Long id;
    private String email;
    private String nickname;

    @Builder
    public UserResponseDto(Long id, String email, String nickname) {
        this.id = id;
        this.email = email;
        this.nickname = nickname;
    }

}
