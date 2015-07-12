$ ->

	cx = /[\u0000\u00ad\u0600-\u0604\u070f\u17b4\u17b5\u200c-\u200f\u2028-\u202f\u2060-\u206f\ufeff\ufff0-\uffff]/g

	escapable = /[\\\"\x00-\x1f\x7f-\x9f\u00ad\u0600-\u0604\u070f\u17b4\u17b5\u200c-\u200f\u2028-\u202f\u2060-\u206f\ufeff\ufff0-\uffff]/g

	meta = { # table of character substitutions
		'\b': '\\b',
		'\t': '\\t',
		'\n': '\\n',
		'\f': '\\f',
		'\r': '\\r',
		'"' : '\\"',
		'\\': '\\\\'
	};

	json_quote = (string) ->
		escapable.lastIndex = 0
		if escapable.test(string) then '"' + string.replace(escapable, ((a) ->
			c = meta[a]
			if typeof c == 'string' then c else '\\u' + ('0000' + a.charCodeAt(0).toString(16)).slice(-4)
		)) + '"' else '"' + string + '"'

	$('#btnProcess').bind 'click', (event) ->
		str = $("#normal").val()
		# STEP 1: use prettydif to minify html
		# http://prettydiff.com/documentation.xhtml#function_properties
		options   = {
			source: str,
			mode : "minify", # beautify, diff, minify, parse
			lang  : "html",
			wrap : 100,
			inchar : "\t",  #indent character
			insize : 1      #number of indent characters per indent
		}

		pd = prettydiff options  # returns and array: [beautified, report]
		
		debugger;
		# Add JSON escape characters
		outputHTML = json_quote pd[0]

		$("#outputHTML").val outputHTML



		# STEP 2: Use the output of minified html, add a space between > < and then string html tags
		div = document.createElement("div")
		div.innerHTML = $("#outputHTML").val().replace(/></g,'> <')
		text = div.textContent || div.innerText || ""

		# Finally, replace spaces more than 2 with a single space
		$("#outputRaw").val text.replace(/\s{2,10}/g, ' ');

		return

	$('#btnPrettify').bind 'click', (event) ->
		str = $("#normal").val()
		#Options can be viewed at:
		#http://prettydiff.com/documentation.xhtml#function_properties
		options   = {
			source: str,
			mode : "beautify", # beautify, diff, minify, parse
			lang  : "html",
			wrap : 100,
			inchar : "\t",  #indent character
			insize : 1      #number of indent characters per indent
		}

		pd = prettydiff(options); # returns and array: [beautified, report]
		$("#outputHTML").val(pd[0])
		return



