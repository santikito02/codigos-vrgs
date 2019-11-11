<%@page import="java.sql.*"%>
<% 
//String db = request.getParameter("db");
	String db = "concurso";
	String user 	= "USER";
	String passwd	= "CAUser";
	
	Connection conn = null;
	Statement stmt	= null;
	ResultSet rs	= null;
	
	try
	{
		Class.forName("org.gjt.mm.mysql.Driver");
	}	
%>