function colorthepage() {
	// copyright Nicholas Lum 2010
    var htmlEl = document.documentElement;

    var headEl = htmlEl.getElementsByTagName("head")[0];
    if (headEl != null) {
		var bodyEl = headEl.nextSibling;
		while (bodyEl.nodeName.toLowerCase() != "body") {
			bodyEl = bodyEl.nextSibling;
		}
		var readabilityNode = document.getElementById("BeeLine");
		
		var parseNode = null;
		if (readabilityNode) {
			parseNode = readabilityNode;
		} else {
			parseNode = bodyEl;
		}
		
		if (parseNode.hasChildNodes()) {
		
			// 0 = anchor to color1; 1 = color1 to anchor; 2 = anchor to color2; 3 = color2 to anchor
			var thisColor = 0;

			var xmin=0; var xmax=0; var xcoord=0; var xlast=0;

			// white space regex 
			var whtSpc = new RegExp(/^\s+$/);
			var whtSpcFlag = 0;

			// NOTE: this call doesn't work in IE8
			var rect = parseNode.getBoundingClientRect();
			xmin = rect.left;
			xmax = rect.right;
		
			// wrap all characters in span elements - each of these span elements have a unique identifier: 0Z
			makeChildrenSpan(parseNode);
			// mark each of these span elements with an x coordinate
			markSpansXcoords(parseNode); 
				
			// to prevent division by zero:
			if (xmin == xmax) xmax++;
			
			var r=0; var g=0; var b=0;
			xlast = null;			
		
			var spanEls = parseNode.getElementsByTagName("span");
		
			for (i=0; i<spanEls.length; i++) {
				var spanEl = spanEls.item(i);
				if(spanEl.id == "0Z") {
					if (xlast == null) {
						// starting a new walk - we set the last coord to the start of the span
						xlast = xmin;
					} else {
						// in midst of a walk, we track where the xcoord was on the last iteration
						xlast = xcoord;
					}
					// set xcoord to current position
					xcoord = spanEl.className;
								
					var testLine = xcoord-xlast;
					
					if (testLine<0 || whtSpcFlag) {
						//looks like a new line - don't count this unless we have a visible character
						if (whtSpc.test(spanEl.firstChild.nodeValue) || spanEl.firstChild.nodeValue==null) {
							whtSpcFlag = 1;
						} else {
							whtSpcFlag = 0;
							thisColor = getNextColor(thisColor);	
						}
					}
				
					var colors = null;				
					switch(thisColor) {
						case 0:
							maxr = 0; 
							minr = 0; 
							maxg = 0;
							ming = 0;
							maxb = 255;
							minb = 0;
							colors = getColor(thisColor, xcoord, xmin, xmax, maxr, minr, maxg, ming, maxb, minb);	
							break;
						case 1:
							maxr = 0; 
							minr = 0; 
							maxg = 0;
							ming = 0;
							maxb = 255;
							minb = 0;						
							colors = getColor(thisColor, xcoord, xmin, xmax, maxr, minr, maxg, ming, maxb, minb);						
							break;
						case 2:					
							maxr = 255; 
							minr = 0; 
							maxg = 0;
							ming = 0;
							maxb = 0;
							minb = 0;
							colors = getColor(thisColor, xcoord, xmin, xmax, maxr, minr, maxg, ming, maxb, minb);	
							break;
						case 3:					
							maxr = 255; 
							minr = 0; 
							maxg = 0;
							ming = 0;
							maxb = 0;
							minb = 0;
							colors = getColor(thisColor, xcoord, xmin, xmax, maxr, minr, maxg, ming, maxb, minb);	
							break;
						default:
							maxr = 127; 
							minr = 127; 
							maxg = 127;
							ming = 127;
							maxb = 127;
							minb = 127;
							colors = getColor(thisColor, xcoord, xmin, xmax, maxr, minr, maxg, ming, maxb, minb);	
							break;
					}

					var red = colors.red; var green = colors.green; var blue = colors.blue;
					// give this character its color
					spanEl.style.color =  "rgb(" + red + ", " + green + ", " + blue + ")";
				
				}
			}

		}
	}
 
	function makeChildrenSpan(node) {
 
		var next;
 
		if (node.nodeType === 1) {
			// element node
			if (node = node.firstChild) {
				do {
					next = node.nextSibling;
					makeChildrenSpan(node);					
				} while(node = next);
			}
 
		} else if (node.nodeType === 3) {
			// text node
			var numchars = node.length;
			var readNode = node.cloneNode(0);
			
			var copyNode = node.cloneNode(0); // don't include its children - a text node has no children anyways
			var copySpan = document.createElement("span"); // new span that will replace this text node
			copySpan.appendChild(copyNode);
			var thisParent = node.parentNode;
			thisParent.replaceChild(copySpan, node);  // now we will read the readNode - inserting span elements of each char after this node
			
			//build new paragraph, create a new text node containing spans around each char				
			for (j=0; j<numchars; j++) {
				var newSpan = document.createElement("span");
				var thisChar = readNode.nodeValue.charAt(j);
				var newText = document.createTextNode(thisChar);
				newSpan.id = "0Z";
				newSpan.appendChild(newText);
				thisParent.insertBefore(newSpan,copySpan);  // instead of: node.parentNode.appendChild(newSpan);
			}
			thisParent.removeChild(copySpan);				// get rid of the original text, which is now the span node

		}
 
	}
	
	function markSpansXcoords(node) {
 
		var next; 
		if (node.nodeType === 1 && node.id !== "0Z") {  
			if (node = node.firstChild) {
				do {
					next = node.nextSibling;
					markSpansXcoords(node);					
				} while(node = next);
			}
		} else if (node.nodeType === 1 && node.id === "0Z") { 
			var x = findPosition(node);
			node.className = x;					
		}

	}
	
	function findPosition(obj) {
		var cleft = ctop = 0;
		if (obj.offsetParent) {
			do {
				cleft += obj.offsetLeft;
				ctop += obj.offsetTop;
			} while (obj = obj.offsetParent);
		}
		return cleft;	
	}
	
	function getColor(thisColor, xcoord, xmin, xmax, maxr, minr, maxg, ming, maxb, minb) {
		var _r = 0;
		var _g = 0;
		var _b = 0;

		var xhere = 0;
		var y=0;var yup=0;var ydown=0;
		
		// slope for Y val
		var m0 = 3.1415/(xmax - xmin);
		var mr = maxr - minr; var mg = maxg - ming; var mb = maxb - minb;

		var yup = 0;
		var ydown = 0;
		var yr = 0; var yg = 0; var yb = 0;
		var ycosup = 0; var ycosdown = 0;
	
		// y = m(x - x1) + y1;
		switch (thisColor) {
			case 0: 
				// increase color
				xhere = xcoord-xmin;
				y = m0*xhere;
				yup = y-3.1415;
				ycosup = Math.cos(yup);
				ycosup++;
				ycosup = ycosup/2;
				yr = mr*ycosup;
				yr = yr + minr;
				yg = mg*ycosup;
				yg = yg + ming;
				yb = mb*ycosup;
				yb = yb + minb;
				_r = Math.round(yr);
				_g = Math.round(yg);
				_b = Math.round(yb);
				break;
			case 1:
				// decrease color
				xhere = xcoord-xmin;
				y = m0*xhere;
				ydown = y;
				ycosdown = Math.cos(ydown);
				ycosdown++;
				ycosdown = ycosdown/2;
				yr = mr*ycosdown;
				yr = yr + minr;
				yg = mg*ycosdown;
				yg = yg + ming;
				yb = mb*ycosdown;
				yb = yb + minb;
				_r = Math.round(yr);
				_g = Math.round(yg);
				_b = Math.round(yb);
				break;
			case 2:
				// increase color
				xhere = xcoord-xmin;
				y = m0*xhere;
				yup = y-3.1415;
				ycosup = Math.cos(yup);
				ycosup++;
				ycosup = ycosup/2;
				yr = mr*ycosup;
				yr = yr + minr;
				yg = mg*ycosup;
				yg = yg + ming;
				yb = mb*ycosup;
				yb = yb + minb;
				_r = Math.round(yr);
				_g = Math.round(yg);
				_b = Math.round(yb);
				break;
			case 3: 
				// decrease color
				xhere = xcoord-xmin;
				y = m0*xhere;
				ydown = y;
				ycosdown = Math.cos(ydown);
				ycosdown++;
				ycosdown = ycosdown/2;
				yr = mr*ycosdown;
				yr = yr + minr;
				yg = mg*ycosdown;
				yg = yg + ming;
				yb = mb*ycosdown;
				yb = yb + minb;
				_r = Math.round(yr);
				_g = Math.round(yg);
				_b = Math.round(yb);
				break;
			default: 
				_r = 127;
				_g = 127;
				_b = 127;
				break;
		}
		return { red: _r, green: _g, blue: _b };
	}
 
	function getNextColor( thisColor ) {
		var numColors = 4;
		var nextColor;
		thisColor++;
		if (thisColor>=numColors) {
			nextColor = 0;
		} else {
			nextColor = thisColor;
		}	
		return nextColor;
	}
}