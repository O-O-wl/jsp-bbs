package service;
import service.*;
import jdbc.*;
import java.sql.*;
import connection.*;
import com.mysql.jdbc.ConnectionProperties;

import board.*;


public class WriteBoardService {
	static WriteBoardService instance =new WriteBoardService();
	
	public static WriteBoardService getInstance() {
		return instance;
	}
	
	public void write(Board board) throws SQLException {
		Connection conn= null;
		try{conn=ConnectionProvider.getConnection(); 
		BoardDAO boardDao=new BoardDAO();
		boardDao.insert(conn,board);
		}finally {JdbcUtil.close(conn);}
	}
	
	
}
