[![Actions Status](https://github.com/thundergnat/List-Allmax/actions/workflows/test.yml/badge.svg)](https://github.com/thundergnat/List-Allmax/actions)

NAME
====

List::Allmax - Find all of the maximum or minimum elements of a list.

SYNOPSIS
========

```raku
use List::Allmax;

say (^20).roll(50).&all-max;     # values

say (^20).roll(50).&all-max: :k; # keys

say [1,2,3,4,5,5,4,3,2,1,2,2,5,4,4].classify({$_}).sort.List.&all-max( :by(+*.value) );
# [2 => [2,2,2,2], 4 => [4,4,4,4]]
```

DESCRIPTION
===========

Raku provides max and min routines to find the maximum or minimum elements of a list. If there is more than one value that evaluates to the maximum, (minimum) only the first is reported, no matter how many there may be. This module provides a remedy for that.

Provides the routines all-max() and all-min() that return _all_ of the elements that evaluate to maximum or minimum value.

Similar to the built-ins, you may request either a list of values or a list of indicies (keys) where those values are located.

If you want to compare based on something other than the values of the individual elements, supply a :by() Callable block to be used as an evaluator. Defaults to {$_} (self).

Note: Only operates on Positional objects. If want to use it on a Hash or some other Associative type, coerce to a Listy type object first.

AUTHOR
======

thundergnat <thundergnat@comcast.net>

COPYRIGHT AND LICENSE
=====================

Copyright 2023 thundergnat

This library is free software; you can redistribute it and/or modify it under the Artistic License 2.0.

