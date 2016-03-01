/*
       QR-Logo: http://qrlogo.kaarposoft.dk

       Copyright (C) 2011 Henrik Kaare Poulsen

       Licensed under the Apache License, Version 2.0 (the "License");
       you may not use this file except in compliance with the License.
       You may obtain a copy of the License at

         http://www.apache.org/licenses/LICENSE-2.0

       Unless required by applicable law or agreed to in writing, software
       distributed under the License is distributed on an "AS IS" BASIS,
       WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
       See the License for the specific language governing permissions and
       limitations under the License.
*/


/* ************************************************************ */
/* Settings for http://www.jslint.com/
*/

/*jslint browser: true */
/*jslint vars: true */
/*global alert: true */
/*global QRCodeDecode: true, Logger: true, canvas_loader: true */


/* ************************************************************ */
/* JavaScript STRICT mode
*/

"use strict";


/* ************************************************************ */
function qrdecode_onload() {
	document.getElementById("nojs").style.display = "none";
	if (Modernizr.canvas) { document.getElementById("noHTML5canvas").style.display = "none"; }
}


/* ************************************************************ */
function on_logo_file_upload(evt) {

	var f = function () {
		document.getElementById("ondecode_button").disabled = false;
		document.getElementById("div_decoded").style.display = "none";
		document.getElementById("div_debug").style.display = "none";
	};

	canvas_loader(evt, document.getElementById("qrlogo_canvas"), f);
}


/* ************************************************************ */
function qrdecode_ondecode() {

	document.getElementById("qrlogo_text").value = "";

	var qr = new QRCodeDecode();

	var debug = document.getElementById("qrlogo_debug_checkbox").checked;
	var logger;
	if (debug) {
		logger = new Logger("div_debug_output");
		logger.init();
		qr.logger = logger;
		document.getElementById("div_debug").style.display = "block";
	}

	var canvas = document.getElementById("qrlogo_canvas");
	var ctx = canvas.getContext("2d");
	var imagedata = ctx.getImageData(0, 0, canvas.width, canvas.height);

	var decoded = qr.decodeImageData(imagedata, canvas.width, canvas.height);

	document.getElementById("qrlogo_text").value = decoded;

	document.getElementById("div_decoded").style.display = "block";
}



