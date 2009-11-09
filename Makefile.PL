# Load the Module::Install bundled in ./inc/
use inc::Module::Install;

# Define metadata
name 'Sugar';
all_from 'lib/Sugar.pm';

# Specific dependencies
requires 'Moose';
requires 'MooseX::AlwaysCoerce';
requires 'MooseX::Declare';
requires 'MooseX::StrictConstructor';
requires 'MooseX::Aliases';
requires 'MooseX::ClassAttribute';
requires 'MooseX::AttributeHelpers';
requires 'MooseX::Attribute::ENV';
requires 'Exception::Class::TryCatch';
requires 'Scalar::Util';
requires 'List::Util';

auto_set_repository;
auto_manifest;
auto_install;
WriteAll;
