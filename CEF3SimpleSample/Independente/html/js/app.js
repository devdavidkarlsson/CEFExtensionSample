
$(document).ready(function() {
    $('.btn1').click(function() {
        window.app.ChangeTextInJS('first button!');
    });
                  
    $('.btn2').click(function() {
        window.app.ChangeTextInJS('second button!');
                     nextTrack();
    });
                  
                  

});

function ChangeText(text) {
    $('#text').html(text);
}


function nextTrack(){


}

function jsoncallback(data) {
    alert(data);
}