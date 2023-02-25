---
title: Visual selections
---

# Visual selections

`vim` has multiple modes for working with visual selections (not to be confused with select mode `gh`).

* `v` puts you into visual mode where you select a range of _characters_.
* `V` puts you into visual line mode where you select a range of _lines_.
* `c-v` puts you into visual block mode where you select a rectangular block of characters.

Presumably you know about these, but let's look at some less known features that you might not know about.

## Switching selection type during selection
Consider you're making a selection you started with `v` and you realize you really wanted to target lines instead.
What do you do, re-do the selection? No, just press the key that would trigger visual line selection `V`.
Of course, the same applies to the other modes.

asciinema(mk9VAqQ4KRNlphHuP3UoirKqt)

## Moving to other ends of the selection
Ever realized you messed up the beginning of a selection and had to re-do it?
There is a better way with `o`, which jumps you to the other end of the selection.

asciinema(XS3GaCxvVNm7dO9XwG4mKM9PU)

Another (more obscure) thing you can do is `O` which jumps to the other side of the selection horizontally.
This doesn't really make a difference for `v` and `V` but will for `c-v`.

In this example I show this off by moving the cursor to the other side with
`O`, diagonally across with `o` and then `O` to jump to the other side. 

asciinema(CcsDKl98ejOf88GIe78UaqV97)

## Multi line insert/append in visual block mode
This is a very useful feature for when you're making similar edits on multiple lines at once.
The basics of it is just to create a visual block selection and then using `I` or `A`.
Here's an example of using `I`.

asciinema(s3psib1y90js2nQT2Wa7UxQvX)

There is a special case for appending to the end of lines, if you do `$` when
doing a block selection you don't target the last character, but you target the
last column of all lines. This means that using `A` in this scenario appends to
end of lines.

Here is a slightly more involved editing task where I use this.
I have the hex literal as left by the last example, but now I want
to have them back as decimal but as strings.

asciinema(jFVv0zmvoPnlokMJIlPRnZ0as)

I make a block selection around the `0x` and `c`hange all of them into a `'`.
I use `gv` to bring back the last visual selection,
and I do `:s/,//` to get rid of the `,` for now.
I again do `gv` to bring back the selection and now do the `$` then `A` to insert `',`.
