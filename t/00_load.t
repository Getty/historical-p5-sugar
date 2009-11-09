package Sugar::Test::LoadTest;
use Test::More tests => 1;

BEGIN {
    use_ok('Sugar');
}

diag("Used Sugar $Sugar::VERSION successful");
 
done_testing();
