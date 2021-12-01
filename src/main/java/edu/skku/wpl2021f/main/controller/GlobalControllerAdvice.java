package edu.skku.wpl2021f.main.controller;

import edu.skku.wpl2021f.main.domain.User;
import edu.skku.wpl2021f.main.dto.UserResponseDto;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ModelAttribute;

@ControllerAdvice
public class GlobalControllerAdvice {

    @ModelAttribute("user")
    public UserResponseDto addUser(@AuthenticationPrincipal User user) {
        if (user == null) return null;

        return UserResponseDto.builder()
                .id(user.getId())
                .email(user.getEmail())
                .nickname(user.getNickname())
                .build();
    }

}
