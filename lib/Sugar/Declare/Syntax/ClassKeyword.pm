package Sugar::Declare::Syntax::ClassKeyword;
our $VERSION = '0.0.1';

use Sugar::Cane;

extends 'MooseX::Declare::Syntax::Keyword::Class';

sub import_symbols_from { 'Sugar::Meta' }

1;
