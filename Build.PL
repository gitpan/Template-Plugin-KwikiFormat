use strict;
use warnings;
use Module::Build;
use File::Spec::Functions;

my $build = Module::Build->new
  (
   module_name => 'Template::Plugin::KwikiFormat',
   license     => 'perl',
   requires    => {
		   'Template' => 2.07,
		   'Kwiki'=>0.33,
		  },
   create_makefile_pl=>'passthrough',
);



$build->create_build_script;
