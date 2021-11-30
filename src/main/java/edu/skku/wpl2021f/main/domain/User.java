package edu.skku.wpl2021f.main.domain;

import edu.skku.wpl2021f.study.domain.StudyUser;
import lombok.*;

import javax.persistence.*;
import java.util.HashSet;
import java.util.Set;

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

    @OneToMany(
            mappedBy = "user",
            fetch = FetchType.EAGER,
            cascade = CascadeType.ALL,
            orphanRemoval = true
    )
    private Set<StudyUser> studySet = new HashSet<>();

    @Builder
    public User(String oAuth2Id, String email, String nickname) {
        this.oAuth2Id = oAuth2Id;
        this.email = email;
        this.nickname = nickname;
    }

}
