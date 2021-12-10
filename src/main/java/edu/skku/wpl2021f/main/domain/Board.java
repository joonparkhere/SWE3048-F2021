package edu.skku.wpl2021f.main.domain;

import lombok.AccessLevel;
import lombok.NoArgsConstructor;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import java.io.Serializable;
import java.time.LocalDateTime;

//@Entity
@NoArgsConstructor(access = AccessLevel.PROTECTED)
public class Board implements Serializable {

    @Id @Column(name = "boardID")
    int boardId;

    @Id @Column(name = "boardIdentity")
    int boardIdentity;

    @Column(name = "boardTitle")
    String boardTitle;

    @Column(name = "userID")
    String userId;

    @Column(name = "userNickname")
    String userNickname;

    @Column(name = "boardDate")
    LocalDateTime boardDate;

    @Column(name = "boardContent")
    String boardContent;

    @Column(name = "boardAvailable")
    int boardAvailable;

}
