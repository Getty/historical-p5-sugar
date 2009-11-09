package Sugar::Declare::Syntax::Keyword::Type;

use Sugar::Cane;

use namespace::clean -except => 'meta';

with qw(
	MooseX::Declare::Syntax::KeywordHandling
);

sub parse {
	my ($self, $ctx) = @_;
	use Data::Dumper;
	print Dumper $ctx;
}

1;

