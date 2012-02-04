package Arthas::Defaults;

use v5.14;
use warnings;
use utf8;
use feature();
use version;
use Carp;
use Try::Tiny;

our $VERSION = qv("v2.0.0");

require Exporter;
our @ISA       = ('Exporter');
our @EXPORT    = qw/
    carp croak confess cluck
    try catch finally
/;

sub import {
    feature->import(':5.14');
    warnings->import();
    warnings->unimport('uninitialized');
    utf8->import();

    # Export all @EXPORT
    Arthas::Defaults->export_to_level(1, @_);
}

sub unimport {
    feature->unimport();
    warnings->unimport();
    utf8->unimport();
    Carp->unimport();
    Try::Tiny->unimport();
}


=head1 NAME

Arthas::Defaults - Defaults for coding - Do not use if you're not Arthas

=head1 SYNOPSIS

    use Arthas::Defaults;

=head1 DESCRIPTION

It's like saying:

    use v5.14;
    use utf8;
    use warnings;
    no warnings 'uninitialized';
    use Carp qw/carp croak confess cluck/;
    use Try::Tiny;

Might change without notice, at any time. DO NOT USE!

=item C<use v5.14>

This is actually C<use feature ':5.14'>. It imports some perl 5.10 -> 5.14
semantics, such as strictures, given-when syntax, Unicode strings, ... See
L<feature> documentation and source code for more information.

=item C<use utf8>

This is NOT related to handling UTF-8 strings or input/output (see
C<use feature 'unicode_strings'> imported with C<use v5.14> for
something more related to that).

C<use utf8> is improted to allow UTF-8 characters inside the source
code: while using UTF-8 in the source is not standard procedure, it
happens to me every now and then. Also, enabling this feature does
no harm if you're using a recent version of perl, so why no enable it?

=item C<use warnings>

Warnings are useful, who wouldn't want them?

=item C<no warnings 'uninitialized'>

Well, I<most> warnings are useful. The ones regarding uninitialized (undef)
variables are a bit of a pain. Writing a code such as this:

    my $str;
    
    if ( $str eq 'maya' ) {
        say 'Maya!';
    }

would yeld to a warning, thus forcing you to write:

    my $str;
    
    if ( defined $str && $str eq 'maya' ) {
        say 'Maya!';
    }

which is boring enough to justify suppressing these warnings.

=item C<use Carp qw/carp croak confess cluck/>

These functions are very useful to show error details better
than that of C<die()> and C<warn()>.

=item C<use Try::Tiny>

L<Try::Tiny> provides minimal C<try/catch/finally> statements,
which make for interesting sugar and a few nice features over
C<eval>.

=back

=head1 AUTHOR

Michele Beltrame, C<mb@italpro.net>

=head1 LICENSE

This library is free software . You can redistribute it and/or modify
it under the same terms as perl itself.

=cut

1;
