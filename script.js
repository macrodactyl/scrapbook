var processingInstance = undefined;

var regexSearch_size = /size ?\( ?(\w*), ?(\w*), ?(\w*) ?\) ?;/;
var regexReplace_size = "size(window.innerWidth, window.innerHeight, $3);";

var regexSearch_fullScreen = /fullScreen\(\);/;
var regexReplace_fullScreen = "size(window.innerWidth, window.innerHeight);";

loadSketch = function(code) {

    if (typeof processingInstance !== 'undefined') {
        processingInstance.exit();
    }

    // remove existing canvas element and replace with afresh one.
    // this is necessary when switching between 2d and 3d - using the same canvas
    // causes an error.
    $('#mysketch').remove();
    $('#container').append('<canvas id="mysketch"></canvas>');

    var code = code.replace(regexSearch_size, regexReplace_size);
    code = code.replace(regexSearch_fullScreen, regexReplace_fullScreen);
    code = Processing.compile(code)

    var canvas = $('#mysketch')[0];

    processingInstance = new Processing(canvas, code);
}

fillDropDown = function(sketchList) {
    for (var i = 0; i < sketchList.length; i++) {
        $('#sketchlist').append($('<option>', {
            value: sketchList[i].name,
            text: sketchList[i].name
        }));
    }
}

$(document).ready(function(){

    // populate the dropdown
    $.ajax({
        url : "https://api.github.com/repos/macrodactyl/scrapbook/contents/scrapbook",
        success: fillDropDown
    });

    // load a new sketch upon dropdown change
    $('#sketchlist').change(function(){
        var sketchName = $('#sketchlist option:selected').val();
        console.log(sketchName);

        $.ajax({
            url : "./scrapbook/" + sketchName + "/" + sketchName + ".pde",
            success : loadSketch
        });        
    });

    // select the first sketch from the dropdown
    $('#sketchlist > option:eq(0)').prop('selected', true);
});
