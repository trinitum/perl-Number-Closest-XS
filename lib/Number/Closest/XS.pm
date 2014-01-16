package Number::Closest::XS;
use 5.010;
use strict;
use warnings;
our $VERSION = "0.01";
my $XS_VERSION = $VERSION;
$VERSION = eval $VERSION;

require XSLoader;
XSLoader::load( "Number::Closest::XS", $XS_VERSION );

use base 'Exporter';
our @EXPORT_OK = qw(find_closest_numbers find_closest_numbers_around);
our %EXPORT_TAGS = (all => [@EXPORT_OK]);

=head1 NAME

Number::Closest::XS - Perl extension ...

=head1 VERSION

0.01

=head1 SYNOPSIS

    use Number::Closest::XS;

=head1 DESCRIPTION

=head1 METHODS

=cut

1;

__END__

=head1 AUTHOR

Pavel Shaydo C<< <zwon at cpan.org> >>

=head1 LICENSE AND COPYRIGHT

Copyright (C) 2014 Pavel Shaydo

This program is free software; you can redistribute it and/or modify it
under the terms of either: the GNU General Public License as published
by the Free Software Foundation; or the Artistic License.

See http://dev.perl.org/licenses/ for more information.

=cut
