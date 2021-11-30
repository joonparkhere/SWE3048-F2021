package edu.skku.wpl2021f.auth.dto;

import edu.skku.wpl2021f.auth.principal.GithubOAuth2User;
import edu.skku.wpl2021f.auth.principal.GoogleOAuth2User;
import edu.skku.wpl2021f.main.domain.User;
import edu.skku.wpl2021f.auth.principal.CustomOAuth2User;
import lombok.Builder;
import lombok.Getter;

import javax.validation.constraints.NotBlank;

@Getter
public class CustomOAuth2UserDto {

    @NotBlank
    private final String oAuth2Id;

    private final String email;

    private final String nickname;

    @Builder
    public CustomOAuth2UserDto(@NotBlank String oAuth2Id, String email, String nickname) {
        this.oAuth2Id = oAuth2Id;
        this.email = email;
        this.nickname = nickname;
    }

    public static CustomOAuth2UserDto of(String registrationId, CustomOAuth2User customOAuth2User) {
        if (registrationId.equalsIgnoreCase(GithubOAuth2User.REGISTRATION_ID)) {
            return ofGithub((GithubOAuth2User) customOAuth2User);
        }
        if (registrationId.equalsIgnoreCase(GoogleOAuth2User.REGISTRATION_ID)) {
            return ofGoogle((GoogleOAuth2User) customOAuth2User);
        }
        throw new IllegalArgumentException("'" + registrationId + "' is not supported resource server");
    }

    private static CustomOAuth2UserDto ofGithub(GithubOAuth2User oAuth2User) {
        return CustomOAuth2UserDto.builder()
                .oAuth2Id(oAuth2User.getOAuth2Id())
                .email(oAuth2User.getEmail())
                .nickname(oAuth2User.getNickname())
                .build();
    }

    private static CustomOAuth2UserDto ofGoogle(GoogleOAuth2User oAuth2User) {
        return CustomOAuth2UserDto.builder()
                .oAuth2Id(oAuth2User.getOAuth2Id())
                .email(oAuth2User.getEmail())
                .nickname(oAuth2User.getNickname())
                .build();
    }

    public User toEntity() {
        return User.builder()
                .oAuth2Id(oAuth2Id)
                .email(email)
                .nickname(nickname)
                .build();
    }
}
