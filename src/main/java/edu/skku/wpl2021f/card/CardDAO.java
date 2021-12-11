package edu.skku.wpl2021f.card;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import edu.skku.wpl2021f.util.DatabaseUtil;

public class CardDAO {
	
	Connection conn = DatabaseUtil.getConnection();
	ResultSet rs = null;
	
	/* method to write cart title and card content */
	public int write(int boardID, String cardTitle, String cardContent) {
		String SQL = "INSERT INTO CARD VALUES (?, ?, ?)";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, boardID);
			pstmt.setString(2, cardTitle);
			pstmt.setString(3, cardContent);
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
	
	/* method to get the card information */
	public CardDTO getCard(int boardID) {
		String SQL = "SELECT * FROM CARD WHERE boardID = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, boardID);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				CardDTO card = new CardDTO();
				card.setBoardID(rs.getInt(1));
				card.setCardTitle(rs.getString(2));
				card.setCardContent(rs.getString(3));
				return card;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	/* method to update the card */
	public int update(int boardID, String cardTitle, String cardContent) {
		String SQL = "UPDATE CARD SET cardTitle = ?, cardContent = ? WHERE boardID = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, cardTitle);
			pstmt.setString(2, cardContent);
			pstmt.setInt(3, boardID);
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
}
