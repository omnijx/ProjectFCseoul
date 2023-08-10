<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<meta charset="UTF-8">
<script src="JS/jquery-3.7.0.min.js"></script>
<script>
	const settings = {
			async: true,
			crossDomain: true,
			url: 'https://api-football-v1.p.rapidapi.com/v3/players/topscorers?league=292&season=2023',
			method: 'GET',
			headers: {
				'X-RapidAPI-Key': 'e74b5b3e8bmshfa41825a94840f5p12a120jsn586a8ea22fda',
				'X-RapidAPI-Host': 'api-football-v1.p.rapidapi.com'
			}
		};
		$.ajax(settings)
		.done(function(awn) {
   		  console.log(awn.response);
   		 $.ajax({
   		     method: 'post',
   		     url: 'rankingScoreServlet',
   		     traditional: true,
   		     data: {
   		       data: JSON.stringify(awn.response)
   		     },
   		     dataType: 'json',
   		     success: function (res) {
   		    	console.log(res);
   		        if (res.result) {
   		          alert("완료 되었습니다");
   		        }	
   		     }
   		   });
		});
</script>
