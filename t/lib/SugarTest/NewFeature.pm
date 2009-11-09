package SugarTest::NewFeature;

use Sugar::Cane;

subtype 'PositiveInt'
	=> as 'Int'
	=> where { $_ > 0 };

has 'x' => ( isa => 'PositiveInt', is => 'rw', default => sub { 1 } );
has 'y' => ( isa => 'PositiveInt', is => 'rw', default => sub { 1 } );

sub points {
	my $self = shift;
	$self->x * $self->y;
}

sub listutil_test {
	min 2..5;
}

sub scalarutil_test {
	!looks_like_number "A";
}

1;
