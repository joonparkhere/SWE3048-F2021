package edu.skku.wpl2021f.main.domain;

import lombok.AccessLevel;
import lombok.NoArgsConstructor;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Lob;
import java.io.Serializable;
import java.time.LocalDateTime;

//@Entity
@NoArgsConstructor(access = AccessLevel.PROTECTED)
public class Comment implements Serializable {

    @Id @Column(name = "boardID")
    int boardId;

    @Id @Column(name = "boardIdentity")
    int boardIdentity;

    @Id @Column(name = "commentID")
    int commentId;

    @Column(name = "userID")
    String userId;

    @Column(name = "userNickname")
    String userNickname;

    @Column(name = "commentDate")
    LocalDateTime commentDate;

    @Lob @Column(name = "commentContent")
    String commentContent;

    @Column(name = "commentAvailable")
    int commentAvailable;

}
