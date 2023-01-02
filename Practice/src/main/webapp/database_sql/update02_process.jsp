<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file ="dbconn.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<% 
	request.setCharacterEncoding("utf-8");
	
		String id = request.getParameter("id");
		String passwd = request.getParameter("passwd");
		String name= request.getParameter("name");
		
		
		//Result set, Statement 참조 변수를 null로 초기화
		ResultSet rs = null;
		PreparedStatement pstmt = null; //PreparedStatement 참조변수를 null로 초기화 //준비된 상태
		try{
			//member 테이블의 폼 페이지에서 전송된 id 와 일치하는 레코드를 찾아 id, passwd 필드 값을 가져오도록 SELECT문을 작성
		String sql = "select id, passwd from member where id = ?";
		pstmt = conn.prepareStatement(sql); //PreparedStatment 객체를 생성하도록 작성
		//물음표에 해당하는 값을 설정하도록 setString() 메서드 작성
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			if(rs.next()){ //select문으로 가져온 레코드가 있으면 실행
				String rId = rs.getString("id");
				String rPasswd = rs.getString("passwd");
				
				if(id.equals(rId) && passwd.equals(rPasswd)){
					//member 테이블에서 폼 페이지로부터 전송된 id와 일치하는 레코드를 찾아
					//name 필드 값을 변경하도록 UPDATE문을 작성
					sql  ="update member set name = ? where id = ?";
					pstmt = conn.prepareStatement(sql);
					//물음표에 해당하는 값을 설정하도록 setString() 메서드 작성
					pstmt.setString(1, name);
					pstmt.setString(2, id);
					//update문을 실행하도록 statement 객체의 executeUpdate() 메서드 작성
					pstmt.executeUpdate();
					out.println("Member 테이블을 수정했습니다.");
				} else
					out.println("일치하는 비밀번호가 아닙니다");
			} else
				out.println("Member 테이블에 일치하는 아이디가 없습니다.");
		}catch(SQLException ex){
			out.println("SQLException :" + ex.getMessage());
		} finally{
			if(rs!=null)
				rs.close();
			if(pstmt != null)
				pstmt.close();
			if(conn!=null)
				conn.close();
		}
		%>
</body>
</html>