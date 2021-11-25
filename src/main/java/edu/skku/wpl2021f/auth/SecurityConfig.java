package edu.skku.wpl2021f.auth;

import lombok.RequiredArgsConstructor;
import org.springframework.boot.autoconfigure.security.servlet.PathRequest;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;

@Configuration
@EnableWebSecurity
@RequiredArgsConstructor
public class SecurityConfig extends WebSecurityConfigurerAdapter {

    private final CustomAuthenticationSuccessHandler successHandler;

    @Override
    public void configure(WebSecurity web) {
        web.ignoring()
                .mvcMatchers("/favicon.ico")
                .requestMatchers(PathRequest.toStaticResources().atCommonLocations());
    }

    @Override
    protected void configure(HttpSecurity http) throws Exception {
        http.httpBasic();
        http.csrf().disable();

        http.authorizeRequests()
                .anyRequest().permitAll();

        http.oauth2Login()
                .userInfoEndpoint().userService(configUserService())
                .and()
                .successHandler(configSuccessHandler())
                .loginPage("/login")
                .permitAll();
    }

    private CustomOAuth2UserService configUserService() {
        return new CustomOAuth2UserService();
    }

    private CustomAuthenticationSuccessHandler configSuccessHandler() {
        successHandler.setDefaultTargetUrl("/");
        successHandler.setAlwaysUseDefaultTargetUrl(false);
        return successHandler;
    }

}
