<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file= "dbconn.jsp" %>

<% 
	request.setCharacterEncoding("utf-8");
	
		String id = request.getParameter("id");
		String passwd = request.getParameter("passwd");
		String name= request.getParameter("name");
		
		PreparedStatement pstmt = null; //PreparedStatement 참조변수를 null로 초기화 //준비된 상태
		
		try{
		//member 테이블의 id, passwd, name 필드에 정해지지 않은 것을 삽입하도록 INSERT문을 작성
		String sql = "insert into member(id, passwd, name) values(?,?,?)";
		pstmt = conn.prepareStatement(sql); //PreparedStatment 객체를 생성하도록 작성
		//폼 페이지에서 전송된 아이디, 비번, 이름을 물음표에 설정하도록 setString() 메소드를 작성
		
		pstmt.setString(1, id);
		pstmt.setString(2, passwd);
		pstmt.setString(3, name);
		pstmt.executeUpdate(); //INSERT문을 실행하도록 PreparedStatement 객체의 executeUpdate() 메서드를 작성
		out.println("Member 테이블 삽입이 성공했습니다");
		}
		catch(SQLException ex){
		out.println("Member 테이블 삽입이 실패했습니다<br>");
		out.println("SQLException : " + ex.getMessage());
		}
		finally{
		//생성한 statement 객체와 Connection 객체를 해제
		if(pstmt !=null)
			pstmt.close();
		if(conn!=null)
			pstmt.close();
		}
%>	