<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@page import="com.zhang.javabean.File"%>
<%@page import="com.zhang.dao.MysqlAction"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.net.URLEncoder "%>
<%@page import="java.net.URLDecoder "%>
<%@page import="com.zhang.javabean.Booking"%>
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
<head>
	<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
	<title>会议及文件详情</title>
	<script type="text/javascript" src="jquery-2.1.1.min.js"></script>
  	<script type="text/javascript" src="reservationInfo.js"></script>
</head>
<style>
	/*框架*/
	*{
  		margin:0;
  		padding: 0;
  	}
	body{
		background: url('img/mainbg1.png') repeat-x;

	}
	#container{
		height:760px;
		width:1000px;
		margin: 10px auto;
		background: url('img/bg1.jpg') no-repeat;
	
	}
	#header{
		height:134px;
		background: url('img/header.jpg') no-repeat;
	}
	#logo{
		float: left;
		width: 100px;
		height: 100px;
		margin-top: 10px;
		margin-left:40px;
		background: url('img/logo.png') no-repeat;
	}
	#title{
		float: left;
		width: 453px;
		height:75px;
		margin-top: 25px;
		margin-left: 100px;
		background: url('img/title.png') no-repeat;
	}
	#links{
		margin-top: 93px;
		/*width: 300px;*/
		float: left;
		margin-left:45px;
		font-size:16px;
	}
	#links a{
		color:#000;
		padding: 8px;
		margin:-4px;
		font-weight: bold;
		text-decoration: none;
		border:1px solid #11264f;
		background-color: #A6D4F0;
	}
	#links a:hover{
		background-color: #2585a6;
		color:#eee;
	}
	#links a:nth-child(1){
		border-top-left-radius: 20px;
	}
	#links a:nth-child(3){
		border-top-right-radius: 20px;
	}	
	#content{
		height:560px;
		border:1px solid transparent;
		background: url('img/content.png') repeat;
	}
	#bottomDivider{
		height: 5px;
		background: url('img/bottomDivider.jpg') no-repeat;
	}
	#bottom{
		height:55px;
		text-align: center;
		padding-top: 10px;
		background: url('img/bottom.jpg') no-repeat;
	}
	/*框架end*/
	.uploadContainer{
		height: 50px;
		width: 473px;
		border: none;
		border-radius: 25px;
		margin:5px;
		margin-left: 350px;
		background: url('img/uploadFileBtn.png') 0 center no-repeat;
		/*overflow:hidden;*/
		position:relative;
	}
	.uploadContainer:hover{
		background: url('img/uploadFileBtn1.png') 0 center no-repeat;
	}
 	.upfile{
 		position:absolute;
 		top:-200px;
 	}
 	.upFileBtn{
 		width:273px;
 		height:50px;
 		opacity:0;
 		filter:alpha(opacity=0);
 		cursor:pointer;
 	}
 	#upfileResult{
		color:#000;
		font-size: 12px;
		margin-top: 23px;
		margin-left:5px;
		position: absolute;
 	}
	.meetInfo{
		height: 187px;
		background: url('img/meetInfoBg.png') no-repeat;
	}
	.meetInfo>h2{
		position: relative;
		top:10px;
		width: 30%;
		margin-left: 30px;
		color: #388EA5;
	}
	.meetInfo .saveBtn{
		float: right;
		width: 93px;
		height: 30px;
		font-size: 20px;
		color: white;
		margin-top: -19px;
		margin-right: 40px;
		border: none;
		border-radius: 15px;
		background:  #79CD3F;
	}
	.meetInfo .saveBtn:hover{
		background:  #98D768;
	}
	.meetInfoTitle1{
		width: 49%;
		height: 71%;
		margin-top: 20px;
		float:left;
	}
	.meetInfoTitle2{
		width: 49%;
		height: 71%;
		margin-top: 10px;
		float: right;
	}
	.t{
		width: 50px;
		
		font-size: 22px;
		float: left;
	}
	.t1{
		margin-top:40px;
		margin-left: 48px;
	}
	.t2{
		margin-top:40px;
		margin-left: 10px;
	}
	.meetInfoTxt{
		margin-top: 7px;
		padding: 10px;
		resize: none;
		height:72%;
		overflow: auto;
		background: none;
		border: 1px #155B6A solid;
		border-radius: 5px;
		transition: all 0.30s ease-in-out;
 		-webkit-transition: all 0.30s ease-in-out;
 		-moz-transition: all 0.30s ease-in-out;
 		outline:none;
  		font-size: 20px;
 		line-height: 20px;
	}
	.meetInfoTxt:focus{
		border:#35a5e5 1px solid;
 		box-shadow: 0 0 5px rgba(81, 203, 238, 1);
 		-webkit-box-shadow: 0 0 5px rgba(81, 203, 238, 1);
		-moz-box-shadow: 0 0 5px rgba(81, 203, 238, 1);

	}
	.txt1{
		width: 300px;
		margin-left: 45px;
	}
	.txt2{
		width: 320px;
		margin-left: 45px;
	}
	/*tableTitle       */
	.tableTitle{ 
		height: 45px;
		background: url('img/tableTitleBg.png') repeat-y;
	}
	.tableTitle table{
		margin: auto;
        width: 95%;
        height: 100%;
        border-collapse:collapse;
        border-width: 1px;
        font-size: 22px;
		text-align: center;
	}
	.tableTitle tr{
		border-width: 1px;
        border:1px solid #006f86;  
	}
	.tableTitle td{
		border-width: 1px;
        border:1px solid #006f86; 		
	}
	.tableTitle table td:nth-child(1){
		width: 380px;
	}
	.tableTitle table td:nth-child(2),
    .tableTitle table td:nth-child(3),
    .tableTitle table td:nth-child(4){
      width: 142px;
    }
    .tableTitle table td:nth-child(5){
      width: 88px;
    }  
	/*       tableTilte end*/
	.documentTableCont{
		height: 257px;
		padding-top:6px; 
		background: url('img/documentTableConBg.png')no-repeat;
	}
	.documentTableCont1{
		height: 250px;
		width: 945px;
		height: 97%;
		margin:auto;
		overflow: auto;
	}
	table.documentTable{
        margin: auto;
        width: 99%;
        border-collapse:collapse;
        border-width: 1px;
        font-size: 22px;
    }
    table.documentTable tr{
        border-width: 1px;
        border:1px solid #006f86;  
        }
    table.documentTable td{
        border-width: 1px;
        border:1px solid #006f86 ;
        }
    table.documentTable tr:nth-child(2n+1){
        background: #ddd;
        } 
    table.documentTable tr:hover{
    	background: #fbf8e9;
    }   
    .documentTable tbody td:nth-child(1){
     width:400px;
     }
    .documentTable td:nth-child(2),
    .documentTable td:nth-child(3),
    .documentTable td:nth-child(4){
      width: 140px;
    }  
    #docuDownBtn{
    	width: 50px;
    	height: 20px;
    	margin-left: 10px;
    	border: none;
    	background: url('img/docuDownBtn.png') no-repeat;
    }
    #docuDownBtn:hover{
		background: url('img/docuDownBtn1.png') no-repeat;
    } 
    .btnDisabled{ 
   		border: 2px solid #aaa !important;                /*按钮禁用*/
   		background:#d8d8d8 !important ;
  }   
