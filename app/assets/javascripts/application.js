// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//= require jquery
//= require rails-ujs
//= require_tree .

//**************************** DASHBOARD ***************************
//responsible for switching views in the dashboard on click
$(function(){
  $("a.load").click(function (e) {
    e.preventDefault();
    $("#tutor_view_frame").load($(this).attr("href"));
  });

  $("a.tu_load").click(function (e) {
    e.preventDefault();
    $("#tutee_view_frame").load($(this).attr("href"));
  });
});

//default view page for the dashboards
$(document).ready(function(){
  $("#tutor_view_frame").load("/tutor/incoming_requests");
  $("#tutee_view_frame").load("/tutee/find_tutor");
});

//responsible for highlighting the selected choice on the dashboard navigation sidebar
function enable_selected(selected_tab, option_amt) {
	for(var i = 1; i <= option_amt; i++){
		var temp = selected_tab.substring(0,selected_tab.length-1) + i;
		document.getElementById(temp).style.backgroundColor = "#FFFFFF";
	}
	document.getElementById(selected_tab).style.backgroundColor = "#F4EDFE";
}
//************************* DASHBOARD end **************************


//**************************** CHAT APP ****************************
//responsible for minimizing a window:
(function() {
  $(document).on('click', '.toggle-window', function(e) {
    e.preventDefault();
    var panel = $(this).parent().parent();
    var messages_list = panel.find('.messages-list');

    //It runs a jQuery toggle() method and scrolls to the bottom of the window if it’s visible
    panel.find('.panel-body').toggle();
    panel.attr('class', 'panel panel-default');

    if (panel.find('.panel-body').is(':visible')) {
      var height = messages_list[0].scrollHeight;
      messages_list.scrollTop(height);
    }
  });
})();

//**************************** CHAT APP end ****************************
