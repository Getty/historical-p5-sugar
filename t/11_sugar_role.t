use Test::More tests => 10;

BEGIN {

	package SugarTest::Role::Desc;

	use Sugar::Role;

	has 'desc' => ( isa => 'Str', is => 'rw', default => sub { 'Describe me!' } );

}

eval q{

	package SugarTest::WithRole;

	use Sugar::Meta;

	with qw( SugarTest::Role::Desc );

	has 'name' => ( isa => 'Str', is => 'rw', default => sub { 'My Name Is' } );

};

ok( my $withrole = SugarTest::WithRole->new(), 'new SugarTest::WithRole' );
is( $withrole->desc(), 'Describe me!', 'role attribute gives default value' );
is( $withrole->name(), 'My Name Is', 'class attribute gives default value' );
is( $withrole->desc('new'), 'new', 'setting role attribute gives new value' );
is( $withrole->name('new2'), 'new2', 'setting class attribute gives new value' );
is( $withrole->desc(), 'new', 'role attribute gives new value' );
is( $withrole->name(), 'new2', 'class attribute gives new value' );
ok( $withrole->isa('Sugar::Object'), 'object is Sugar::Object' );
ok( $withrole->meta->isa('Sugar::Meta::Class'), 'metaclass is Sugar::Meta::Class' );
ok( SugarTest::Role::Desc->meta->isa('Sugar::Meta::Class'), 'role metaclass is Sugar::Meta::Class' );

diag("Tested Sugar::Role $Sugar::Role::VERSION");

done_testing();
