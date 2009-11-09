package Sugar::Declare::Syntax::Keyword::Role;
our $VERSION = '0.0.1';

use Sugar::Cane;

extends 'MooseX::Declare::Syntax::Keyword::Role';

around import_symbols_from => sub {
	my ($next, $self, $ctx) = @_;
	return $ctx->has_parameter_signature
		? 'Sugar::Role::Parameterized'
		: 'Sugar::Role';
};

1;
