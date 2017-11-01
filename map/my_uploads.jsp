<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html>
  <head>
    <title>My Uploads</title>
    <link rel="stylesheet" type="text/css" href="my_uploads.css">

  </head>

  <body>
  	
    <div id="login-container" class="pre-auth">
      이 애플리케이션을 사용하려면 YouTube 계정에 액세스해야합니다.
      <a href="#" id="login-link">인증하기</a>
    </div>
    <div id="video-container"></div>
    <div class="button-container">
      <button id="prev-button" class="paging-button" onclick="previousPage();">Previous Page</button>
      <button id="next-button" class="paging-button" onclick="nextPage();">Next Page</button>
    </div>
    
<button id ="btn">Click me to hide paragraphs</button>

<script type="text/javascript">
//Define some variables used to remember state.
var playlistId, nextPageToken, prevPageToken;

var title;
var videoId;
//After the API loads, call a function to get the uploads playlist ID.
//유트브 인증 후 id 불러오는것
function handleAPILoaded() {
	requestUserUploadsPlaylistId();
}


//Call the Data API to retrieve the playlist ID that uniquely identifies the
//list of videos uploaded to the currently authenticated user's channel.

//요청한 유저의 id를 토대로 list 불러오는것 
function requestUserUploadsPlaylistId() {
	// See https://developers.google.com/youtube/v3/docs/channels/list
	var request = gapi.client.youtube.channels.list({
		mine: true,
		part: 'contentDetails'
	});
	request.execute(function(response) {
		playlistId = response.result.items[0].contentDetails.relatedPlaylists.uploads;
		requestVideoPlaylist(playlistId);
	});
}

//Retrieve the list of videos in the specified playlist.
function requestVideoPlaylist(playlistId, pageToken) {
	$('#video-container').html();
	var requestOptions = {
			playlistId: playlistId,
			part: 'snippet',
			maxResults: 10
	};
	if (pageToken) {
		requestOptions.pageToken = pageToken;
	}
	var request = gapi.client.youtube.playlistItems.list(requestOptions);
	request.execute(function(response) {
		// Only show pagination buttons if there is a pagination token for the
		// next or previous page of results.
		nextPageToken = response.result.nextPageToken;
		var nextVis = nextPageToken ? 'visible' : 'hidden';
		$('#next-button').css('visibility', nextVis);
		prevPageToken = response.result.prevPageToken
		var prevVis = prevPageToken ? 'visible' : 'hidden';
		$('#prev-button').css('visibility', prevVis);

		var playlistItems = response.result.items;
		if (playlistItems) {
			$.each(playlistItems, function(index, item) {
				displayResult(item.snippet);
			});
		} else {
			$('#video-container').html('Sorry you have no uploaded videos');
		}
	});
}
//Create a listing for a video.
function displayResult(videoSnippet) {
	title = videoSnippet.title;
	videoId = videoSnippet.resourceId.videoId;
	$('#video-container').append(
		"<p>"+"<a href='./play.jsp?videoId="+videoId+"'>"+title+"</a></p>"		
		
	
	);
	
	
	
	
	alert("videoId : "+videoId);






}

//Retrieve the next page of videos in the playlist.
function nextPage() {
	requestVideoPlaylist(playlistId, nextPageToken);
}

//Retrieve the previous page of videos in the playlist.
function previousPage() {
	requestVideoPlaylist(playlistId, prevPageToken);
}





function colorBg(){
	alert("ID"+playlistId);	
}
window.onload=function(){
	
	var  btn4 = document.getElementById("btn");
	btn4.onclick=function(){colorBg();}
}

</script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.8.2/jquery.min.js"></script>
<script type="text/javascript" src="auth.js"></script>
<script src="https://apis.google.com/js/client.js?onload=googleApiClientReady"></script>

    
  </body>
</html>