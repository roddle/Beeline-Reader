var UpdateTimeThing = {

  init: function() {
	if (UpdateTimeThing.setup) return;
    UpdateTimeThing.setup = true;
  },
  
  show: function(e) {
	// alert("yay");
	var pe = new PeriodicalExecuter(updateNormalTime(), 1);
	//updateNormalTime();
  },
  
}

var UpdateTime = Class.create({
	initialize: function(element) {
	  UpdateTimeThing.init();
	  this.element = $(element);
		if (this.element) {
		  this.element.observe('click', UpdateTimeThing.show);
		}
	}
});

function updateNormalTime()
{
	if ($('beeline_normal_time').readAttribute('value')) {
		$('beeline_normal_time').writeAttribute('value', '0';
	}
	var normalCount = $('beeline_normal_time').readAttribute('value');
	normalCount = normalCount + 1;
	$('beeline_normal_time').writeAttribute('value', normalCount);
}


