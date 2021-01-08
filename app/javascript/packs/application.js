// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.
require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")
require('./nested-forms/addFields')
require('./nested-forms/removeFields')
// require("jquery")
// require("swiper")
// require("select2")
// require("bootstrap")
require("trix")
require("@rails/actiontext")

import "../stylesheets/application";





//document.getElementById('choice').innerHTML = options;

// document.addEventListener("ready turbolinks:load", function() {
//     $(function () {
//         $('[data-toggle="tooltip"]').tooltip()
//         $('[data-toggle="popover"]').popover()
//     })
// })

// document.addEventListener('DOMContentLoaded', function () {
//   var stepper = new Stepper(document.querySelector('.bs-stepper'))
// })

(function ($) {
  // "use strict";

  // $(function() {
	
  //   $(document).on({
  //     mouseover: function(event) {
  //       $(this).find('.far').addClass('star-over');
  //       $(this).prevAll().find('.far').addClass('star-over');
  //     },
  //     mouseleave: function(event) {
  //       $(this).find('.far').removeClass('star-over');
  //       $(this).prevAll().find('.far').removeClass('star-over');
  //     }
  //   }, '.rate');
  
  
  //   $(document).on('click', '.rate', function() {
  //     if ( !$(this).find('.star').hasClass('rate-active') ) {
  //       $(this).siblings().find('.star').addClass('far').removeClass('fas rate-active');
  //       $(this).find('.star').addClass('rate-active fas').removeClass('far star-over');
  //       $(this).prevAll().find('.star').addClass('fas').removeClass('far star-over');
  //     } else {
  //       console.log('has');
  //     }
  //   }); 
  // });
  
    
  /* When the user scrolls down, hide the navbar. When the user scrolls up, show the navbar */
  var prevScrollpos = window.pageYOffset;
  window.onscroll = function() {
    var currentScrollPos = window.pageYOffset;
    if (prevScrollpos > currentScrollPos) {
      document.getElementById("navbarCollapse").style.top = "0";
    } else {
      document.getElementById("navbarCollapse").style.top = "-50px";
    }
    prevScrollpos = currentScrollPos;
  }   
  
    // $(document).on('turbolinks:load', function () {
    // var stepper = new Stepper($('.bs-stepper')[0])

    // $("#country").select2({
    //   allowClear: true,
    //   theme: "bootstrap"
    // });
    // $("#province").select2({
    //   allowClear: true,
    //   theme: "bootstrap"
    // });
    // $("#city").select2({
    //   allowClear: true,
    //   theme: "bootstrap"
    // });
  
    // var country
    // $(document.body).on("change", "#country", function () {
    //   $("#province").empty();
    //   $("#city").empty();
    //   country = this.value;
    //   const provinceSelect = document.getElementById('province');

    //   var url = '/province';
    //   var data = {
    //     country: country
    //   };
  
    //   $.getJSON(url, data, function (data, status) {
    //     if (status == 200 || status == 'success') {
    //       $("#province").select2({
    //         placeholder: "please select an option...",
    //         data: data,
    //         theme: "bootstrap",
    //         allowClear: true
    //       })
    //     }
    //   });
    // });

    // $(document.body).on("change", "#province", function () {
    //   $("#city").empty();
    //   var province = this.value;
    //   const provinceSelect = document.getElementById('city');

    //   var url = '/city';
    //   var data = {
    //     country: country,
    //     province: province
    //   };
  
    //   $.getJSON(url, data, function (data, status) {
    //     if (status == 200 || status == 'success') {
    //       $("#city").select2({
    //         placeholder: "please select an option...",
    //         data: data,
    //         theme: "bootstrap",
    //         allowClear: true
    //       })
    //     }
    //   });
    // });

  // });
  
}(jQuery));



// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)


$(document).ready(function(){

  var current_fs, next_fs, previous_fs; //fieldsets
  var opacity;
  
  $(".next").click(function(){
  
  current_fs = $(this).parent();
  next_fs = $(this).parent().next();
  
  //Add Class Active
  $("#progressbar li").eq($("fieldset").index(next_fs)).addClass("active");
  
  //show the next fieldset
  next_fs.show();
  //hide the current fieldset with style
  current_fs.animate({opacity: 0}, {
  step: function(now) {
  // for making fielset appear animation
  opacity = 1 - now;
  
  current_fs.css({
  'display': 'none',
  'position': 'relative'
  });
  next_fs.css({'opacity': opacity});
  },
  duration: 600
  });
  });
  
  $(".previous").click(function(){
  
  current_fs = $(this).parent();
  previous_fs = $(this).parent().prev();
  
  //Remove class active
  $("#progressbar li").eq($("fieldset").index(current_fs)).removeClass("active");
  
  //show the previous fieldset
  previous_fs.show();
  
  //hide the current fieldset with style
  current_fs.animate({opacity: 0}, {
  step: function(now) {
  // for making fielset appear animation
  opacity = 1 - now;
  
  current_fs.css({
  'display': 'none',
  'position': 'relative'
  });
  previous_fs.css({'opacity': opacity});
  },
  duration: 600
  });
  });
  
  $('.radio-group .radio').click(function(){
  $(this).parent().find('.radio').removeClass('selected');
  $(this).addClass('selected');
  });
  
  $(".submit").click(function(){
  return false;
  })
  
  });
