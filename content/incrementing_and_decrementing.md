---
title: Incrementing and decrementing
---

# Incrementing and decrementing

A useful feature that might not be super well knows is the ability to increment and decrement with `C-a` and `C-x`.

## Basic usage

Use `C-a` to increment and `C-x` to decrement, optionally prefixed by a count.
Note that `vim` will jump to the next thing it can increment/decrement in the line.

Here I increment/decrement the first number,
show that it jumps to the next relevant location in the line,
and finally use a count with `1000<C-a>`.

asciinema(u3IQ2BGQ16Au2KqsRdTA32cVY)

## Usage with a selection

If you make a selection and try to increment/decrement it will do so per line,
taking your selection into account.
So the first valid thing in the line that is inside the selection will be targeted.

asciinema(0bdcvVBYSiYhKT1a9aLgsiSXn)

There is another more obscure feature by prefixing the action with `g`.
This will increment the numbers with an increasing sequence.
I think an example shows it off better than anything else.

Here I create a line "0. item" and duplicate it a few times.
I visually line select everything (`ggVG`) and do `g <c-A>`.

asciinema(PN45fc01eQ2LrOhUBD99Pdx3I)

## Settings that affect usage
By default incrementing/decrementing works not only for decimal numbers but also on binary and hexadecimal numbers.

asciinema(yKsVIo6FtTuTETHNkNRXzXo3R)

The two other modes available is "octal" and "alpha".
The latter one is weird but might occasionally be useful.
Note that it only works on single characters, so "z" won't turn into "aa" on increment.

asciinema(um2yGsUBaxlJ5d52Hx3Am5ET1)
