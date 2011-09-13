// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

$(document).observe('dom:loaded', function() {
	new FancyZoom('stop_box_link', {width:500, height:300});
	new UpdateTime('start_box_link');
});

