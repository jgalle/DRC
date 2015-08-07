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
//= require handlebars
//= require jquery
//= require jquery_ujs
//= require typeahead
// require twitter/bootstrap
//= require chosen.jquery
//= require bootstrap.min
// require turbolinks
//= require custom-form
// require custom-form.file
// require custom-form.select
//= require custom-form.scrollable
//= require jquery.mousewheel-3.0.6.pack
//= require jquery.fancybox.pack
//= require scripts
//= require bootstrap-datepicker
//= require ekko-lightbox
// require_tree .

// $(function() {
// 	var content_to_remove;
// 	
// 	$('.add_fields').click(function (event) {
// 	  time = new Date().getTime();
// 	  regexp = new RegExp($(this).data('id'), 'g');
// 	  // $(this).before($(this).data('fields').replace(regexp, time));
// 	  $(this).prev().append($(this).data('fields').replace(regexp, time));
// 		event.preventDefault();
// 	});
// 	$('.image-delete').click(function (event) {
// 		alert('r');
// 		if(content_to_remove != null) {
// 			$(content_to_remove).prev('input[type=hidden]').val('1');
// 			$(content_to_remove).closest('.fieldset').hide();
// 		}
// 		$('#image-alert-modal').modal('hide')
// 		event.preventDefault();
// 	});
// });

function update_contexts(selector, context) {
    $.getJSON("/contexts/context_ids",{project_id: $(selector).val(), ajax: 'true'},function(j){
    
        var options = '';
    
        for (var i = 0; i < j.length; i++) {
            options += '<option value="' + j[i].id + '">' + j[i].id + '</option>';
        }

        $("#context_selection").html("<select name=\"context_sample\" id=\"updated-list\" class=\"form-control\" data-placeholder=\"--select--\" ><option></option>"+options+"</select>");
		$('#updated-list').chosen();
		if(context != "") {
			$('#updated-list').val(context);
			$('#updated-list').trigger('chosen:updated');
		}
		// customForm.customForms.replaceAll();

    });
	
}

$(function() {
	
	$('form input').keydown(function(event){
	    if(event.keyCode == 13) {
			// $(this).next().focus();
	      event.preventDefault();
	      return false;
	    }
	  });
	
	url = document.location.href.split('#');
   if(url[1] != undefined) {
       $('.nav-tabs a[href=#'+url[1]+']').tab('show');
   }
	function activaTab(tab){
        $('.nav-tabs a[href="#' + tab + '"]').tab('show');
    };


	$("#project_selection").change( function(){
		update_contexts(this, "");
			// 	    $.getJSON("/contexts/context_ids",{project_id: $(this).val(), ajax: 'true'},function(j){
			//         
			// 	        var options = '';
			//         
			// 	        for (var i = 0; i < j.length; i++) {
			// 	            options += '<option value="' + j[i].id + '">' + j[i].id + '</option>';
			// 	        }
			//     
			// 	        $("#context_selection").html("<select name=\"context_sample\" id=\"updated-list\" class=\"form-control\" data-placeholder=\"--select--\" ><option></option>"+options+"</select>");
			// $('#updated-list').chosen();
			// // customForm.customForms.replaceAll();
			// 	
			// 	    });
				});
				
		$('.artifact-creation').click(function(){
			if(($('#updated-list').val() == null) || ($('#updated-list').val() == '')) {
				event.preventDefault();
					      
				return false;			
			}
			// alert($('#updated-list').val());
			// console.log($('#complete-form').val());
		})

		// function showFancybox(){		
		// if ($('.fancybox').exists()){
		// 	$('.fancybox').fancybox({
		// 		href : $('.item.active').children()[0].src,
		// 		prevEffect : 'fade',
		// 		nextEffect : 'fade',
		// 	});
		// }
		// }
			 
			var currentFrame = document.getElementById("iframe");
			
			
			window.onresize = resizeCurrentFrame; //Bind function to event, so whenever the window is resized, resize the current frame accordingly
			
			function getYCoord(elem) {
			 return elem.offsetParent ? (elem.offsetTop + getYCoord(elem.offsetParent)) : elem.offsetTop;
			}
			
			function resizeCurrentFrame() {
			 if(currentFrame==null || currentFrame==undefined)
			 return;
			
			 var buffer = 5; //scroll bar buffer -- prevents the scrollbar from appearing needlessly
			
			//Iframe height = get window height, and then subtract out the height of elements above the iframe (with a small buffer to prevent the side scrollbar from appearing)
			 var height = window.innerHeight-160 || document.body.clientHeight || document.documentElement.clientHeight;
			 height -= getYCoord(currentFrame) + buffer;
			 height = (height < 0) ? 0 : height;
			 currentFrame.style.height = height + 'px';
			//Current iframe was resized!
			}
			
			$(document).delegate('*[data-toggle="lightbox"]', 'click', function(event) {
			                    event.preventDefault();
			                    return $(this).ekkoLightbox({
			                        onShown: function() {
			                            if (window.console) {
			                                return console.log('Checking our the events huh?');
			                            }
			                        }
			                    });
			                });
});