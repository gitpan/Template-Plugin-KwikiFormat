package Template::Plugin::KwikiFormat;
use strict;
use warnings;
use Kwiki;
use base 'Template::Plugin';
use vars qw($VERSION $FILTER_NAME);

$VERSION = '1.00';
$FILTER_NAME = 'kwiki';

sub new {
    my($self, $context, @args) = @_;
    my $name = $args[0] || $FILTER_NAME;
    $context->define_filter($name, \&kwiki, 0);
    return $self;
}

my $kwiki = Kwiki->new;
$kwiki->load_hub({formatter_class => 'Kwiki::Formatter' });
$kwiki->use_class('formatter');

sub kwiki {
    my $text=shift;
    return $kwiki->formatter->text_to_html($text);
}

1;


__END__

=pod

=head1 NAME

Template::Plugin::KwikiFormat - filter to convert kwiki formatted text to html

=head1 SYNOPSIS

  [% USE KwikiFormat %]
  
  [% FILTER kwiki %]
  
  == title
  
  *bold* /italic/
  
  [% END %]

=head1 DESCRIPTION

A wrapper around Kwiki::Formatter.

Template::Plugin::KwikiFormat allows you to use KwikiFormats in data
displayed by Template::Toolkit.

=head2 MARKUP SYNTAX

See here:

http://www.kwiki.org/?KwikiFormattingRules

=head2 METHODS

=head3 new

generate new plugin

=head3 kwiki

convert text

=head1 AUTHOR

Thomas Klausner, domm@zsi.at, http://domm.zsi.at

With a lot of thanks to Jon Åslund (Jooon) from #kwiki for coming up
with how to do it.

=head1 COPYRIGHT

Copyright 2004, Thomas Klausner, ZSI

You may use, modify, and distribute this package under the same terms
as Perl itself.

=cut
