package board;

import java.util.*;

import jdbc.JdbcUtil;

import java.sql.*;
import java.sql.Date;
public class BoardDAO {
/*
	public int insert(Conntection conn,Board board) {
		
	}
	public int edit(Conntection conn,Board board) {
		
	}
	public List<Board> search(Conntection conn,String searchOP){
		
	}*/
	
	public List<Board> findAll(Connection conn,int pageNumber,int PAGE_SIZE) throws SQLException{
		
		String sql ="SELECT * FROM BOARD LIMIT ?,?";
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		try{int firstRow=(pageNumber-1)*PAGE_SIZE+1;
		 pstmt=conn.prepareStatement(sql);
		pstmt.setInt(1,firstRow);
		pstmt.setInt(2,PAGE_SIZE);
		List<Board> boards = new ArrayList<Board>();
		rs = pstmt.executeQuery();
		while(rs.next()) {
			Board board = new Board();
			board.setId(rs.getInt("id"));
			board.setUser(rs.getString("user"));
			board.setPassword(rs.getString("password"));
			board.setContent(rs.getString("content"));
			board.setRegDate(rs.getTimestamp("regDate"));
			boards.add(board);
		}
		return boards;
		}finally {
			JdbcUtil.close(pstmt);
			JdbcUtil.close(rs);
		}
		
		
	}
	


	public void insert(Connection conn, Board board) throws SQLException {
		// TODO Auto-generated method stub
		String sql = "INSERT BOARD (user,password,content,regDate) VALUES (?,?,?,?)";
		PreparedStatement pstmt=null;
		try {
			pstmt= conn.prepareStatement(sql);
		pstmt.setString(1,board.getUser());
		pstmt.setString(2,board.getPassword());
		pstmt.setString(3,board.getContent());
		pstmt.setTimestamp(4,board.getRegDate());
		pstmt.executeUpdate();}
		finally {
			JdbcUtil.close(pstmt);
		}
	}



	public Board findById(Connection conn, int id) throws SQLException {
		// TODO Auto-generated method stub
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql = "SELECT * FROM BOARD WHERE ID=?";
		try {
		pstmt= conn.prepareStatement(sql);
		pstmt.setInt(1, id);
		rs= pstmt.executeQuery();
		Board board=new Board();
		if(rs.next()) {
			board.setId(rs.getInt("id"));
			board.setUser(rs.getString("user"));
			board.setPassword(rs.getString("password"));
			board.setContent(rs.getString("content"));
			board.setRegDate(rs.getTimestamp("regDate"));
		}
		return board;}finally {JdbcUtil.close(rs);JdbcUtil.close(pstmt);}
	}



	public void update(Connection conn, Board board) throws SQLException {
		// TODO Auto-generated method stub
		PreparedStatement pstmt=null;
		try {
		String sql = "UPDATE BOARD SET content=? WHERE ID=?";
		pstmt= conn.prepareStatement(sql);
		pstmt.setString(1,board.getContent());
		pstmt.setInt(2, board.getId());
		pstmt.executeUpdate();}finally {
			JdbcUtil.close(pstmt);
		}
		
	}





	public void delete(Connection conn, int id) throws SQLException {
		// TODO Auto-generated method stub
		String sql="DELETE FROM BOARD WHERE ID=?";
		PreparedStatement pstmt= conn.prepareStatement(sql);
		pstmt.setInt(1,id);
		pstmt.executeUpdate();
	}

	public int count(Connection conn) throws SQLException{
		String sql ="SELECT COUNT(*) FROM BOARD";
		Statement stmt=conn.createStatement();
		ResultSet rs=stmt.executeQuery(sql);
		rs.next();
		return rs.getInt(1);
		
		
	}


	public List<Board> findBySearch(Connection conn, String search) throws SQLException{
		// TODO Auto-generated method stub
		
		String sql ="SELECT * FROM BOARD WHERE USER LIKE ?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		search+="%";
		pstmt.setString(1, search);
		List<Board> boards = new ArrayList<Board>();
		ResultSet rs = pstmt.executeQuery();
		while(rs.next()) {
			Board board = new Board();
			board.setId(rs.getInt("id"));
			board.setUser(rs.getString("user"));
			board.setPassword(rs.getString("password"));
			board.setContent(rs.getString("content"));
			board.setRegDate(rs.getTimestamp("regDate"));
			boards.add(board);
		}
		return boards;
		
	}
}
