package Sugar::Meta;
our $VERSION = '0.0.1';

use Sugar::Cane;

use Sugar::Object;
use Sugar::Meta::Class;
use Sugar::Meta::Attribute;
use Sugar::Meta::Method;
use Sugar::Meta::Instance;

be_sugar;

base_class          'Sugar::Object';
metaclass           'Sugar::Meta::Class';
#attribute_metaclass 'Sugar::Meta::Attribute';
#method_metaclass    'Sugar::Meta::Method';
#instance_metaclass  'Sugar::Meta::Instance';

1;
