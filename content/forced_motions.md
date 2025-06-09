---
title: Forced motions
---

# Forced motions

You are probably familiar with the usual verb + noun/motion grammar of vim.
E.g. `dw` is delete word and `d%` deleted from the cursor to the next matching
delimiter.

One gotcha/annoyance with `d%` is that it is a charwise motion, which might not
be what you want.

Enter forced motions, where you basically enter an adjective between the verb
and the noun. The relevant adjectives here are

* `v` charwise
* `V` linewise
* `<C-v>` blockwise

So if like me your goal was to delete all the lines delimited by a matching {}
then you would have wanted `dV%`.

For more information, see `:h forced-motion`.
