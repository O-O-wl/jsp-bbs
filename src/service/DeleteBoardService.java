package service;

import java.sql.Connection;
import jdbc.*;
import board.Board;
import board.BoardDAO;
import connection.ConnectionProvider;

public class DeleteBoardService {
	static DeleteBoardService instance =new DeleteBoardService();
	
	public static DeleteBoardService getInstance() {
		return instance;
	}
	
			
	public void delete(int id) throws Exception{
		Connection conn =null;
		try{conn=ConnectionProvider.getConnection();
		BoardDAO boardDao= new BoardDAO();
		boardDao.delete(conn,id);}
		finally {
			JdbcUtil.close(conn);
		}
	}
}
