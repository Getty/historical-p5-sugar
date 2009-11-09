use Test::More tests => 8;

use Sugar::Declare;

role SugarTest::Role::Desc {

	has 'desc' => ( isa => 'Str', is => 'rw', default => sub { 'Describe me!' } );

}

class SugarTest::WithRole with SugarTest::Role::Desc {

	has 'name' => ( isa => 'Str', is => 'rw', default => sub { 'My Name Is' } );

}

ok( my $withrole = SugarTest::WithRole->new(), 'new SugarTest::WithRole' );
is( $withrole->desc(), 'Describe me!', 'role attribute gives default value' );
is( $withrole->name(), 'My Name Is', 'class attribute gives default value' );
is( $withrole->desc('new'), 'new', 'setting role attribute gives new value' );
is( $withrole->name('new2'), 'new2', 'setting class attribute gives new value' );
is( $withrole->desc(), 'new', 'role attribute gives new value' );
is( $withrole->name(), 'new2', 'class attribute gives new value' );
ok( $withrole->isa('Sugar::Object'), 'metaclass is Sugar::Object' );

done_testing();
