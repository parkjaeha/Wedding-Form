<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8"/>
<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
<meta name="viewport" content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width"/>
<title>KakaoStory Share Button Demo - Kakao JavaScript SDK</title>
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>

</head>
<body>
<div id="kakaostory-share-button"></div>
<script type='text/javascript'>
  //<![CDATA[
    // 사용할 앱의 JavaScript 키를 설정해 주세요.
    Kakao.init('0548d6b9774e1a325fd1e7d81807ddb8');
    // 스토리 공유 버튼을 생성합니다.
    Kakao.Story.createShareButton({
      container: '#kakaostory-share-button',
      url: 'https://www.naver.com',
      text: ''
    });
  //]]>
</script>

</body>
</html>