package service;

import jdbc.*;
import connection.*;
import board.*;
import java.sql.*;
import java.util.*;


public class GetBoardListService {
	final static int PAGE_SIZE=3;
	private static GetBoardListService instance= new GetBoardListService();
	
	public static GetBoardListService getInstance() {
		return instance;
	}
	public List<Board> findAll(int pageSize) throws Exception{
		Connection conn =null;
		try{conn=ConnectionProvider.getConnection();
		BoardDAO boardDao= new BoardDAO();
		return boardDao.findAll(conn,pageSize,PAGE_SIZE);}finally {JdbcUtil.close(conn);}
		
	}
	public Board findById(int id) throws Exception{
		Connection conn=null;
		try{
			conn =ConnectionProvider.getConnection();BoardDAO boardDao= new BoardDAO();
		return boardDao.findById(conn,id);}finally {JdbcUtil.close(conn);}
	}
	
	public List<Board> findBySearch(String search) throws Exception{
		Connection conn =null;
		try{conn=ConnectionProvider.getConnection();
		BoardDAO boardDao= new BoardDAO();
		return boardDao.findBySearch(conn,search);}
		finally {
			JdbcUtil.close(conn);
		}
	}
	public List<Integer> getPagination() throws Exception {
		BoardDAO boardDao= new BoardDAO();
		Connection conn =null;
		try{conn=ConnectionProvider.getConnection();
		int pages=((float)boardDao.count(conn)/PAGE_SIZE)>(int)(boardDao.count(conn)/PAGE_SIZE)?(boardDao.count(conn)/PAGE_SIZE)+1:(boardDao.count(conn)/PAGE_SIZE);
		System.out.println(boardDao.count(conn)/PAGE_SIZE);
		System.out.println(pages);
		List<Integer> pagination=new ArrayList<Integer>();
		for(int i=1;i<=pages;i++) {
			pagination.add(i);
		}
		return pagination;}finally {JdbcUtil.close(conn);}
	}
	
	public void update(Board board) throws SQLException {
		Connection conn=null;
		try{conn=ConnectionProvider.getConnection(); 
		BoardDAO boardDao=new BoardDAO();
		boardDao.update(conn,board);}
		finally {
			JdbcUtil.close(conn);
		}
		
	}
	
}
