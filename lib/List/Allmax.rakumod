unit module List::Allmax;

multi all-max (*@list, Callable :&by = {$_}, :$k = False) is export  {
    if @list.is-lazy { X::Cannot::Lazy.new(action =>'all-max').throw }
    my @max-list;
    my $max = @list[0];
    my &comp = { &by($^a) cmp &by($^b) }
    if $k {
        for ^@list {
            if comp(@list[$_], $max) == 0 {
                @max-list.push: $_;
            } elsif comp(@list[$_], $max) > 0 {
                $max = @list[$_];
                @max-list = $_
            }
        }
    } else {
        for @list {
            if comp($_, $max) == 0 {
                @max-list.push: $_;
            } elsif comp($_, $max) > 0 {
                $max = $_;
                @max-list = $_
            }
        }
    }
    @max-list
}

multi all-min (*@list, Callable :&by = {$_}, :$k = False) is export  {
    if @list.is-lazy { X::Cannot::Lazy.new(action =>'all-min').throw }
    my @min-list;
    my $min = @list[0];
    my &comp = { &by($^a) cmp &by($^b) }
    if $k {
        for ^@list {
            if comp(@list[$_], $min) == 0 {
                @min-list.push: $_;
            } elsif comp(@list[$_], $min) < 0 {
                $min = @list[$_];
                @min-list = $_
            }
        }
    } else {
        for @list {
            if comp($_, $min) == 0 {
                @min-list.push: $_;
            } elsif comp($_, $min) < 0 {
                $min = $_;
                @min-list = $_
            }
        }
    }
    @min-list
}


=begin pod

=head1 NAME

List::Allmax - Find all of the maximum or minimun elements od a list.

=head1 SYNOPSIS

=begin code :lang<raku>

use List::Allmax;

say (^20).roll(50).&all-max;     # values

say (^20).roll(50).&all-max: :k; # keys

=end code

=head1 DESCRIPTION

Raku provides max and min operators to find the maximum or minimum elements of
a list. If there is more than one value that evaluates to the maximium, only the
first is reported, no matter how many there are. This module provides a remedy
for that.

Provides the routines all-max() and all-min() that return all of the elements
that evaluate to maximum or minimum value.

Similar to the built-ins, you may request either a list of values or a list of
indexes (keys) where those values are located.

If you want to compare based on something other than the values of the individual
elements, supply a :by() Callable block to be used as an evaluator. Defaults to
{$_} (self).


Note: Only operates on Positional objects. If want to use it on a Hash or some
other Associative type, coerce to a Listy object first.


=head1 AUTHOR

thundergnat <thundergnat@comcast.net>

=head1 COPYRIGHT AND LICENSE

Copyright 2023 thundergnat

This library is free software; you can redistribute it and/or modify it under the Artistic License 2.0.

=end pod
