package edu.skku.wpl2021f.auth.principal;

import edu.skku.wpl2021f.auth.principal.CustomOAuth2User;
import lombok.Builder;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.util.Assert;

import java.util.*;

public class GoogleOAuth2User implements CustomOAuth2User {

    public static final String REGISTRATION_ID = "Google";

    private final Set<GrantedAuthority> authorities;
    private final Map<String, Object> attributes;
    private final String nameAttributeKey;

    @Builder
    public GoogleOAuth2User(
            Collection<? extends GrantedAuthority> authorities,
            Map<String, Object> attributes,
            String nameAttributeKey
    ) {
        validateProperty(authorities, attributes, nameAttributeKey);

        this.authorities = Collections.unmodifiableSet(new LinkedHashSet<>(authorities));
        this.attributes = Collections.unmodifiableMap(new LinkedHashMap<>(attributes));
        this.nameAttributeKey = nameAttributeKey;
    }

    @Override
    public String getOAuth2Id() {
        return REGISTRATION_ID + getName();
    }

    @Override
    public String getEmail() {
        return getAttribute("email");
    }

    @Override
    public String getNickname() {
        return getAttribute("name");
    }

    @Override
    public String getNameAttributeKey() {
        return this.nameAttributeKey;
    }

    @Override
    public Map<String, Object> getAttributes() {
        return this.attributes;
    }

    @Override
    public Collection<? extends GrantedAuthority> getAuthorities() {
        return this.authorities;
    }

    @Override
    public String getName() {
        return getAttribute(this.nameAttributeKey).toString();
    }

    private void validateProperty(
            Collection<? extends GrantedAuthority> authorities,
            Map<String, Object> attributes,
            String nameAttributeKey
    ) {
        Assert.notEmpty(authorities, "authorities cannot be empty");
        Assert.notEmpty(attributes, "attributes cannot be empty");
        Assert.hasText(nameAttributeKey, "name attribute key cannot be empty");
        Assert.isTrue(attributes.containsKey(nameAttributeKey), "Missing attribute '" + nameAttributeKey + "' in attributes");
    }

}
