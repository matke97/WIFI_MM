
uint8_t html[]=
"<!DOCTYPE html>\
<html>\
<head> \
<title>IoT Device</title>\
<script type = 'text/javascript' src = 'https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js'></script>\
<script type = 'text/javascript' src = 'logic.js'></script>\
 <link   type = 'text/css'        href = 'layout.css' rel = 'stylesheet'>\
</head>\
<body>\
<center><h3>Kontorola uredjaja</h3></center>\
<form name=\"mojaforma\" METHOD=\"POST\" >\
Relay1: <input type=\"button\" name=\"btn1\" value=\"Promeni stanje\" onclick=\"funkcijaRel1()\">\
</form>\
<div class=\"onoffswitch\">\
    <input type=\"checkbox\" name=\"onoffswitch\" class=\"onoffswitch-checkbox\" id=\"myonoffswitch\" onclick=\"funkcijaRel1()\">\
    <label class=\"onoffswitch-label\" for=\"myonoffswitch\">\
    <span class=\"onoffswitch-inner\"></span>\
    <span class=\"onoffswitch-switch\"></span>\
    </label>\
</div>\
</body>\
</html>";

uint8_t layout[]=
".onoffswitch {  \
    position: relative; width: 82px;\
    -webkit-user-select:none; -moz-user-select:none; -ms-user-select: none;\
}\
.onoffswitch-checkbox {\
    display: none;\
}\
.onoffswitch-label {\
    display: block; overflow: hidden; cursor: pointer;\
    border: 2px solid #999999; border-radius: 50px;\
}\
.onoffswitch-inner {\
    display: block; width: 200%; margin-left: -100%; \
    transition: margin 0.3s ease-in 0s;\
}\
.onoffswitch-inner:before, .onoffswitch-inner:after {\
    display: block; float: left; width: 50%; height: 31px; padding: 0; line-height: 31px;\
    font-size: 14px; color: white; font-family: Trebuchet, Arial, sans-serif; font-weight: bold;\
    box-sizing: border-box;\
}\
.onoffswitch-inner:before { \
    content: \"ON\";\
    padding-left: 10px;\
    background-color: #00FFFF; color: #FFFFFF;\
}\
.onoffswitch-inner:after {\
    content: \"OFF\";\
    padding-right: 10px;\
    background-color: #000000; color: #FFFFFF;\
    text-align: right;\
}\
.onoffswitch-switch {\
    display: block; width: 27px; margin: 2px;\
    background: #FFFFFF;\
    position: absolute; top: 0; bottom: 0;\
    right: 47px;\
    border: 2px solid #999999; border-radius: 50px;\
    transition: all 0.3s ease-in 0s;\
}\
.onoffswitch-checkbox:checked + .onoffswitch-label .onoffswitch-inner {\
    margin-left: 0;\
}\
.onoffswitch-checkbox:checked + .onoffswitch-label .onoffswitch-switch {\
    right: 0px;\
} ";

uint8_t js[]="\
var relay1_state=0;\
var relay2_state=0;\
function funkcijaRel1()\
{\
        relay1_state=1-relay1_state;\
        $.get('output.cgi',\
        {\
                text: '_WEBSERVER-RELAY_R1-1'\
        });\
}";