</style>
<body>
	<div id='container'>
		<div id='header'>
			<div id='logo'></div>
			
			<div id="title"></div>
			<div id="links">
				<a onclick="window.open('choosetofutureorhistory.jsp','_parent')" alt="首页">首页</a>
                <a onclick="window.open('reservationInfo.jsp','_parent')" alt="会议室预定">会议室预定</a>
                <a onclick="window.open('documentSearch0.jsp','_parent')" alt="会议历史检索">会议历史检索</a>
			</div>
		</div>
		
			<div id="content">
				<div class="uploadContainer">
					<form  id="form1" method="post" action="FileUploadServlet" enctype="multipart/form-data">	
				        <input type="file" name="upfile" id="upfile" class="upfile" onchange="document.getElementById('upfileResult').innerHTML=this.value"/>
				        <input class="upFileBtn" type="button" value="上传文件" onclick="document.getElementById('upfile').click()" />	    
	    			 	<span class="tip" id="upfileResult">点击按钮上传文件。</span>
    			</div> 
						<div class="meetInfo">
							<h2>会议详情</h2>
							<input type="submit"  id="submit1" value="保存" class="saveBtn"/>
					</form>
							<%
								int	bookingnum = Integer.parseInt(session.getAttribute("conferId").toString());
								MysqlAction mysqlAction = new MysqlAction();
								ArrayList list1 = mysqlAction.getBookingInfobyBookingnum(bookingnum);
								if (!list1.equals("")&&!list1.equals("null")){
				                 	  for(int j = 0;j<list1.size();j++){				                 	  
				                 		 Booking booking = (Booking)list1.get(j);	
				   		                 String timeslot = booking.getTime();
				   		                 System.out.println("信息页timeslot："+timeslot);
				   		                 String[] confertime = timeslot.split(",");
				   		             	 System.out.println("信息页confertime："+confertime);
				   		             	 for(int k=0;k<confertime.length;k++){  		            	
				   		            		 if(confertime[k].equals("1"))
					   		            		confertime[k]="8:00-9:00";
					   		            	 if(confertime[k].equals("2"))
					   		            		confertime[k]="9:00-10:00";
					   		            	 if(confertime[k].equals("3"))
					   		            		confertime[k]="10:00-11:00";
					   		            	 if(confertime[k].equals("4"))
					   		            		confertime[k]="11:00-12:00";
					   		            	 if(confertime[k].equals("5"))
					   		            		confertime[k]="12:00-13:00";
					   		            	 if(confertime[k].equals("6"))
					   		            		confertime[k]="13:00-14:00";
					   		            	 if(confertime[k]=="7")
					   		            		confertime[k]="14:00-15:00";
					   		            	 if(confertime[k].equals("8"))
					   		            		confertime[k]="15:00-16:00";
					   		            	 if(confertime[k].equals("9"))
					   		            		confertime[k]="16:00-17:00";
					   		            	 if(confertime[k].equals("10"))
					   		            		confertime[k]="17:00-18:00";
					   		            	 if(confertime[k].equals("11"))
					   		            		confertime[k]="18:00-19:00";
					   		            	 if(confertime[k].equals("12"))
					   		            		confertime[k]="19:00-20:00";
					   		            	 if(confertime[k].equals("13"))
					   		            		confertime[k]="20:00-21:00";
					   		            	 if(confertime[k].equals("14"))
					   		            		confertime[k]="21:00-22:00";
					   		            	 if(confertime[k].equals("15"))
					   		            		confertime[k]="22:00-23:00";				   		             
				   		             	}
				   		             String confertimeshow = "" ;
				   		             String conferagendashow = "";
				   		             	
				   		             confertimeshow = confertimeshow + confertime[j]+";";
				   		             	 
				   		          	 String conferagenda = booking.getConferAgenda();
				   		             String[] conferagenda1 = conferagenda.split(",");
				   		             for (int m=0;m<conferagenda1.length;m++){
				   		             	conferagendashow = conferagendashow+conferagenda1[m]+"\n";
				   		             }
							%>
							<div class="meetInfoTitle1">
								<div class="t t1">会议<br />信息</div>
								<textarea name="" wrap="physical"  class="meetInfoTxt txt1" cols="37" rows="5" value="">会议名:<%=booking.getConferName()+"\n" %>会议日期:<%=booking.getDate()+";"+confertimeshow +"\n"%>会议类型:<%=booking.getConferType()+"\n"%>会议主题:<%=booking.getConferTheme() %></textarea>
							</div>
							<div class="meetInfoTitle2">				
								<div class="t t2">会议<br />议程</div>
								<textarea name="" wrap="physical" class="meetInfoTxt txt2" cols="37" rows="5" value=""><%=conferagendashow %></textarea>					
							</div>						
						</div>
				<% }%>
			<% }%>
				  
			<div class="tableTitle">
				<table>
					<tr>
						<td>文件名称</td>
						<td>上传者</td>
						<td>上传日期</td>					
						<td>下载</td>
					</tr>				
				</table>
			</div>
			<div class="documentTableCont">
				<div class="documentTableCont1">
					<table class="documentTable">
					<%
						ArrayList list = mysqlAction.getFileInfobyBookingHash(bookingnum);
						System.out.println(list);
						if (!list.equals("")&&!list.equals("null")){
		                 	  for(int i = 0;i<list.size();i++){						
		   		              File file = (File)list.get(i);		
					%>
					<tr>
						<td><%= file.getFilename() %></td>
						<td><%= file.getUploader() %></td>
						<td><%= file.getUploadtime() %></td>
						<td>
					<!--  	<A HREF="download.jsp?path=<%=URLEncoder.encode(getServletContext().getRealPath(file.getFilename()),"GBK")%>">	-->
							<A HREF="download.jsp?path=<%=URLEncoder.encode("C:/conference/file/upload/"+file.getFilename(),"GBK")%>">							
								<input type="button" id="docuDownBtn" value="下载" />
							</A>
						</td>
					</tr>
					<% }%>
				   <% }%>
				</table>

				</div>
			</div>
		  </div>

		<div id="bottomDivider"></div>
		<div id='bottom'>copyright blabla版权所有</div>
	</div>
	<script>
		//下载按钮 禁用
		var oDocuDownBtn=$('#docuDownBtn');
		var isDocuDownBtnDis=false;            ////后台判断
		BtnDisabled(oDocuDownBtn,isDocuDownBtnDis);
		//下载按钮 禁用end
		function BtnDisabled(elem,isBtnDisabled){    
			if(isBtnDisabled){
				elem.attr("disabled", "disabled")//按钮禁用
				elem.addClass("btnDisabled");
			}
			else{
				elem.removeAttr("disabled");//解禁	
			}
		};
	</script>
	<script>
		$("#submit1").click(function(){
			var myUrl='http://localhost:8080/openmeetings;JSESSIONID=A9209B489DA183B3775ED750789EEA64/file.upload?moduleName=videoconf1&publicSID=12345678901234567890123456789012&filename=text%2Edocx&parentFolderId=0&room_id=15&secondid=0&isOwner=0&sid=c202eeb48455d36a4d3993baff5de10e';
			$.ajax({
				url:myUrl,
				method:'POST',
				contentType:'multipart/form-data; boundary=----------Ef1GI3gL6GI3Ij5KM7GI3ei4ei4KM7',
				dataType:'text',
				data:$("#form1").serialize(),
				success:
					function(data){
						//alert(data);
					},
				error:
					function(data){
						//alert(data);
					}
			});
	
		});	
	</script>
</body>
</html>