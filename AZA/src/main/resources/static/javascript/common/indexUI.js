
function changeIframeUrl(url)
{
	 $("#mainFrame").src = url;
}
// Parent
$(function() {
	$('.left_nav').on('click', function(e) {
		var url = e.target.dataset.url;
		console.log(url);
		$("#mainFrame").attr('src',url)
	})
	
	
	
	
})