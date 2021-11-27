package edu.skku.wpl2021f.auth.principal;

import org.springframework.security.oauth2.client.userinfo.OAuth2UserRequest;
import org.springframework.security.oauth2.core.OAuth2AuthenticationException;
import org.springframework.security.oauth2.core.OAuth2Error;
import org.springframework.security.oauth2.core.OAuth2ErrorCodes;
import org.springframework.security.oauth2.core.user.OAuth2User;

public class CustomOAuth2UserFactory {
    public static CustomOAuth2User of(OAuth2UserRequest userRequest, OAuth2User oAuth2User) {
        String nameAttributeKey = userRequest.getClientRegistration()
                .getProviderDetails()
                .getUserInfoEndpoint()
                .getUserNameAttributeName();
        String clientName = userRequest.getClientRegistration()
                .getClientName();

        if (clientName.equalsIgnoreCase(GithubOAuth2User.REGISTRATION_ID)) {
            return GithubOAuth2User.builder()
                    .authorities(oAuth2User.getAuthorities())
                    .attributes(oAuth2User.getAttributes())
                    .nameAttributeKey(nameAttributeKey)
                    .build();
        }

        if (clientName.equalsIgnoreCase(GoogleOAuth2User.REGISTRATION_ID)) {
            return GoogleOAuth2User.builder()
                    .authorities(oAuth2User.getAuthorities())
                    .attributes(oAuth2User.getAttributes())
                    .nameAttributeKey(nameAttributeKey)
                    .build();
        }

        OAuth2Error oAuth2Error = new OAuth2Error(OAuth2ErrorCodes.INVALID_CLIENT, "Invalid Client", null);
        throw new OAuth2AuthenticationException(oAuth2Error, oAuth2Error.toString());
    }
}
