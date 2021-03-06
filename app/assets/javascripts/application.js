// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require bootstrap
//= require_tree .


$(document).ready(function() {
	$('#gallery-scroll').click(function(){
		skip = $('#gallery-scroll').data('skip')
		$.ajax({
			url:"/posts?skip=" + skip,
			success:function(data){

				// $(".userposts").html('')
				$('#gallery-scroll').data('skip', skip + data.length)
				_.each(data, function(post){
					var template = $("#user-gallery").html();
					var rendered = Mustache.render(template,post);
					$(".userposts").append(rendered);
				});

			}
		});
	});

	$('#gallery-scroll').click(function(){
		take = $('#gallery-scroll-back').data('take')
		$.ajax({
			url:"/posts?take=" + take,
			success:function(data){

				$('#gallery-scroll-back').data('take', take + data.length)
				_.each(data, function(post){
					var template = $("#user-gallery").html();
					var rendered = Mustache.render(template,post);
					$(".userposts").append(rendered);
				});

			}
		});
	});
});