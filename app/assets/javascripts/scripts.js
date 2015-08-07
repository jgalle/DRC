var unsaved = false;

$(document).ready(function() {

	// turn select fields into chosen fields

	$('.toggle-header').on('click',function(){
			$($(this).attr('href')).slideToggle();
			$(this).parent('div').toggleClass('dropup');
			return false;
		});
	
		// $('#accordion a:first input[type="radio"]').prop('checked', true);
		// $('#accordion h4.panel-title a').on('click', function(){
		// $('#accordion a:first input[type="radio"], #accordion2 a:first input[type="radio"]').prop('checked', true);
		// $('#accordion h4.panel-title a, #accordion2 h4.panel-title a').on('click', function(){			$(this).find('input[type="radio"]').prop('checked', true);
		// });
		// $('#accordion a:first .custom-radio i, #accordion2 a:first .custom-radio i').addClass('custom-radio-selected');
	    // $('#artifact_type').val('Beads');
	    // $('#artifact_type_list').html('');
	    // $('#subset_by').val('Context');
	    // $('#subset_data_by_list').html('');
		$('#accordion h4.panel-title a').on('click', function(){
	        $('#accordion h4.panel-title a i').removeClass('custom-radio-selected');
	        $(this).find('.custom-radio i').addClass('custom-radio-selected');
	        var artifact_type = $(this).find('label').html().split(' ').pop();
	        $('#artifact_type').val(artifact_type);
	        $('#artifact_type_list').html(artifact_type);
			$('.fields-returned li, .fields-ordered-by li').hide();
			$('.fields-returned li.item-'+artifact_type+', .fields-ordered-by li.item-'+artifact_type).show();
	 	});
	    $('#accordion1 h4.panel-title a').on('click', function(){
	        $('#accordion1 h4.panel-title a i').removeClass('custom-radio-selected');
			$('.panel-collapse').addClass('collapse')
	        $(this).find('.custom-radio i').addClass('custom-radio-selected');
			$('.accordion1-type-selected').val('');
			$(this).parent().parent().parent().find('.accordion1-type-selected').val('in');
	        var artifact_type = $(this).find('label').html().split(' ').pop();
	        $('#artifact_type').val(artifact_type);
	        $('#artifact_type_list').html(artifact_type+":");
			// 	        var subset = $(this).find('label').html().split('>').pop();
			// 	        $('#subset_by').val(subset);
			// 	        $('#subset_data_by_list').html(subset+': ');
			// $('#subset_values').html('');
	    });	
	    $('#accordion2 h4.panel-title a').on('click', function(){
	        $('#accordion2 h4.panel-title a i').removeClass('custom-radio-selected');
			$('.panel-collapse').addClass('collapse')
	        $(this).find('.custom-radio i').addClass('custom-radio-selected');
			$('#accordion2 .type-selected').val('');
			$(this).parent().parent().parent().find('.type-selected').val('in');
	        var subset = $(this).find('label').html().split('>').pop();
	        $('#subset_by').val(subset);
	        $('#subset_data_by_list').html(subset+': ');
			$('#subset_values').html('');
	    });	

	    $('#accordion3 h4.panel-title a').on('click', function(){
	        $('#accordion3 h4.panel-title a i').removeClass('custom-radio-selected');
			$('.panel-collapse').addClass('collapse')
	        $(this).find('.custom-radio i').addClass('custom-radio-selected');
			$('#accordion3 .type-selected').val('');
			$(this).parent().parent().parent().find('.type-selected').val('in');
	        var subset = $(this).find('label').html().split('>').pop();
	        $('#attribute_group_by').val(subset);
	        $('#attribute-groups').html(subset);
			// $('#attribute-groups').html('');
	    });	
		$('.query-text-values').change(function(){
			$('#subset_values').html($(this).val());
		})
	
	$("select").each(function() {
      if($(this).attr('id').indexOf("_NUM_") == -1) {
          var chosen_width = 188;
			if($(this).attr('width') > 0) chosen_width = $(this).attr('width');
			var threshold = 1;
			if($(this).hasClass('no-autocomplete')) threshold = 100;
          $(this).chosen({width: chosen_width+"px",disable_search_threshold: threshold});
      }
	});

    // function to test existence of items

	$.fn.exists = function(){return this.length>0;}

    // variable for delete confirmations

	var completeness_for_delete;

    // throw message if unsaved changes when moving away from page

	if($('#button-record-save').exists()) {
		console.log('has save');
		$('#button-record-save').click(function(){
			$('#button-record-save').hide();
			var options = {
			    "backdrop" : "static",
				"keyboard" : false
			}
			$('#saving-modal').modal(options);
			$('#loading-icon').show();
		
			console.log('save');
			unsaved = false;
		});
		$(":input").change(function(){
			console.log('miod');
			if(!$('.modal-body').is(':visible')) {
				unsaved = true;
			}
		});
		// $(window).on('beforeunload', function(e) {
		//     if(unsaved) {
		//         return 'You have unsaved stuff. Are you sure to leave?';
		//     }
		// });
		function unloadPage(){ 
			if(unsaved){
				var message = 'You have made changes to this form. To avoid losing data, please stay on this page and select the "SAVE" button before leaving.',
				e = e || window.event;
				// For IE and Firefox
				if (e) { e.returnValue = message; }
				// For Safari
				return message;
			}
		}
		window.onbeforeunload = unloadPage;
	}

	if (window.PIE) {
		$('.ie-fix').each(function() {
			PIE.attach(this);
		});
	}
	if ($('.tabs .section').exists()){
		$('.tabs .section:last-child').addClass('last-child');
	}
	// if ($('.fancybox').exists()){
	// 	$('.fancybox').fancybox({
	// 		prevEffect : 'fade',
	// 		nextEffect : 'fade',
	// 	});
	// }
	if ($('.popover-area').exists()){
		$('.popover-area .btn').popover();
		$('.popover-area .btn').click(function () {
			$('.popover-area .btn').not(this).popover('hide');
			$('.popover-area .btn').removeClass('active');
			$(this).addClass('active');
		});
	}
	if ($('.panel-group .panel').exists()){
		$('.panel-group .panel:last-child').addClass('last-child');
	}
	if ($('.query-results .results tr').exists()) {
		$('.query-results .results tr:odd').addClass('odd');
	}
	if ($('.query-database .collapse-block .box ul').exists()){
		$('.query-database .collapse-block .box ul:last-child').addClass('last-child');
	}
	if ($('.query-database .cols li').exists()){
		$('.query-database .cols li:last-child').addClass('last-child');
	}
	if ($('.ceramics-list tr').exists()) {
		$('.ceramics-list tr:odd').addClass('odd');
	}
	if ($('.ceramics-list tr').exists()){
		$('.ceramics-list tr:last-child').addClass('last-child');
	}
	if ($('.dashboard .activity .data tr:even').exists()){
		$('.dashboard .activity .data tr:even').addClass('even');
	}
	if ($('.dashboard .artifacts .data tr:even').exists()){
		$('.dashboard .artifacts .data tr:even').addClass('even');
	}
	if ($('.dashboard .catalog .data tr:even').exists()){
		$('.dashboard .catalog .data tr:even').addClass('even');
	}
	if ($('.dashboard .messages .data tr:even').exists()){
		$('.dashboard .messages .data tr:even').addClass('even');
	}
	if ($('.modal-00001 .checkbox-holder .btn').exists()){
		$('.modal-00001 .checkbox-holder .btn').popover();
		$('.modal-00001 .checkbox-holder .btn').click(function () {
			$('.modal-00001 .checkbox-holder .btn').not(this).popover('hide');
			$('.modal-00001 .checkbox-holder .btn').removeClass('active');
			$(this).addClass('active');
		});
	}
	if ($('.files-block table tr').exists()) {
		$('.files-block table tr:odd').addClass('odd');
	}
	if ($('.files-block table tr').exists()){
		$('.files-block table tr:last-child').addClass('last-child');
	}
	if ($('.files-block .last-child td').exists()){
		$('.files-block .last-child td:last-child').addClass('cell-last-child');
	}
	if ($('.collapsed').exists()){
		$('.collapsed').click(function(){
			$('.popover-area .btn').popover('hide');
		});
	}
	if ($('.modal-content button.close').exists()){
		$('.modal-content button.close').click(function(){
			$('.modal-00001 .checkbox-holder .btn').popover('hide');
		});
	}
	$('.modal-00001').on('hide.bs.modal', function () {
		$('.modal-00001 .checkbox-holder .btn').popover('hide');
	})
	$('.dropdown-menu .panel .next-btn').click(function(e) {
	$('.dropdown-menu .panel #slideshow-01').carousel('next');
		return false;
	});
	$('.dropdown-menu .panel .prev-btn').click(function(e) {
		$('.dropdown-menu .panel #slideshow-01').carousel('prev');
		return false;
	});
	$('.dropdown-menu').on('click', function(e) {
		if($(this).hasClass('dropdown-menu-form')) {
			e.stopPropagation();
		}
	});

	// if ($('#button-record-save').exists()){
	// 	$('#button-record-save').click(function(){
	// 		$('.alert-success').slideDown();
	// 		setTimeout(function(){
	// 			$('.alert-success').slideUp();
	// 		}, 3000)
	// 		return false;
	// 	});
	// }

	// if ($('#button-record-delete')) {
	// 	$('#button-record-delete').click(function(){
	// 		window.location = "list.html#success-deleted";
	// 	});
	// }

	if ($('.success-deleted').exists()){
		var url_query = window.location.hash;
		if(url_query == '#success-deleted') {
			$('.success-deleted').show();
			window.location.hash = '';
			setTimeout(function(){
				$('.success-deleted').slideUp();
			},5000);
		}
	}

    // repeater code for Sherd Completeness

	if ($('#completeness-measurement-holder').exists()) {
		$('#completeness-add-measurement').click(function(){

            // get last id number

            var number = getIDNumber('#tab-06 div.sherd-area .left-col div.completeness div.options-box:last .number');

            // clone holder div

			var container_div = $('#completeness-measurement-holder').prev();
			var option_div = $('#completeness-measurement-holder').children().clone(true,true);
            option_div.addClass('block-'+number);
            if(isColored('#tab-06 div.sherd-area .left-col div.completeness div.options-box:last')) { option_div.addClass('colored'); }
			$('.select-area',option_div).remove();

            // replace id numbers and add to dom

            option_div = option_div[0].outerHTML;
            option_div = option_div.replace(/_NUM_/g, number);
            container_div.append(option_div);

			// turn select fields into chosen fields

			$("select").each(function() {
				if($(this).attr('id').indexOf("_NUM_") == -1 && !hasClass('no-autocomplete')) {
					var chosen_width = 188;
					if($(this).attr('width') > 0) chosen_width = $(this).attr('width');
					var threshold = 1;
					if($(this).hasClass('no-autocomplete')) threshold = 100;
					$(this).chosen({width: chosen_width+"px",disable_search_threshold: threshold});
				}
			});

            // re-initialize custom dropdowns and delete code

            $('.completeness .options-box .delete').click(function(){
                completeness_for_delete = $(this).parent();
            });
		});
		$('.completeness .options-box .delete').click(function(){
			completeness_for_delete = $(this).parent();
		});
        $('#completeness-add-measurement').click();
	}

    // repeater code for Sherd Inclusions

	if ($('#inclusions-measurement-holder').exists()) {
		$('#inclusions-add-measurement').click(function(){

            // get last id number

            var number = getIDNumber('#tab-06 div.sherd-area .right-col div.inclusions div.options-box:last .number');

            // clone holder div

			var container_div = $('#inclusions-measurement-holder').prev();
			var option_div = $('#inclusions-measurement-holder').children().clone(true,true);
            option_div.addClass('block-'+number);
            if(isColored('#tab-06 div.sherd-area .right-col div.inclusions div.options-box:last')) { option_div.addClass('colored'); }
            $('.select-area',option_div).remove();

            // replace id numbers and add to dom

            option_div = option_div[0].outerHTML;
            option_div = option_div.replace(/_NUM_/g, number);
            container_div.append(option_div);

			// turn select fields into chosen fields

            $("select").each(function() {
                if($(this).attr('id').indexOf("_NUM_") == -1 && !hasClass('no-autocomplete')) {
					var chosen_width = 188;
					if($(this).attr('width') > 0) chosen_width = $(this).attr('width');
					var threshold = 1;
					if($(this).hasClass('no-autocomplete')) threshold = 100;
					$(this).chosen({width: chosen_width+"px",disable_search_threshold: threshold});
                }
            });

            // re-initialize custom dropdowns and delete code

            $('.inclusions .options-box .delete').click(function(){
                completeness_for_delete = $(this).parent();
            });
		});
		$('.inclusions .options-box .delete').click(function(){
			completeness_for_delete = $(this).parent();
		});
        $('#inclusions-add-measurement').click();
	}

	// repeater code for Ceramic Decoration tab

	if ($('#stylistic-measurement-holder').exists()) {
		$('#stylistic-add-measurement').click(function(){

			// get last id number

			var number = getIDNumber('#tab-03 div.stylistic-elements div.block:last .number');

            // clone holder div

			var container_div = $('#stylistic-measurement-holder').prev();
			var option_div = $('#stylistic-measurement-holder').children().clone(true,true);
			option_div.addClass('block-'+number);
			if(isColored('#tab-03 div.stylistic-elements div.block:last')) { option_div.addClass('colored'); }
            $('.select-area',option_div).remove(); // required to re-initialize custom dropdowns

			// initialize carousel

			$(option_div, '.slideshow').carousel({ interval: false });
			$(option_div, '.next-btn').click(function(e) {
				$(option_div, '.slideshow').carousel('next');
				return false;
			});

			// replace id numbers and add to dom

			option_div = option_div[0].outerHTML;
			option_div = option_div.replace(/_NUM_/g, number);
			container_div.find('.stylistic-before-holder').before(option_div);

			// turn select fields into chosen fields

            $("select").each(function() {
                if($(this).attr('id').indexOf("_NUM_") == -1 && !hasClass('no-autocomplete')) {
					var chosen_width = 188;
					if($(this).attr('width') > 0) chosen_width = $(this).attr('width');
					var threshold = 1;
					if($(this).hasClass('no-autocomplete')) threshold = 100;
					$(this).chosen({width: chosen_width+"px",disable_search_threshold: threshold});
                }
            });

			// re-initialize custom dropdowns and delete code

			$('.block .delete').click(function(){
				completeness_for_delete = $(this).parent().parent().parent();
			});

		});
		$('.block .delete').click(function(){
			completeness_for_delete = $(this).parent().parent().parent();
		});

        // display one item for the repeater

        $('#stylistic-add-measurement').click();

	}
	if ($('.ceramics-list .delete-tr').exists()) {
		$('.ceramics-list .delete-tr').click(function(){
			completeness_for_delete = $(this).parents('.holder-for-delete');
		});
	}
	if ($('#alert-modal').exists()) {
		$('#alert-modal').on('hidden.bs.modal', function (e) {
			completeness_for_delete = "";
		})
		$('#alert-modal .delete').click(function(){
			if (completeness_for_delete) {
				completeness_for_delete.remove();
			}
			$('#alert-modal').modal('hide')
		});
	}
	if ($('#sites-checkboxs').exists()) {
		$('#sites-checkboxs input[type="checkbox"]').change(function(){	
			sitesContain();
		});
		sitesContain()
	}
	if ($('#artifact-attributes').exists()) {
		$('#artifact-attributes input[type="checkbox"]').change(function(){	
			attributesContain();
		});
		attributesContain()
	}

	if ($('#collapse-feature-type').exists()) {
		$('#collapse-feature-type input[type="checkbox"]').change(function(){	
			feature_typeContain();
		});
		// feature_typeContain();
	}
	if ($('#collapse-unit-type').exists()) {
		$('#collapse-unit-type input[type="checkbox"]').change(function(){	
			unit_typeContain();
		});
		// unit_typeContain();
	}

	if ($('#collapse-object-type').exists()) {
		$('#collapse-object-type input[type="checkbox"]').change(function(){	
			object_typeContain();
		});
		// object_typeContain();
	}

	if ($('#collapse-object-form').exists()) {
		$('#collapse-object-form input[type="checkbox"]').change(function(){	
			object_formContain();
		});
		// object_formContain();
	}
	if ($('#collapse-ware').exists()) {
		$('#collapse-ware input[type="checkbox"]').change(function(){	
			wareContain();
		});
		// wareContain();
	}

	if ($('#collapse-types').exists()) {
		$('#collapse-types input[type="checkbox"]').change(function(){	
			checkboxContain('types');
		});
		// wareContain();
	}
	if ($('#collapse-subtype').exists()) {
		$('#subtype_attributes input[type="checkbox"]').change(function(){
			var string_sites = new Array();
			var subtypes = '';
			$('#collapse-subtype input[type="checkbox"]').each(function(){
				if ($(this).is(':checked')) {
					if (subtypes != '') {
						subtypes += '_';
					}
			
					subtypes +=  $(this).next().text();
				}
			});
			$.ajax({ 
			 type: 'GET', 
			 url: '/homepage/image_forms?sub_types='+encodeURIComponent(subtypes), 
			 // url: 'http://hero.village.virginia.edu/mongo/faulkner/events/?filter_SourceTextCode='+text, 
			   // url: 'http://hero.village.virginia.edu/~rwb3y/events.json', 
			 dataType:'json',
			 success: function (data) { 
				 console.log(data);
				 var str = '<ul>';
				var num = 0;
				var  total = data.length;
				var third = Math.ceil(data.length/3);
				$.each(data,function(index, val) {
					str += '<li><input name="forms[]" value="'+val+'" type="checkbox" id="form-lbl-'+num+'" class="check forms"  /> <label for="form-lbl-'+num+'">'+val+'</label> ';
					num += 1;
					if (Math.round(num%(third)) == 0) {
						if ((num >= (third*2)) && (num != total)) {
							str += '</ul><ul class="last-child">';
						} else if (num != total){
							str += '</ul><ul>';
						}
					}
				})
				str += '</ul>';
				$('#subtype_form_values').html(str);
				customForm.customForms.replaceAll();
				checkboxContain('subtype');
				checkboxForms();
			 }
		 	});
			// getSubtypeForms('subtype');
		});

		$('body').on('change', '#subtype_form_attributes input[type="checkbox"]', function(){
			checkboxForms();
		});
		// wareContain();
	}
	
	
	if ($('#collapse-form').exists()) {
		$('#collapse-form input[type="checkbox"]').change(function(){	
			checkboxContain('form');
		});
		// wareContain();
	}

	// uncheck checkboxes when accordion heading links are selected on query form
	// also set the hidden field for artifact type or subset by

	$('#accordion a').click(function(){
		$('#accordion :checkbox').prop('checked', false);
		var artifact_type = $(this).attr('href').replace('#collapse-','');
		$('#artifact_type').val(artifact_type);
	});
	$('#accordion1 a').click(function(){
		$('#accordion1 :checkbox').prop('checked', false);
		var artifact_type = $(this).attr('href').replace('#collapse-','');
		$('#artifact_type').val(artifact_type);
		$('#selected-attributes').html('');
	});
	$('#accordion2 a').click(function(){
        $('#accordion2 :checkbox').prop('checked', false);
        var subset_by = $(this).attr('href').replace('#collapse-','');
        $('#subset_by').val(subset_by);
		$('textarea').val('');
    });

	$('#accordion3 a').click(function(){
        var subset_by = $(this).attr('href').replace('#collapse-','');
        $('#attribute-groups').val(subset_by);
		$('textarea').val('');
    });
	$('#accordion1 :checkbox').click(function(){
		setAttributes();
	});
	$('#accordion2 :checkbox').click(function(){
		setAttributes();
	});
	$('#context_attributes :checkbox').click(function(){
		setCQAttributes();
	});
});

