/* 

custom JavaScript

implementing JS library as of 02/13/19: 
Latest jQuery: 3.3.1
https://jquery.com/

Copyright (C) Mark Milligan - All Rights Reserved
Unauthorized copying of this file, via any medium is strictly prohibited
Proprietary and confidential
Written by Mark Milligan <markmilligan@me.com>, 2019

*/

function openPostTextModal() {

    $(document).on('click', '[data-text]', function(e) {


        var jqueryobject = $(this);

        //var title = jqueryobject[0].innerText;
        //var text = jqueryobject.prev()[0];
        //var title = jqueryobject.find("[data-title]");
        //var text = jqueryobject.find("[data-text]");
        //var title = jqueryobject.find("[ptitle]");
        //var title = jqueryobject;

        //console.log(jqueryobject[0].innerText);
        //console.log(jqueryobject.parent().prev().children()[0].innerText);
        //console.log(title[0].innerText);
        //console.log(text[0].innerText);

        $('#post-title').text("Post Title: " + jqueryobject.parent().prev().children()[0].innerText); 
        $('#post-product').text("Product: " + jqueryobject.parent().prev().prev().children()[0].innerText); 
        $('#post-text').text("Post Text: " + jqueryobject[0].innerText);
        $('#post-author').text("User: " + jqueryobject.parent().next().next().children()[0].innerText); 
        $('#post-notes').text("Resolution: " + jqueryobject.parent().next().children()[0].innerText); 

        $('.modal').modal();
        $('.modal').modal({ keyboard: false });  // initialized with no keyboard
        $('.modal').modal('show');

    });

}

function productAC() {

var substringMatcher = function(strs) {
  return function findMatches(q, cb) {
    var matches, substringRegex;

    // an array that will be populated with substring matches
    matches = [];

    // regex used to determine if a string contains the substring `q`
    substrRegex = new RegExp(q, 'i');

    // iterate through the pool of strings and for any string that
    // contains the substring `q`, add it to the `matches` array
    $.each(strs, function(i, str) {
      if (substrRegex.test(str)) {
        matches.push(str);
      }
    });

    cb(matches);
  };
};

var products = ['Darwin','DeepNLP','SparkPredict','DeepArmor'];


$('.typeahead').typeahead({
 minLength: 0,
 hint: true,
 highlight: true
}, {
    name: 'products',
    source: substringMatcher(products)   
}


);


$('.typeahead').bind('typeahead:select', function(ev, suggestion, data_set) {

         console.log('typeahead selection: ' + suggestion.name);

});

};


// deprecated for Rails FPR
function upVote(id) {

        controllerurl='/posts/upvote';

        console.log("before UPVOTE call:" + controllerurl + " for Post Id " + id);

        $.ajax({    url: controllerurl,
                    type: 'post',
                    dataType: 'json',
                    data: { id: id }

        }).done(function(data,textStatus, jqXHR) {
            console.log("upvote remote call successful with returned value: " + jqXHR.responseText);
        })
        .fail(function(data,textStatus, jqXHR) {
            console.log("upvote failed");  
        });


};

// deprecated for Rails FPR
function unVote(id) {

        controllerurl='/posts/unvote';

        console.log("before UNVOTE call:" + controllerurl + " for Post Id " + id);

        $.ajax({    url: controllerurl,
                    type: 'post',
                    dataType: 'json',
                    data: { id: id }

        }).done(function(data,textStatus, jqXHR) {
            console.log("unvote remote call successful with returned value: " + jqXHR.responseText);
        })
        .fail(function(data,textStatus, jqXHR) {
            console.log("unvote failed");  
        });


};


// after DOM is loaded, run these jQuery commands
$(document).ready(function() {

    //console.log( "Ranker ready!" );

    openPostTextModal();

    // deactivated typeahead for product feature
    //productAC();


});