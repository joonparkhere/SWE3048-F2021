package edu.skku.wpl2021f.study.domain;

import edu.skku.wpl2021f.main.domain.User;
import lombok.*;
import org.springframework.data.annotation.CreatedDate;
import org.springframework.data.annotation.LastModifiedDate;
import org.springframework.data.jpa.domain.support.AuditingEntityListener;

import javax.persistence.*;
import java.time.LocalDateTime;
import java.util.HashSet;
import java.util.Set;

@Entity
@Getter
@EntityListeners(AuditingEntityListener.class)
@NoArgsConstructor(access = AccessLevel.PROTECTED)
@EqualsAndHashCode(of = "id", callSuper = false)
public class Study {

    @Id @GeneratedValue
    @Column(name = "study_id")
    private Long id;

    @CreatedDate
    @Column(updatable = false)
    private LocalDateTime createdTime;

    @LastModifiedDate
    private LocalDateTime lastModifiedDate;

    @Column
    private Long recruitId;

    @Column
    private String title;

    @Column
    private String description;

    private boolean isComplete = false;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "user_id")
    private User leader;

    @OneToMany(
            mappedBy = "study",
            fetch = FetchType.EAGER,
            cascade = CascadeType.ALL,
            orphanRemoval = true
    )
    private Set<StudyUser> userSet = new HashSet<>();

    @Builder
    public Study(Long recruitId, String title, String description, User leader) {
        this.recruitId = recruitId;
        this.title = title;
        this.description = description;
        this.leader = leader;
    }

    public void complete() {
        this.isComplete = true;
    }

}