$(document).ready(function(){
    // Fade effect
    var _parentFade = '.fade-block';
    var _linkFade = '.open-close';
    var _fadeBlock = '.slide-block';
    var _openClassF = 'active';
    var _textOpenF = 'Open block';
    var _textCloseF = 'Close block';
    var _durationFade = 300;
	setAttributes();
	
    $(_parentFade).each(function(){
		if (!$(this).is('.'+_openClassF)) {
			$(this).find(_fadeBlock).css('display','none');
		}
    });
    $(_linkFade,_parentFade).click(function(){
		if ($(this).parents(_parentFade).is('.'+_openClassF)) {
			$(this).parents(_parentFade).removeClass(_openClassF);
			$(this).parents(_parentFade).find(_fadeBlock).fadeOut(_durationFade);
		} else {
			$(this).parents(_parentFade).addClass(_openClassF);
			$(this).parents(_parentFade).find(_fadeBlock).fadeIn(_durationFade);
		}
		return false;
    });
    
});
function checkAll(obj, class_str) {
	var cbs = $(obj).closest('.box').find('input');
	if(!cbs.length) cbs = $(obj).closest('.block').find('input');
	for(var i=0; i < cbs.length; i++) {
		if(cbs[i].type == 'checkbox') {
			// if (typeof class_str == 'undefined') {
				cbs[i].checked = obj.checked;
			// } else {
			// 	console.log($(cbs[i]).has_class(class_str));
			// }
		}
	}
	sitesContain()
}

