/*
	begin code for header styling transition
*/

var windowTopPos = window.scrollY;
var hero = document.getElementById('hero');
if (hero) {
	var heroVideoHeight = hero.clientHeight;
}
var mainHeader = document.getElementById('mainHeader');
var mainLogo = document.getElementById('mainLogo');

function restyleHeaderLight() {
	mainHeader.classList.remove('theme--dark');
	mainHeader.classList.add('theme--light');
	mainLogo.setAttribute('src','/images/logo.png');
}

function restyleHeaderDark() {
	// this is a check to see if the header has already scrolled and applied the styling change
	if (mainHeader.classList.contains('theme--light')) {
		mainHeader.classList.add('theme--dark');
	}
	mainHeader.classList.remove('theme--light');
	mainLogo.setAttribute('src','/images/logo--white.png');
}

if (hero) {
	window.addEventListener('scroll', function() {
		console.log('scrolling...');
		// get the y scroll position of the window
		windowTopPos = window.scrollY;
		// if the scroll position is greater than the hero video height that means the top menu is below the video and should transition colors
		console.log(windowTopPos);
		if ( windowTopPos > heroVideoHeight ) {
			restyleHeaderLight();
		} else {
			restyleHeaderDark();
		}
	});

	window.addEventListener('resize', function() {
		heroVideoHeight = document.getElementById('hero').clientHeight;
	});
}
/*
	end code for header styling transition
*/