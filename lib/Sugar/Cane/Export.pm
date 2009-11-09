package Sugar::Cane::Export;
our $VERSION = '0.0.1';

use Moose;
extends 'Moose::Exporter';

use Moose::Exporter;

Moose::Exporter->setup_import_methods(
	as_is => [qw(
		export
	)],
);

sub export {
	my %args = @_;
	$args{exporting_package} = caller() if !$args{exporting_package};
	__PACKAGE__->setup_import_methods(
		%args,
	);
}

1;
