Modernizr.load([
    {
        load: 'js/jquery.min.js'
    },
    {
        // This will wait for the fallback to load and execute if it needs to.
        load: [
			'js/jquery.superfish.js', 
			'js/jquery-ui.js', 
			'js/jquery-ui.selectmenu.js',
            'js/jquery.flexslider-min.js',
            'js/jquery.quicksand.js',
            'http://www.google.com/jsapi?key=AIzaSyCZfHRnq7tigC-COeQRmoa9Cxr0vbrK6xw',
		]
    },
    {
        load: 'js/jquery.script.js'
    },
	{
		  test: Modernizr.mq('only all'),
		  nope: 'js/css3-mediaqueries.js'
	}
    ]);