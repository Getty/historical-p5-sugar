package Sugar::Declare;
our $VERSION = '0.0.1';

use Sugar::Cane;

extends 'MooseX::Declare';

use aliased 'Sugar::Declare::Syntax::RoleKeyword';
use aliased 'Sugar::Declare::Syntax::ClassKeyword';

around keywords => sub {
	my $orig = shift;
	my $self = shift;
	
	my @keywords = (
		RoleKeyword->new(identifier => 'role'),
		ClassKeyword->new(identifier => 'class')
	);
	for ($self->$orig) {
		push @keywords, $_ if ($_->identifier ne 'role' and $_->identifier ne 'class');
	}
	for (Moose::Util::TypeConstraints::list_all_type_constraints()) {
		push @keywords, TypeKeyword->new(identifier => $_) if ($_ =~ /^[\w^\_]+$/);
	}
	@keywords;
};

__END__
