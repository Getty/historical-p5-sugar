package Sugar::Meta::Role;

use Sugar::Cane;
extends 'Moose::Meta::Role';

use Sugar::Meta::Class;

sub apply {
    my ($self, $other, @args) = @_;

    (blessed($other))
        || Sugar->throw_error("You must pass in an blessed instance");

    my $application_class;
    if ($other->isa('Sugar::Meta::Role')) {
        $application_class = $self->application_to_role_class;
    }
    elsif ($other->isa('Sugar::Meta::Class')) {
        $application_class = $self->application_to_class_class;
    }
    else {
        $application_class = $self->application_to_instance_class;
    }

    Class::MOP::load_class($application_class);
    return $application_class->new(@args)->apply($self, $other);
}

