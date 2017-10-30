<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <title>Google Calendar API Quickstart</title>
    <meta charset='utf-8' />
  
  <script type="text/javascript">
  
  
//Google api console clientID and apiKey 

var clientId = '252751we734600-se6610ol8twerwern886jj7gc5m2ugaai.apps.googleuserecontent.com';
var apiKey = 'AIzaSyCnk5CDEX3Pvwerwerwe0OpnVf4eW_Lmeere80';

// enter the scope of current project (this API must be turned on in the Google console)
  var scopes = 'https://www.googleapis.com/auth/calendar';


//OAuth2 functions
    function handleClientLoad() {
          gapi.client.setApiKey(apiKey);
          window.setTimeout(checkAuth, 1);
       }

//To authenticate
 function checkAuth() {
   gapi.auth.authorize({ client_id: clientId, scope: scopes, immediate: true }, handleAuthResult);
       }

//This is the resource we will pass while calling api function
var resource = {
           "summary": "My Event",
           "start": {
               "dateTime": today
           },
           "end": {
               "dateTime": twoHoursLater
           },
           "description":"We are organizing events",
           "location":"US",
           "attendees":[
           {
                   "email":"attendee1@gmail.com",
                   "displayName":"Jhon",
                   "organizer":true,
                   "self":false,
                   "resource":false,
                   "optional":false,
                   "responseStatus":"needsAction",
                   "comment":"This is my demo event",
                   "additionalGuests":3
                   
           },
           {    
               "email":"attendee2@gmail.com",
                   "displayName":"Marry",
                   "organizer":true,
                   "self":false,
                   "resource":false,
                   "optional":false,
                   "responseStatus":"needsAction",
                   "comment":"This is an official event",
                   "additionalGuests":3
           }
           ],
       };

function makeApiCall(){
gapi.client.load('calendar', 'v3', function () { // load the calendar api (version 3)
               var request = gapi.client.calendar.events.insert
               ({
                   'calendarId': '24tn4fht2tr6m86efdiqqlsedk@group.calendar.google.com', 
//calendar ID which id of Google Calendar where you are creating events. this can be copied from your Google Calendar user view.

                   "resource": resource 	// above resource will be passed here
               });                
}
  
  
  </script>
  
  </head>
  <body>
    <p>Google Calendar API Quickstart</p>

<button id="btnCreateEvents" class="btn btn-primary" onclick="makeApiCall();">
                    Create Events</button>  

<div id="divifm">
                    <iframe id="ifmCalendar" 

                    src="https://www.google.com/calendar/embed?
                    height=550&amp;wkst=1&amp;bgcolor=%23FFFFFF&
                    amp;src=24tn4fht2sssdssfdiqqlsedk%40group.calendar.google.com&
                    amp;color=%238C500B&amp;ctz=Asia%2FCalcutta"

                        style="border-width: 0" width="950" 

                        height="520" frameborder="0" scrolling="no">
                    </iframe>
                </div> 

  </body>
</html>
