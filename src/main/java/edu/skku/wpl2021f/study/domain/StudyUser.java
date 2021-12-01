package edu.skku.wpl2021f.study.domain;

import edu.skku.wpl2021f.main.domain.User;
import lombok.*;
import org.springframework.data.annotation.CreatedDate;
import org.springframework.data.annotation.LastModifiedDate;
import org.springframework.data.jpa.domain.support.AuditingEntityListener;

import javax.persistence.*;
import java.time.LocalDateTime;

@Entity
@Getter
@EntityListeners(AuditingEntityListener.class)
@NoArgsConstructor(access = AccessLevel.PROTECTED)
@EqualsAndHashCode(of = "id", callSuper = false)
public class StudyUser {

    @Id @GeneratedValue
    @Column(name = "study_user_id")
    private Long id;

    @CreatedDate
    @Column(updatable = false)
    private LocalDateTime createdDate;

    @LastModifiedDate
    private LocalDateTime lastModifiedDate;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "study_id")
    private Study study;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "user_id")
    private User user;

    private boolean isEvicted = false;

    @Builder
    public StudyUser(Study study, User user) {
        this.study = study;
        this.user = user;
    }

    public void evict() {
        this.isEvicted = true;
    }

}
