---
title: Search and global commands
---

# Searching

I assume you're aware of using `/` and `?` for searching forward and backwards.
Let's look into some maybe less known things.

## Search for word under cursor

In normal mode: `*` to search forward

asciinema(B0eHrAVySbCDgmiSzRxyeOvKH)

and `#` to search backward

asciinema(2mP08bq1SvxoyBIPymID1RhHM)

## Using last search as a pattern

Say you have searched for something and now you want to replace it.
Isn't it annoying to have to either copy or rewrite the regex you just wrote?
You don't have to, if you leave the pattern empty it will use the last used pattern.

Here I do `*` to trigger a search for the thing under my cursor and then do a replacement.

asciinema(dtt7xa59oRvVgYOgXQVVoO7j5)

# Global commands

Ever wanted to do actions on rows matching a pattern?

## "Positive" global command
`:g/regex/action` optionally you can also supply a range or make a visual line selection.
In this example `:g/bleh/d` deleted all lines containing bleh.

asciinema(vv8Jtp5HPPK58nxNwxEetoQoV)

## "Negative" global command
`:v/regex/action` same thing but the match is inverted.

## Combined with `norm`
`norm` allows you to write sequences like you would in normal mode.
Here, append a `;` to non-empty lines that don't currently end in one.

`:v/;$\|^$/norm A;`

asciinema(s4rQ9J4wJAJttWN57mVu0IduV)

## ...and combined with macros
Fixing up some nested tuples. I record the macro `I[<esc>$i]<esc>` into
register `q` use a global command to run on lines matching a regex.

`:g/[0-9],$/norm @q`

asciinema(3TP0tj2cUeM8Jin1FAPLoXULM)