function searchCheckAll(obj, class_str) {
	var cbs = $(obj).closest('.box').find('input');
	if(!cbs.length) cbs = $(obj).closest('.block').find('input');
	for(var i=0; i < cbs.length; i++) {
		if(cbs[i].type == 'checkbox') {
			// if (typeof class_str == 'undefined') {
				cbs[i].checked = obj.checked;
			// } else {
			// 	console.log($(cbs[i]).has_class(class_str));
			// }
		}
	}
	sitesContain()
}
function checkAllWithClass(obj, str) {
	var cbs = $(obj).closest('.block').find('.'+str);
	for(var i=0; i < cbs.length; i++) {
		if(cbs[i].type == 'checkbox') {
			// if (typeof class_str == 'undefined') {
				cbs[i].checked = obj.checked;
			// } else {
			// 	console.log($(cbs[i]).has_class(class_str));
			// }
		}
	}
	sitesContain()
}

function sitesContain() {
	var string_sites = new Array();
	$('#sites-checkboxs input[type="checkbox"]').each(function(){
		if ($(this).is(':checked')) {
			if ($(this).next().text() != 'Select All in Region')
				string_sites.push($(this).next().text());
		}
	});
	if(string_sites.length) {
		$('#sites_contain').text(string_sites.join(', '));
	}
	else {
		$('#sites_contain').text('None');
	}
}

