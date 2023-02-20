NAME
====

List::Allmax - Find all of the maximum or minimun elements od a list.

SYNOPSIS
========

```raku
use List::Allmax;

say (^20).roll(50).&all-max;     # values

say (^20).roll(50).&all-max: :k; # keys
```

DESCRIPTION
===========

Raku provides max and min operators to find the maximum or minimum elements of a list. If there is more than one value that evaluates to the maximium, only the first is reported, no matter how many there are. This module provides a remedy for that.

Provides the routines all-max() and all-min() that return all of the elements that evaluate to maximum or minimum value.

Similar to the built-ins, you may request either a list of values or a list of indexes (keys) where those values are located.

If you want to compare based on something other than the values of the individual elements, supply a :by() Callable block to be used as an evaluator. Defaults to {$_} (self).

Note: Only operates on Positional objects. If want to use it on a Hash or some other Associative type, coerce to a Listy object first.

AUTHOR
======

thundergnat <thundergnat@comcast.net>

COPYRIGHT AND LICENSE
=====================

Copyright 2023 thundergnat

This library is free software; you can redistribute it and/or modify it under the Artistic License 2.0.

