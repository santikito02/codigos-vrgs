<%@page import="java.sql.*"%>
<%
	//String db = request.getParameter("db");
	String db = "concurso";
	String user 	= "USER2";
	String passwd	= "CAUser";
	
	Connection conn = null;
	Statement stmt	= null;
	ResultSet rs	= null;
	
	String sql = null;
	Integer sem = null;
	String qs = null;
	String re = null;
	String reAl = null;
	Integer reid = null;
	String userna = null;
	
	HttpSession sesion = request.getSession();
	Integer id = (Integer)sesion.getAttribute("idr");
	
	if(id == 25)
	{
		sem = 1;
	}
	else if (id == 26)
	{
		sem = 2;
	}
	else if (id == 27)
	{
		sem = 3;
	}
	
	try
	{
		Class.forName("org.gjt.mm.mysql.Driver");
		conn = DriverManager.getConnection("jdbc:mysql://localhost/" + db, user, passwd);
		
		stmt = conn.createStatement();
		
		sql = "SELECT pr.resp_al, p.pregunta, p.respuesta, pr.respuesta_id, u.username FROM preg_respon pr, preguntas p, usuarios u WHERE pr.resp_al IS NOT NULL AND pr.pregunta_id = p.pregunta_id AND pr.calificacion IS NULL AND p.semestre_id =" + sem + " AND pr.hora_resp IS NOT NULL AND pr.user_id = u.user_id";
		
		rs = stmt.executeQuery(sql);
		
		if(rs.next());
		{
			qs = rs.getString("pregunta");
			re = rs.getString ("respuesta");
			reAl = rs.getString("resp_al");
			reid = rs.getInt("respuesta_id");
			userna = rs.getString("username");
			
			sesion.setAttribute("reid", reid);
			
			out.println("<!-- Cuadro de pregunta --> <div type=\"text\" id=\"pregunta\" style=\"position: absolute;width: 26%;height: 40%;left: 36.5%;top: 37%;background: #E0E0E0;border: 3px solid #009945;box-sizing: border-box; font-family: Roboto Slab;font-style: normal;font-weight: normal;font-size: 15px;line-height: 106px;\">" + qs + "</div><h1 style=\"position:absolute;width: 1004px;height: 106px;left: 44%;top: 26%;font-family: Roboto Slab;font-style: normal;font-weight: normal;font-size: 38px;line-height: 106px;opacity: 0.5;\">Pregunta</h1><!-- Cuadro respuesta alumno --><div type=\"text\" id=\"ra\" style=\"position: absolute;width: 26%;height: 12%;left: 65.8%;top: 65%;background:#E0E0E0;border: 3px solid #009945;box-sizing: border-box; font-family: Roboto Slab;font-style: normal;font-weight: normal;font-size: 15px;line-height: 106px;\">" + reAl + "</div><h1 style=\"position:absolute;width: 25%;height: 11%;left: 69%;top: 72.5%;font-family: Roboto Slab;font-style: normal;font-weight: normal;font-size: 38px;line-height: 106px;opacity: 0.5;\">Respuesta alumno</h1><!-- Cuadro respuesta correcta --><div type=\"text\" id=\"rc\" style=\"position: absolute;width: 26%;height: 12%;left: 7%;top: 65%;background: #E0E0E0;border: 3px solid #009945;box-sizing: border-box; font-family: Roboto Slab;font-style: normal;font-weight: normal;font-size: 15px;line-height: 106px;\">" + re + "</div><h1 style=\"position:absolute;width: 1004px;height: 106px;left: 9%;top: 72.5%;font-family: Roboto Slab;font-style: normal;font-weight: normal;font-size: 38px;line-height: 106px;opacity: 0.5;\">Respuesta correcta</h1><!-- Cuadro username --><div type=\"text\" id=\"us\" style=\"position: absolute;width: 8%;height: 12%;left: 25%;top: 50%;background: #E0E0E0;border: 3px solid #009945;box-sizing: border-box; font-family: Roboto Slab;font-style: normal;font-weight: normal;font-size: 15px;line-height: 106px;\">" + userna + "</div><h1 style=\"position:absolute;width: 1004px;height: 106px;left: 25%;top: 39%;font-family: Roboto Slab;font-style: normal;font-weight: normal;font-size: 38px;line-height: 106px;opacity: 0.5;\">Grupo</h1>");
		}
				
		rs.close();
		
	}
	catch(SQLException e)
	{
		out.println("SQLException caught: " + e.getMessage());
	}
	finally
	{
		try{rs.close();} catch(Exception e){}
		try{stmt.close();} catch(Exception e){}
		try{conn.close();} catch(Exception e){}
	}
%>