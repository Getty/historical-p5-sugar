package Sugar::Cane::Role;
our $VERSION = '0.0.1';

use Moose::Role ();
use Moose::Exporter;

Moose::Exporter->setup_import_methods(
	also => [qw( Moose::Role )],
);

1;
