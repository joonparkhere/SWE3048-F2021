package edu.skku.wpl2021f.main.domain;

import lombok.AccessLevel;
import lombok.NoArgsConstructor;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Lob;

//@Entity
@NoArgsConstructor(access = AccessLevel.PROTECTED)
public class Card {

    @Id @Column(name = "boardID")
    int boardId;

    @Column(name = "cardTitle")
    String cardTitle;

    @Lob @Column(name = "cardContent")
    String cardContent;

}
