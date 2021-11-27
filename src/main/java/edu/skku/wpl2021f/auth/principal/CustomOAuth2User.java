package edu.skku.wpl2021f.auth.principal;

import org.springframework.security.oauth2.core.user.OAuth2User;

public interface CustomOAuth2User extends OAuth2User {

    String getOAuth2Id();

    String getEmail();

    String getNickname();

    String getNameAttributeKey();

}
