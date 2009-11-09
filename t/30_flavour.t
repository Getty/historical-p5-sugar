use Test::More tests => 1;

BEGIN {

	package MyFlavour;

	use Sugar::Cane;

	be_sugar;

}

eval q{

	package MyFlavourTest;
	use MyFlavour;

	has 'value' => ( isa => 'Int', is => 'rw' );

};

print STDERR $@;

ok( !$@, 'can include flavour' );

done_testing();
