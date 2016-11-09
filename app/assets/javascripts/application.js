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
//= require bootstrap-sprockets
//= require jquery_ujs
//= require turbolinks
//= require_tree .
$(document).on("page:change", function(){
	$("#select_all").click(function(){
  	$("#select_all").attr("checked", "checked");
		$("#select_by_contact").removeAttr("checked");
		$("#select_by_contact_id").attr("disabled","disabled");
		$("#select_by_contact_id").prop("selectedIndex", 0);
	});
	$("#select_by_contact").click(function(){
		$("#select_all").removeAttr("checked");
		$("#select_by_contact").attr("checked", "checked");
		$("#select_by_contact_id").removeAttr("disabled");
	});
});