function attributesContain() {
	var string_attributes = new Array();
	$('#artifact-attributes input[type="checkbox"]').each(function(){
		if ($(this).is(':checked')) {
			string_attributes.push($(this).next().text());
		}
	});
	if(string_attributes.length) {
		var str = '';
		$(string_attributes).each(function(key, atr) {
			if (atr != '')
				str += '<li>'+atr+'</li>';
		})
		$('#attributes_contain').html(str);
	}
	else {
		$('#attributes_contain').html('<li>None</li>');
	}
}

function feature_typeContain() {
	var string_sites = new Array();
	$('#collapse-feature-type input[type="checkbox"]').each(function(){
		if ($(this).is(':checked')) {
			string_sites.push($(this).next().text());
		}
	});
	if(string_sites.length) {
		$('#subset_values').text(string_sites.join(', '));
	}
	else {
		$('#subset_values').text('None');
	}
}

function unit_typeContain() {
	var string_sites = new Array();
	$('#collapse-unit-type input[type="checkbox"]').each(function(){
		if ($(this).is(':checked')) {
			string_sites.push($(this).next().text());
		}
	});
	if(string_sites.length) {
		$('#subset_values').text(string_sites.join(', '));
	}
	else {
		$('#subset_values').text('');
	}
}

function object_typeContain() {
	var string_sites = new Array();
	$('#collapse-object-type input[type="checkbox"]').each(function(){
		if ($(this).is(':checked')) {
			string_sites.push($(this).next().text());
		}
	});
	if(string_sites.length) {
		$('#subset_values').text(string_sites.join(', '));
	}
	else {
		$('#subset_values').text('');
	}
}

