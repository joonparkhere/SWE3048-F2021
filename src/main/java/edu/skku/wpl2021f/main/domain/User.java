package edu.skku.wpl2021f.main.domain;

import lombok.*;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;

@Entity
@Getter
@NoArgsConstructor(access = AccessLevel.PROTECTED)
@EqualsAndHashCode(of = "id", callSuper = false)
public class User {

    @Id @GeneratedValue
    @Column(name = "user_id")
    private Long id;

    @Column(
            name = "o_auth2_id",
            unique = true
    )
    private String oAuth2Id;

    @Column(nullable = false)
    private String email;

    @Column(nullable = false)
    private String nickname;

    @Builder
    public User(String oAuth2Id, String email, String nickname) {
        this.oAuth2Id = oAuth2Id;
        this.email = email;
        this.nickname = nickname;
    }

}
