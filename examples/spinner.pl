use strict;
use warnings;
use Prima qw(Application Buttons Spinner Sliders);

my $mw = Prima::MainWindow->new(
		size => [400, 400],
		text => 'Spinners');

my $spinner = $mw->insert('Spinner',
	size => [200,400],
	origin => [0,0],
	color => cl::White,
	hiliteColor => cl::Blue,
	pack => { side => 'left', fill => 'both', expand => 1 },
);

my $spinner2 = $mw->insert('Spinner',
	style => 'drops',
	size => [200,400],
	origin => [200,0],
	color => cl::White,
	hiliteColor => cl::Green,
	pack => { side => 'left', fill => 'both', expand => 1 },
);

$mw->insert(
	'Button',
	text => 'Start/Stop',
	checkable => 1,
	checked => 0,
	origin => [0,0],
	onClick => sub { $_->toggle for $spinner, $spinner2 },
	growMode => gm::XCenter
);

$spinner->insert(
	'Slider',
	min => 0,
	max => 100,
	origin => [0,0],
	onChange => sub { $spinner->value( shift->value ) },
	growMode => gm::XCenter
);

run Prima;