function object_formContain() {
	var string_sites = new Array();
	$('#collapse-object-form input[type="checkbox"]').each(function(){
		if ($(this).is(':checked')) {
			string_sites.push($(this).next().text());
		}
	});
	if(string_sites.length) {
		$('#subset_values').text(string_sites.join(', '));
	}
	else {
		$('#subset_values').text('');
	}
}

function wareContain() {
	var string_sites = new Array();
	$('#collapse-ware input[type="checkbox"]').each(function(){
		if ($(this).is(':checked')) {
			string_sites.push($(this).next().text());
		}
	});
	if(string_sites.length) {
		$('#subset_values').text(string_sites.join(', '));
	}
	else {
		$('#subset_values').text('');
	}
}

function checkboxContain(name) {
	var string_sites = new Array();
	$('#collapse-'+name+' input[type="checkbox"]').each(function(){
		if ($(this).is(':checked')) {
			string_sites.push($(this).next().text());
		}
	});
	if(string_sites.length) {
		$('#subset_values').text(string_sites.join(', '));
	}
	else {
		$('#subset_values').text('');
	}
}

function checkboxForms() {
	var string_sites = new Array();
	$('#subtype_form_attributes input[type="checkbox"]').each(function(){
		if ($(this).is(':checked')) {
			string_sites.push($(this).next().text());
		}
	});
	if(string_sites.length) {
		$('#form_values').text('Form: '+string_sites.join(', '));
	}
	else {
		$('#form_values').text('');
	}
}

