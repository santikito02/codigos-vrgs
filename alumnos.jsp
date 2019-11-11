<%@page import="com.anahuac.garibaldi.utils.LocalFunctions"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%boolean child = false;%>
<%@include file="/fragments/validate.jspf"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html lang="es-mx" xmlns="http://www.w3.org/1999/xhtml">
	<meta http-equiv="refresh" content="15">
   <head>
       <title>Concurso academico | Alumnos</title>
       <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="css/principal.css" rel="stylesheet" type="text/css" />
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
/*
	$(document).ready(function(){
		setinterval(function(){
			$('#pregunta').load('alumnos.jsp');
		},5000);
	})
*/
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
	
	//console.log("aqui onLoad!");
	browseLocal();
}

function browseLocal(frmAction, keyId)
{
	if (frmAction == null) frmAction = '';
	if (keyId == null) keyId = '';
	
	//console.log('browseLocal');
	
	var url = page + 'Browse.jsp';
	
	var callback = fillContainer;
	var sndcallback	= test2CallBack;
	
	var ai = new AJAXInteraction(url, callback, 'workarea', sndcallback);

	var parameters = '';
	parameters	+= 'frmAction=' + encodeL(frmAction);
	parameters	+= '&keyId=' + encodeL(keyId);
	//parameters += readFormParams(theFilters);
	//parameters += readFormParams(theForm);
	
	//Logger.debug("parametros para ajax [" + parameters + "]");

	ai.doPost(parameters);
}

function test2CallBack()
{
	var isCuadroRespVisible = document.getElementById('isCuadroRespVisible');
	
	if (isCuadroRespVisible == null)
	{
		console.log('ocultar cuadro');
		toggleBox('cuadro_resp', false);
	}
	else
	{
		console.log('mostrar cuadro');
		toggleBox('cuadro_resp', true);
	}
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
   <script>
   </script>
    <!-- Barra superior -->
  	 <div style="position: absolute;width: 100%;height: 13.06%;background: #009945;mix-blend-mode: normal;">
   		<h1 style="position:absolute;height: 13.8%;left: 2.2%;bottom:90% ;font-family: Roboto Slab;font-style: normal;font-weight: normal;font-size: 80px;line-height: 106px;color: #FFFFFF;">Concurso Académico 2K19</h1>
   	</div>

    <!-- Barra inferior -->
   	<div style="position: absolute;width: 100%;height: 13.06%;bottom: 0%;background: #009945;mix-blend-mode: normal;">
      <h1 style="position:absolute;height: 13.8%;left: 50%;bottom: 70%;font-family: Roboto Slab;font-style: normal;font-weight: normal;font-size: 375%;color: #FFFFFF;">Ingenierías XXVIII</h1></div>

    <!-- Texto maestros -->
    <h1 style="position:absolute;width: 1004px;height: 106px;left: 558px;top: 80px;font-family: Roboto Slab;font-style: normal;font-weight: normal;font-size: 60px;line-height: 106px;">Alumnos</h1>

    <!-- Workarea -->
    <div class="container">
	    <div class="main-content">
	      <form action="" method="post" name="frmFilters" id="frmFilters" onkeydown="checkEnter();">
	      </form>
	      <form action="" method="post" name="frmMain" id="frmMain" onkeydown="checkEnter();">
	        <div id="workarea" position="relative"></div>
	      </form>
	    </div>
	</div>
    
    <!-- Input y Button -->
    <div id="cuadro_resp">
	    <form action = "UpRespAl.jsp" method = "post">
	    	<!-- Cuadro respuesta --> 
	    	<input type="Texto" id="inp" name = "inp" style="position: absolute;width: 100px;height: 100px;left: 545px;top: 380px;background: #E0E0E0;border: 3px solid #009945;box-sizing: border-box;" placeholder="Respuesta"></input> 
	    	<!-- Boton de enviar -->  
	    	<button type="submit" style="position: absolute;width: 100px;height: 100px;left: 675px;top: 380px ;" class="btn btn-outline-success"> Enviar respuesta</button>
		</form>
	</div>

<div id ="prueba">
    <!-- Buenos cristianos -->
    <img src="cruz.png" alt="cruz" style="position: absolute;width:18%;height:46%;left:5%;top:26%;opacity: 0.6;">
    
    <!-- Honrados ciudadanos -->
    <img src="bchc.png" alt="bchc" style="position: absolute;width:23%;height:50%;left:72.5%;top:24.32%;opacity: 0.6;">
</div>

   </body>
</html>