var DecideWhichReadFirst = {
  init: function() {
    if (DecideWhichReadFirst.setup) return;
      DecideWhichReadFirst.setup = true;
	  // did the page already decide beeline or normal first?
	  //if (!$('bee_or_norm_first').readAttribute('class')) {
		// make a random seed for deciding which is first. 0=normal first, 1=beeline first
		var beeOrNorm = Math.random(10);
		beeOrNorm = beeOrNorm * 100;
		var decision = (beeOrNorm > 50) ? 1 : 0;
		$('bee_or_norm_first').writeAttribute('class', decision);
		if (decision == 1) {
			$('1stread').writeAttribute('id', 'BeeLine');
		} else {
			$('2ndread').writeAttribute('id', 'BeeLine');
		}
		colorthepage();
		var beeFirst = $('bee_or_norm_first').readAttribute('class');
		var hideSecondRead = (decision > 0) ? '2ndread' : 'BeeLine';
		$(hideSecondRead).writeAttribute('class', 'hidden');
		$('doneReading').writeAttribute('class', 'hidden');
		// Nick's auto-erase function
		// document.getElementById('destroy').click()
	  //}
    },

	ask: function() {
		var beelineFirst = $('bee_or_norm_first').readAttribute('class');
		return beelineFirst;
	}
}

var UpdateTimeThing = {
  

  init: function() {
	if (UpdateTimeThing.setup) return;
    UpdateTimeThing.setup = true;
  },

  show: function(e) {
	// start button pressed - is there a counter yet? 
	if (!$('beeline_start1').readAttribute('class')) {
	  // no counter means this is the start of first read. 
	  // create class, start counter
	  $('beeline_start1').writeAttribute('class', 0);
	  var pe = new PeriodicalExecuter(updateNormalTime, 1);
	} else {
	  //yes there is a counter - is the time recorded for the first read?
	  var beeFirst = $('bee_or_norm_first').readAttribute('class');
	  var firstTimeSlot = (beeFirst > 0) ? 'beeline_beeline_time' : 'beeline_normal_time';
	  if(!$(firstTimeSlot).readAttribute('value')) {
		// no the time is not recorded yet - not time to press the start button
		alert("After you press the start button, read the selection and press the stop button right when you finish.");
	  } else {
		// some some reason, I cannot read the value in the timer div to record - I'll instead set a flag that
		// will et the function called by the timer to record this timed event
		
		$('flag_start2').writeAttribute('class', '1');
		// the time for the first read was recorded, has the 2nd read start been pressed already?

		/* if(!$('beeline_start2').readAttribute('class')) { */
	
		// no it hasn't, record the current time count
		// var startTime2 = $('beeline_start1').readAttribute('value');
		
		/* } else {
			alert("You already started the timer for your second read.");
		} */
	  }
	}
  },
  
}

var UpdateTime = Class.create({
	initialize: function(element) {
	  UpdateTimeThing.init();
	  DecideWhichReadFirst.init();
	  this.element = $(element);
		if (this.element) {
		  this.element.observe('click', UpdateTimeThing.show);
		}
	}
});

function updateNormalTime ()
{
	var strTime = $('beeline_start1').readAttribute('class');
	var numTime = parseInt(strTime);
	if($('flag_start2').readAttribute('class')) {
		// write numTime to start2
		$('beeline_start2').writeAttribute('class', numTime);
		$('flag_start2').writeAttribute('class', '');
	}
	if($('flag_stop2').readAttribute('class')) {	
		var strTime2 = $('beeline_start2').readAttribute('class');
		var numTime2 = parseInt(strTime2);
		var time2 = numTime - numTime2;
		var beeFirst = $('bee_or_norm_first').readAttribute('class');
		var secondTimeSlot = (beeFirst > 0) ? 'beeline_normal_time' : 'beeline_beeline_time';
		var secondWPMSlot = (beeFirst > 0) ? 'normal_wordcount_time' : 'beeline_wordcount_time';
		var wordCount = $('word_count').readAttribute('class');
		wordCount = parseInt(wordCount);
		if (!$(secondTimeSlot).readAttribute('value')) {
			$(secondTimeSlot).writeAttribute('value', time2);
			time2 = parseInt(time2);
			var WPMtime2 = Math.ceil((wordCount/2)/(time2/60));
			$(secondWPMSlot).writeAttribute('value', WPMtime2);
			var beelineWPM = $('beeline_wordcount_time').readAttribute('value');
			beelineWPM = parseInt(beelineWPM);
			var normalWPM = $('normal_wordcount_time').readAttribute('value');
			normalWPM = parseInt(normalWPM);
			var percentGain = Math.ceil(((beelineWPM-normalWPM)/normalWPM)*100);
			$('percent_gain').writeAttribute('value', percentGain);
		}
		$('flag_stop2').writeAttribute('class', '');
		//note this would store the times for this read as a new beeline $('new_beeline').submit();
		
	}
	numTime++;
	$('beeline_start1').writeAttribute('class', numTime);
}