function getSubtypeForms(name) {
	// var string_sites = new Array();
	// var subtypes = '';
	// $('#collapse-'+name+' input[type="checkbox"]').each(function(){
	// 	if ($(this).is(':checked')) {
	// 		if (subtypes != '') {
	// 			subtypes += '_';
	// 		}
	//
	// 		subtypes +=  $(this).next().text();
	// 	}
	// });
	// $.ajax({
	//  type: 'GET',
	//  url: '/homepage/image_forms?sub_types='+encodeURIComponent(subtypes),
	//  // url: 'http://hero.village.virginia.edu/mongo/faulkner/events/?filter_SourceTextCode='+text,
	//    // url: 'http://hero.village.virginia.edu/~rwb3y/events.json',
	//  dataType:'json',
	//  success: function (data) {
	// 	 console.log(data);
	// 	 var str = '<ul>';
	// 	var num = 0;
	// 	var  total = data.length;
	// 	var third = Math.ceil(data.length/3);
	// 	$.each(data,function(index, val) {
	// 		str += '<li><input name="subtypes[]" value="'+val+'" type="checkbox" id="form-lbl-'+num+'" class="check subtypes"  /> <label for="form-lbl-'+num+'">'+val+'</label> ';
	// 		num += 1;
	// 		if (Math.round(num%(third)) == 0) {
	// 			if ((num >= (third*2)) && (num != total)) {
	// 				str += '</ul><ul class="last-child">';
	// 			} else if (num != total){
	// 				str += '</ul><ul>';
	// 			}
	// 		}
	// 	})
	// 	str += '</ul>';
	// 	$('#subtype_form_values').html(str);
	//  }
	//  	});
}

