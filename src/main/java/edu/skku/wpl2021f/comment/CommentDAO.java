package edu.skku.wpl2021f.comment;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import edu.skku.wpl2021f.util.*;

public class CommentDAO {

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
	
	public int getNext(int boardID, int boardIdentity) {
		String SQL = "SELECT commentID FROM COMMENT WHERE boardID = ? AND boardIdentity = ? ORDER BY commentID DESC";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, boardID);
			pstmt.setInt(2, boardIdentity);
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
	
	public int write(int boardID, int boardIdentity, Long userID, String userNickname, String commentContent) {
		String SQL = "INSERT INTO COMMENT VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, boardID);
			pstmt.setInt(2, boardIdentity);
			pstmt.setInt(3, getNext(boardID, boardIdentity));
			pstmt.setLong(4, userID);
			pstmt.setString(5, userNickname);
			pstmt.setString(6, getDate());
			pstmt.setString(7, commentContent);
			pstmt.setInt(8, 1);
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
	
	public ArrayList<CommentDTO> getList(int boardID, int boardIdentity) {
		String SQL = "SELECT * FROM COMMENT WHERE commentAvailable = 1 AND boardID = ? AND boardIdentity = ? ORDER BY commentID";
		ArrayList<CommentDTO> list = new ArrayList<CommentDTO>();
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, boardID);
			pstmt.setInt(2, boardIdentity);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				CommentDTO comment = new CommentDTO();
				comment.setBoardID(rs.getInt(1));
				comment.setBoardIdentity(rs.getInt(2));
				comment.setCommentID(rs.getInt(3));
				comment.setUserID(rs.getLong(4));
				comment.setUserNickname(rs.getString(5));
				comment.setCommentDate(rs.getString(6));
				comment.setCommentContent(rs.getString(7));
				comment.setCommentAvailable(rs.getInt(8));
				list.add(comment);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public int delete(int boardID, int boardIdentity, int commentID) {
		String SQL = "UPDATE COMMENT SET commentAvailable = 0 WHERE boardID = ? AND boardIdentity = ? AND commentID = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, boardID);
			pstmt.setInt(2, boardIdentity);
			pstmt.setInt(3, commentID);
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
}
