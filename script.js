var regexSearch = /size ?\( ?(\w*), ?(\w*), ?(\w*) ?\) ?;/;
var regexReplace = "size(window.innerWidth, window.innerHeight, $3);"

loadSketch = function(code) {
    processingCode = code;
    updatedCode = processingCode.replace(regexSearch, regexReplace);
    compiledCode = Processing.compile(updatedCode)

    canvas = document.getElementById('mysketch');

    processingInstance = new Processing(canvas, compiledCode);
}

$(document).ready(function(){

    // import GitHub from 'github-api';

    // var gh = new GitHub({
    //    username: 'FOO',
    //    // password: 'NotFoo'
    //    /* also acceptable:
    //       token: 'MY_OAUTH_TOKEN'
    //     */
    // });

    $.ajax({
        url : "./scrapbook/tails_3d/tails_3d.pde",
        success : loadSketch
    });
});