function setAttributes() {
	var atts = new Array();
	$('.panel-collapse.in .box').each(function(){
		if ($(this).attr('id') != null) {
			if ($(this).attr('id').indexOf('_attributes') >= 0) {
				$(this).find('input[type="checkbox"]').each(function(){
					var label = $(this).next().text();
					if ($(this).is(':checked') && label.length) {
						atts.push(label);
					}
				});
				if(atts.length) {
					$('#selected-attributes').text(atts.join(', '));
				}
				else {
					$('#selected-attributes').text('None');
				}
			}
		}
	});
}

function setCQAttributes() {
	var atts = new Array();
	$('#context_attributes').each(function(){
		if ($(this).attr('id') != null) {
			if ($(this).attr('id').indexOf('_attributes') >= 0) {
				$(this).find('input[type="checkbox"]').each(function(){
					var label = $(this).next().text();
					if ($(this).is(':checked') && label.length) {
						atts.push(label);
					}
				});
				if(atts.length) {
					$('#selected-attributes').text(atts.join(', '));
				}
				else {
					$('#selected-attributes').text('None');
				}
			}
		}
	});
}

function getIDNumber(item) {
    var number = 1;
    if($(item).exists()) {
        number = parseInt($(item).text()) + 1;
    }
    return number;
}
function isColored(item) {
    var color = true;
    if($(item).hasClass('colored')) { color = false; }
    return color;
}
