
uint8_t html[]=
"<!DOCTYPE html>\
<html>\
<head> \
<title>IoT Device</title>\
<script type = 'text/javascript' src = 'https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js'></script>\
<script type = 'text/javascript' src = 'logic.js'></script>\
 <link type = 'text/css' href = 'style.css' rel = 'stylesheet'> \
</head>\
<body>\
    <div class=\"page\">\
<img class=\"img-responsive\" src=\"https://cdn.mikroe.com/themes/simplicity/img/header/links/mikroelektronika/mikroe-white.png\">\
<center><h1>Kontrola uredjaja</h1></center>\
<form name=\"mojaforma\" METHOD=\"POST\" >\
<span class=\"power-on\">Power switch 1</span>\
    <div class=\"onoffswitch\">\
    <input type=\"checkbox\" name=\"onoffswitch\" class=\"onoffswitch-checkbox\" id=\"myonoffswitch\" onclick=\"funkcijaRel1()\">\
    <label class=\"onoffswitch-label\" for=\"myonoffswitch\">\
    <span class=\"onoffswitch-inner\"></span>\
    <span class=\"onoffswitch-switch\"></span>\
    </label>\
</div>\
</form>\
<br><br>\
<form name=\"mojaforma2\" METHOD=\"POST\" >\
 <span class=\"power-on\">Power switch 2</span>\
    <div class=\"onoffswitch\">\
        <input type=\"checkbox\" name=\"onoffswitch2\" class=\"onoffswitch-checkbox\" id=\"myonoffswitch2\" onclick=\"funkcijaRel2()\">\
        <label class=\"onoffswitch-label\" for=\"myonoffswitch2\">\
             <span class=\"onoffswitch-inner\"></span>\
            <span class=\"onoffswitch-switch\"></span>\
        </label>\
</div>\
</form>\
</div>\
</body>\
</html>";

uint8_t layout[]=
"body { background: #58595b;}\
.page { width:1170px; margin: auto; background:#58595b; ; color:  #ffcb05} \
.power-on {font-size: 20 px; font-weight: bold; margin-bottom: 15px;}\
.img-responsive { display: block;   margin-left: auto;    margin-right: auto;  }\
h1 {margin: 50px}\
body > div > form:nth-child(6) { position: absolute;  float: right; top: 183px; right: 500px; }\
.onoffswitch {  \
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
var str; \
function funkcijaRel1()\
{\
        relay1_state=1-relay1_state;\
        str='_WEBSERVER-RELAY_R1-'+String(relay1_state);\
        $.get('output.cgi',\
        {\
                text: str\
        });\
}\
function funkcijaRel2()\
{\
        relay2_state=1-relay2_state;\
        str='_WEBSERVER-RELAY_R2-'+String(relay2_state);\
        $.get('output.cgi',\
        {\
                text: str\
        });\
}";