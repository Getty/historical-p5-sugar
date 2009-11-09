use Test::More tests => 16;

BEGIN {

	package Pos;

	use Sugar::Meta;

	subtype 'PositiveInt'
		=> as 'Int'
		=> where { $_ > 0 };

	has 'x' => ( isa => 'PositiveInt', is => 'rw', default => sub { 1 } );
	has 'y' => ( isa => 'PositiveInt', is => 'rw', default => sub { 1 } );

	class_has something => (
		isa => 'Str',
		is => 'rw',
		default => sub { 'class_has_something' },
	);

	has counter => (
		metaclass => 'Counter',
		is        => 'ro',
		isa       => 'Num',
		default   => sub { 0 },
		provides  => {
			inc => 'inc_counter',
			dec => 'dec_counter',          
			reset => 'reset_counter',
		}
	);

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

}

ok( my $pos = Pos->new( y => 2 ), 'new Position' );
is( $pos->y, 2, 'getter returns value given on construction' );
is( $pos->x(3), 3, 'setter returns set value' );
ok( $pos->isa('Sugar::Object'), 'isa Sugar::Object' );
ok( !$pos->isa('Sugar::Cane::Object'), 'not isa Sugar::Cane::Object' );
is( $pos->listutil_test(), 2, 'min of List::Util is implemented' );
ok( $pos->scalarutil_test(), 'looks_like_number of Scalar::Util is implemented' );
is( $pos->points(), 6, 'method keyword works and function returns proper result' );
ok( $pos->meta->isa('Sugar::Meta::Class'), 'metaclass is a Sugar::Meta::Class' );
eval { $pos->inc_counter };
ok( !$@, 'counter metaclass from MooseX::AttributeHelpers works' );
is( $pos->counter, 1, '... and works also as counter' );
is( Pos->something, 'class_has_something', 'MooseX::ClassAttribute works');
is( Pos->something('new'), 'new', 'class attribute can be set');
is( Pos->something, 'new', 'class attribute new value can be get');

eval { $pos->x(-1) };
like( $@, qr/Validation failed for 'PositiveInt' failed/, 'negative value failed for subtype PositiveInt');

eval { my $wrongpos = Pos->new( xyz => 123 ) };
like( $@, qr/init_arg passed to the constructor: xyz/, 'MooseX::StrictConstructor gives expected error' );

diag("Tested Sugar::Meta $Sugar::Meta::VERSION");

done_testing();
