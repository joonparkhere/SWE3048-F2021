package edu.skku.wpl2021f.card;

public class CardDTO {
	
	int boardID;
	String cardTitle;
	String cardContent;
	
	public int getBoardID() {
		return boardID;
	}
	public void setBoardID(int boardID) {
		this.boardID = boardID;
	}
	public String getCardTitle() {
		return cardTitle;
	}
	public void setCardTitle(String cardTitle) {
		this.cardTitle = cardTitle;
	}
	public String getCardContent() {
		return cardContent;
	}
	public void setCardContent(String cardContent) {
		this.cardContent = cardContent;
	}
}
