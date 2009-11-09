package Sugar::Role;
our $VERSION = '0.0.1';

use Sugar::Cane::Role ();
use Sugar::Cane::Export;

export (
	also => [qw(
		Sugar::Cane::Role
	)],
);

1;
