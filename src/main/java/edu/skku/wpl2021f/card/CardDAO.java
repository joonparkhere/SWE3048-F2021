package edu.skku.wpl2021f.card;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import edu.skku.wpl2021f.util.DatabaseUtil;

public class CardDAO {
	
	Connection conn = DatabaseUtil.getConnection();
	ResultSet rs = null;
	
	public int write(int boardID, int boardIdentity, String cardTitle, String cardContent) {
		String SQL = "INSERT INTO CARD VALUES (?, ?, ?, ?)";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, boardID);
			pstmt.setInt(2, boardIdentity);
			pstmt.setString(3, cardTitle);
			pstmt.setString(4, cardContent);
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
	
	public CardDTO getCard(int boardID) {
		String SQL = "SELECT * FROM CARD WHERE boardID = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, boardID);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				CardDTO card = new CardDTO();
				card.setBoardID(rs.getInt(1));
				card.setBoardIdentity(rs.getInt(2));
				card.setCardTitle(rs.getString(3));
				card.setCardContent(rs.getString(4));
				return card;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
}
