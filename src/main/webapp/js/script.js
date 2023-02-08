
function doLike(pid , uid){
	console.log(pid +"," + uid);
	
	const d = {
		uid,
		pid,
		operation : 'like'
	}
	
	$.ajax({
		url:'LikeServlet',
		data : d,
		success : function (data , status , jqXHR){
			console.log(data);
		},
		error : function(jqXHR , status , errorThrown){
			console.log(data);
		}
	})
}