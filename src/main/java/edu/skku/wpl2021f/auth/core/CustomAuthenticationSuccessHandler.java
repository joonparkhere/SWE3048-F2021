package edu.skku.wpl2021f.auth.core;

import edu.skku.wpl2021f.auth.principal.CustomOAuth2User;
import edu.skku.wpl2021f.auth.dto.CustomOAuth2UserDto;
import edu.skku.wpl2021f.main.domain.UserService;
import lombok.RequiredArgsConstructor;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.oauth2.client.authentication.OAuth2AuthenticationToken;
import org.springframework.security.oauth2.core.OAuth2AuthenticationException;
import org.springframework.security.oauth2.core.OAuth2Error;
import org.springframework.security.oauth2.core.OAuth2ErrorCodes;
import org.springframework.security.oauth2.core.user.OAuth2User;
import org.springframework.security.web.authentication.SavedRequestAwareAuthenticationSuccessHandler;
import org.springframework.stereotype.Component;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@Component
@RequiredArgsConstructor
public class CustomAuthenticationSuccessHandler extends SavedRequestAwareAuthenticationSuccessHandler {

    private final UserService userService;

    @Override
    public void onAuthenticationSuccess(
            HttpServletRequest request,
            HttpServletResponse response,
            Authentication authentication
    ) throws IOException {
        OAuth2AuthenticationToken oAuth2AuthenticationToken = checkInvalidAuthenticationToken(authentication);
        CustomOAuth2User principal = checkInvalidPrincipal(oAuth2AuthenticationToken.getPrincipal());
        CustomOAuth2UserDto oAuth2UserDto = CustomOAuth2UserDto.of(oAuth2AuthenticationToken.getAuthorizedClientRegistrationId(), principal);

        userService.register(oAuth2UserDto);

        UsernamePasswordAuthenticationToken authenticationToken = new UsernamePasswordAuthenticationToken(
                oAuth2UserDto.toEntity(), "", principal.getAuthorities()
        );
        SecurityContext context = SecurityContextHolder.getContext();
        context.setAuthentication(authenticationToken);

        clearAuthenticationAttributes(request);
        getRedirectStrategy().sendRedirect(request, response, "/");
    }

    private OAuth2AuthenticationToken checkInvalidAuthenticationToken(Authentication authentication) {
        if (!(authentication instanceof OAuth2AuthenticationToken)) {
            OAuth2Error oAuth2Error = new OAuth2Error(OAuth2ErrorCodes.INVALID_TOKEN, "Invalid Login Way", null);
            throw new OAuth2AuthenticationException(oAuth2Error, oAuth2Error.toString());
        }
        return (OAuth2AuthenticationToken) authentication;
    }

    private CustomOAuth2User checkInvalidPrincipal(OAuth2User oAuth2User) {
        if (!(oAuth2User instanceof CustomOAuth2User)) {
            OAuth2Error oAuth2Error = new OAuth2Error(OAuth2ErrorCodes.INVALID_CLIENT, "Invalid Client", null);
            throw new OAuth2AuthenticationException(oAuth2Error, oAuth2Error.toString());
        }
        return (CustomOAuth2User) oAuth2User;
    }

}
