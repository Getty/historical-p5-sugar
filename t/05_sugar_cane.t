use Test::More tests => 11;
use FindBin;
use lib "$FindBin::Bin/lib";

use_ok( 'SugarTest::NewFeature', 'can include SugarTest::NewFeature module' );

ok( my $nf = SugarTest::NewFeature->new( y => 2 ), 'new SugarTest::NewFeature' );
is( $nf->y, 2, 'getter returns value given on construction' );
is( $nf->x(3), 3, 'setter returns set value' );
ok( $nf->isa('Sugar::Cane::Object'), 'isa Sugar::Cane::Object' );
ok( !$nf->isa('Sugar::Object'), 'not isa Sugar::Object' );
is( $nf->listutil_test(), 2, 'min of List::Util is implemented' );
ok( $nf->scalarutil_test(), 'looks_like_number of Scalar::Util is implemented' );
is( $nf->points(), 6, 'method keyword works and function returns proper result' );

eval { $nf->x(-1) };
like( $@, qr/Validation failed for 'PositiveInt' failed/, 'negative value failed for subtype PositiveInt');

eval { my $wrongpos = SugarTest::NewFeature->new( xyz => 123 ) };
like( $@, qr/init_arg passed to the constructor: xyz/, 'MooseX::StrictConstructor gives expected error' );

diag("Tested Sugar::Cane $Sugar::Cane::VERSION");

done_testing();
