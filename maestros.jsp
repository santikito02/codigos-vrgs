<%@page import="com.anahuac.garibaldi.utils.LocalFunctions"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%boolean child = false;%>
<%@include file="/fragments/validate.jspf"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html lang="es-mx" xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>Concurso Académico | Maestros</title>
	<meta http-equiv="refresh" content="5">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="css/principal.css" rel="stylesheet" type="text/css" />
<link href="css/bootstrap.css" rel="stylesheet" type="text/css" />
<link href="css/bootstrap.min.css" rel="stylesheet" type="text/css" />
<link href="css/bootstrap-grid.css" rel="stylesheet" type="text/css" />
<link href="css/bootstrap-reboot.min.css" rel="stylesheet" type="text/css" />
<link href="css/bootstrap-grid.min.css" rel="stylesheet" type="text/css" />
<link href="css/bootstrap-reboot.css" rel="stylesheet" type="text/css" />
<script src="js/aks.main.js"></script>
<script src="js/aks.ajax.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script>
	$(document).ready(function(){
		setinterval(function(){
			$('#pregunta').load('maestros.jsp');
		},5000);
	})
</script>
<script id="pregunta">
//local functions
var theForm		= null;
var theFilters	= null;
var page		= null;

//first function onLoad, modify as needed but do not delete the function
function onLoad()
{
	theForm		= document.frmMain;
	theFilters	= document.frmFilters;
	page	= '<%=LocalFunctions.getPageNoExt(request.getRequestURI())%>';
	
	browse();
	
	//TODO: cargar timer
}

//function to responde to the checkEnter global function
function validate()
{
	return false;
	//browse();
}
</script>
</head>

<body onload="onLoad();">
    <!-- Barra superior -->
  	 <div style="position: absolute;width: 100%;height: 13.06%;background: #009945;mix-blend-mode: normal;">
      <h1 style="position:absolute;height: 13.8%;left: 2.2%;top: 0%;font-family: Roboto Slab;font-style: normal;font-weight: normal;font-size: 80px;color: #FFFFFF;">Concurso Académico 2K19</h1>
    </div>
	<!-- Barra inferior -->
   	<div style="position: absolute;width: 100%;height: 13.06%;bottom: 0%;background: #009945;mix-blend-mode: normal;">
      <h1 style="position:absolute;height: 13.8%;right: 0%;bottom: 75%;font-family: Roboto Slab;font-style: normal;font-weight: normal;font-size: 375%;color: #FFFFFF;">Ingenierías XXVIII</h1></div>


    <!-- Texto maestros -->
    <h1 style="position:absolute;width: 100px;height: 106px;left: 41%;top: 12%;font-family: Roboto Slab;font-style: normal;font-weight: normal;font-size: 60px;line-height: 106px;">Maestros</h1>

	<!-- Workarea -->
    <div class="container">
	    <div class="main-content">
	      <form action="" method="post" name="frmFilters" id="frmFilters" onkeydown="checkEnter();">
	      </form>
	      <form action="" method="post" name="frmMain" id="frmMain" onkeydown="checkEnter();">
	        <div id="workarea"></div>
	      </form>
	    </div>
	</div>

    <!-- Buenos cristianos -->
    <img src="cruz.png" alt="cruz" style="position: absolute;width:16%;height:45%;left:10%;top:18%;opacity: 0.6;">
    
    <!-- Honrados ciudadanos -->
    <img src="bchc.png" alt="bchc" style="position: absolute;width:22%;height:40%;left:68%;top:21%;opacity: 0.6;">

    <!-- Boton correcto -->
    <form action="Correcta.jsp" method="post">
      <div id="ss" name="ss"></div>
       <button  type="submit" style="position: absolute;width: 2.3%;height: 4.9%;left: 45%;top: 79%;background: #009945;border: 3px solid #009945;box-sizing: border-box; font-family: Roboto Slab;font-style: normal;font-weight: normal;font-size: 15px;line-height: 106px;cursor: pointer;border-radius: 8px;"></button>
    </form>
    
    <!-- Boton incorrecto -->
    <form action="Incorrecta.jsp" method="post">
      <div id="ss" name="ss"></div>
    <button id="mal" type="submit" style="position: absolute;width: 2.3%;height: 4.9%;left: 51%;top: 79%;background: #FF0000;border: 3px solid #FF0000;box-sizing: border-box; font-family: Roboto Slab;font-style: normal;font-weight: normal;font-size: 15px;line-height: 106px;cursor: pointer;border-radius: 8px;"></button>
    </form>

   </body>
</html>
