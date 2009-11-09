use Test::More tests => 9;

BEGIN {

	use Sugar::Declare;

	class Pos {

		has 'x' => ( isa => 'Int', is => 'rw', default => sub { 1 } );
		has 'y' => ( isa => 'Int', is => 'rw', default => sub { 1 } );

		method points {
			$self->x * $self->y
		}

	}

	role PosZ {

		has 'z' => ( isa => 'Int', is => 'rw', default => sub { 1 } );

		around points {
			$self->$orig * $self->z;
		}

	}

	class PosWithZ extends Pos with PosZ {}

}

ok( my $pos = Pos->new({ y => 2 }), 'new Position' );
is( $pos->y, 2, 'getter returns value given on construction' );
is( $pos->x(3), 3, 'getter returns setted value' );
is( $pos->points, 6, 'points give correct x*y' );
ok( $pos->isa('Sugar::Object'), 'isa Sugar::Object' );

ok( my $poswithz = PosWithZ->new({ y => 3 }), 'new Position with Z' );
$poswithz->x(2);
is( $poswithz->z, 1, 'getter returns default value' );
$poswithz->z(4);
is( $poswithz->points, 24, 'points give correct x*y*z' );
ok( $poswithz->isa('Sugar::Object'), 'isa Sugar::Object' );

diag("Tested Sugar::Declare $Sugar::Declare::VERSION");
 
done_testing();


