package Sugar::Cane;
our $VERSION = '0.0.1';

use Moose ();
use Moose::Util::TypeConstraints ();
use MooseX::StrictConstructor ();
use MooseX::Aliases ();
use MooseX::ClassAttribute ();
use MooseX::AttributeHelpers;
use MooseX::Attribute::ENV;

use Sugar::Cane::Export;

use Sugar::Cane::Object;

use List::Util;
use Scalar::Util;

export (
	as_is => [
		qw(
			be_sugar
			base_class
			metaclass
			attribute_metaclass
			method_metaclass
			instance_metaclass
		),
		\&Scalar::Util::dualvar,
		\&Scalar::Util::isweak,
		\&Scalar::Util::readonly,
		\&Scalar::Util::refaddr,
		\&Scalar::Util::reftype,
		\&Scalar::Util::tainted,
		\&Scalar::Util::weaken,
		\&Scalar::Util::isvstring,
		\&Scalar::Util::looks_like_number,
		\&Scalar::Util::set_prototype,
		\&List::Util::first,
		\&List::Util::max,
		\&List::Util::maxstr,
		\&List::Util::min,
		\&List::Util::minstr,
		\&List::Util::reduce,
		\&List::Util::shuffle,
		\&List::Util::sum,
	],
	also => [qw(
		Moose
		Moose::Util::TypeConstraints
		MooseX::StrictConstructor
		MooseX::Aliases
		MooseX::ClassAttribute
	)],
);

our $base_class = 'Sugar::Cane::Object';
sub base_class { my $class = shift; $base_class = $class }

our $metaclass;
sub metaclass { my $class = shift; $metaclass = $class }

our $attribute_metaclass;
sub attribute_metaclass { $attribute_metaclass = shift }

our $method_metaclass;
sub method_metaclass { $method_metaclass = shift }

our $instance_metaclass;
sub instance_metaclass { $instance_metaclass = shift }

sub init_meta {
	shift;
	my %options = @_;
	$options{base_class} = $base_class if $base_class;
	$options{metaclass} = $metaclass if $metaclass;
	$options{attribute_metaclass} = $attribute_metaclass if $attribute_metaclass;
	$options{method_metaclass} = $method_metaclass if $method_metaclass;
	$options{instance_metaclass} = $instance_metaclass if $instance_metaclass;
	Moose->init_meta(%options);
	return $options{for_class}->meta();
}

sub be_sugar {
	my %args = @_;
	$args{also} = () if !$args{also};
	push @{$args{also}}, 'Sugar::Cane';
	push @{$args{also}}, 'Sugar::Cane::Export';
	export (
		%args, exporting_package => caller(),
	);
}

1;
