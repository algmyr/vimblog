---
title: External commands
---

# Run external commands

`vim` integrates very well with your favorite shell commands. Here are some
examples.

## Just running a command
Not immensely useful, but good to know.

`:!command`

## Run command and insert output into file

Sometimes useful, e.g. to get a file listing into your current file so you can
work with the file names.

`:r !ls a.*`

asciinema(MRUvZLhJyZHlcG5Frf8k8sZZb)

## Filter lines of file

This is very powerful. Shell commands are good at working with text through
stdin/stdout, you're working with text. It's a a perfect match.

### Visual selection
asciinema(qvzv4kx5JSnAI2CdVtFC3Vt5c)

### Range
`:%!command`
asciinema(dEfXIGnLifmkcDcNdTLbX1CMm)


## Write lines to a command
Rarely super useful, but it I find occasional uses. E.g. if you have a pastebin script that reads from stdin you could do

`:w !pastebin`
