<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html>
  <head>
    <meta charset="utf-8">
    <title>MarkerClusterer v3 Speed Test Example</title>
    
    <style>
      body {
        margin: 0;
        padding: 0;
        font-family: Arial;
        font-size: 14px;
      }
      #panel {
        float: left;
        width: 300px;
        height: 550px;
      }
      #map-container {
        margin-left: 300px;
      }
      #map {
        width: 100%;
        height: 550px;
      }
      #markerlist {
        height: 400px;
        margin: 10px 5px 0 10px;
        overflow: auto;
      }
      .title {
        border-bottom: 1px solid #e0ecff;
        overflow: hidden;
        width: 256px;
        cursor: pointer;
        padding: 2px 0;
        display: block;
        color: #000;
        text-decoration: none;
      }
      .title:visited {
        color: #000;
      }
      .title:hover {
        background: #e0ecff;
      }
      #timetaken {
        color: #f00;
      }
      .info {
        width: 200px;
      }
      .info img {
        border: 0;
      }
      .info-body {
        width: 200px;
        height: 200px;
        line-height: 200px;
        margin: 2px 0;
        text-align: center;
        overflow: hidden;
      }
      .info-img {
        height: 220px;
        width: 200px;
      }
    </style>

 <!-- jQuery library -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAOUu60DDyAcyY5lpmQY1go7BuBibCGqhI&callback=speedTest.init"></script>
	<script type="text/javascript" src="./src/markerclusterer.js"></script>
    <script src="data.json"></script>
    <script src="speedTest.js"></script>

    <script>
      google.maps.event.addDomListener(window, 'load', speedTest.init);
    </script>
  </head>

  <body>
    <div id="panel">
      <h3>An example of MarkerClusterer v3</h3>

      <div>
        <input type="checkbox" checked="checked" id="usegmm"/>
        <span>Use MarkerClusterer</span>
      </div>

      <div>
        Markers:
        <select id="nummarkers">
          <option value="19" selected="selected">20</option>
          <option value="50">50</option>
          <option value="100">100</option>
          <option value="500">500</option>
          <option value="1000">1000</option>
        </select>

        <span>Time used: <span id="timetaken"></span> ms</span>
      </div>

      <strong>Marker List</strong>
      <div id="markerlist">

      </div>
    </div>
    <div id="map-container">
      <div id="map"></div>
    </div>
  </body>
</html>
