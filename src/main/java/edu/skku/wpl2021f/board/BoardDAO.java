package edu.skku.wpl2021f.board;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import edu.skku.wpl2021f.util.*;

public class BoardDAO {
	
	Connection conn = DatabaseUtil.getConnection();
	ResultSet rs = null;
	
	public String getDate() {
		String SQL = "SELECT NOW()";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				return rs.getString(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "";
	}
	
	public int getNext(int boardIdentity) {
		String SQL = "SELECT boardID FROM BOARD WHERE boardIdentity = ? ORDER BY boardID DESC";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, boardIdentity);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				return rs.getInt(1)+1;
			}
			return 1;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
	
	public int write(int boardIdentity, String boardTitle, Long userID, String userNickname, String boardContent) {
		String SQL = "INSERT INTO BOARD VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext(boardIdentity));
			pstmt.setInt(2, boardIdentity);
			pstmt.setString(3, boardTitle);
			pstmt.setLong(4, userID);
			pstmt.setString(5, userNickname);
			pstmt.setString(6, getDate());
			pstmt.setString(7, boardContent);
			pstmt.setInt(8, 1);
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
	
	public ArrayList<BoardDTO> getList(int pageNumber, int boardIdentity) {
		String SQL = "SELECT * FROM BOARD WHERE boardAvailable = 1 AND boardIdentity = ? ORDER BY boardID DESC LIMIT 10 OFFSET ?";
		ArrayList<BoardDTO> list = new ArrayList<BoardDTO>();
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, boardIdentity);
			pstmt.setInt(2, (pageNumber - 1) * 10);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				BoardDTO board = new BoardDTO();
				board.setBoardID(rs.getInt(1));
				board.setBoardIdentity(rs.getInt(2));
				board.setBoardTitle(rs.getString(3));
				board.setUserID(rs.getLong(4));
				board.setUserNickname(rs.getString(5));
				board.setBoardDate(rs.getString(6));
				board.setBoardContent(rs.getString(7));
				board.setBoardAvailable(rs.getInt(8));
				list.add(board);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public boolean nextPage(int pageNumber, int boardIdentity) {
		String SQL = "SELECT * FROM BOARD WHERE boardAvailable = 1 AND boardIdentity = ? ORDER BY boardID DESC LIMIT 10 OFFSET ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, boardIdentity);
			pstmt.setInt(2, (pageNumber - 1) * 10);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				return true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}
	
	public BoardDTO getBoard(int boardID, int boardIdentity) {
		String SQL = "SELECT * FROM BOARD WHERE boardID = ? AND boardIdentity = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, boardID);
			pstmt.setInt(2, boardIdentity);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				BoardDTO board = new BoardDTO();
				board.setBoardID(rs.getInt(1));
				board.setBoardIdentity(rs.getInt(2));
				board.setBoardTitle(rs.getString(3));
				board.setUserID(rs.getLong(4));
				board.setUserNickname(rs.getString(5));
				board.setBoardDate(rs.getString(6));
				board.setBoardContent(rs.getString(7));
				board.setBoardAvailable(rs.getInt(8));
				return board;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public int update(int boardID, int boardIdentity, String boardTitle, String boardContent) {
		String SQL = "UPDATE BOARD SET boardTitle = ?, boardContent = ? WHERE boardID = ? AND boardIdentity = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, boardTitle);
			pstmt.setString(2, boardContent);
			pstmt.setInt(3, boardID);
			pstmt.setInt(4, boardIdentity);
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
	
	public int delete(int boardID, int boardIdentity) {
		String SQL = "UPDATE BOARD SET boardAvailable = 0 WHERE boardID = ? AND boardIdentity = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, boardID);
			pstmt.setInt(2, boardIdentity);
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
}
