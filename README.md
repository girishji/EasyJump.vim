# EasyJump.vim

Jump to any location by typing 2 characters.

- Mapped to `,` but any other trigger (like `s`) can be configured.
- Vim idioms supported. Use `d,xy` to delete, `c,xy` to change, `v,xy` to select visually, etc.
- Jump list (`:jumps`) updated so that you can jump back using `<c-o>`.
- Does not alter the buffer. Uses virtual text. Written in vim9 script.
- Does not block the character you are trying to jump to.

🚀 **Jump (ex. `,cd`)**: Type `,` and `c` (say) and you'll see new letters (virtual text) appear next to all the occurrences of `c`. Type `d` (for instance) and cursor jumps to `c` next to `d`.

<img src='img/img1.jpeg' width='700'>

🚀 **Jump back**: Type `<c-o>` (control-O). Jump forward with `<tab>` or `<c-i>'.

🚀 **Visual Select (ex. `v,cd`)**: To visually select a block of text starting
from cursor position to some occurrence of `c` type `v,c` and then type the
highlighted character (say `d`).

<img src='img/img2.jpeg' width='700'>

🚀 **Operator Pending**: `d,xy` to delete, `c,xy` to change text.

Type `<esc>` to **cancel** the jump.

Above illustrations use `:colorscheme quiet`.

**What if there is no letter next to where you want to jump to?**

This happens when there are not enough available unique letters. Simply type
`<Tab>` (or `,`, or `;`) and you'll see letters appear in remaining
locations.

One trick to simply hop to some line quickly is to search for
'space' character (assuming that line has a space). Type `, ` (`,` followed by `<space>`).

**Motivation:** For a long time I have used relative numbers with `j`/`k` along
with `f`/`t` commands to jump. But I always found it distracting to shift focus to the left to
look up the line number. This plugin helps you keep your eyes on the
target. I think this is the missing motion of Vim.

# Requirements

- Vim >= 9.0

# Installation

Install using [vim-plug](https://github.com/junegunn/vim-plug). Put the following in `.vimrc` file.

```
vim9script
plug#begin()
Plug 'girishji/easyjump.vim'
plug#end()
```

Legacy script:

```
call plug#begin()
Plug 'girishji/easyjump.vim'
call plug#end()
```

Or use Vim's builtin package manager.

# Configuration

### Trigger Key

By default `,` is the trigger key. To disable it put the following in `.vimrc`
file. `,` will be restored to Vim original keybinding (`:h ,`).

```
g:easyjump_default_keymap = false
```

To make `s` trigger the jump put the following in `.vimrc` file. Any other key
can also be used instead of `s`.

```
nmap s <Plug>EasyjumpJump;
omap s <Plug>EasyjumpJump;
vmap s <Plug>EasyjumpJump;
```

### Case

The destination character you type is compared against visible buffer text. To make the search case sensitive (case), insensitive (icase), or smart case (smart) put the following in `.vimrc`.

```
g:easyjump_case = 'smart' # Can be 'case', 'icase', or 'smart' (default).
```

### Highlight

The virtual text that appears next to destination locations uses highlighted group `EasyJump`. It is linked to `MatchParen` by default. Set this group using `:highlight` command to change colors.

### Letters

Jump locations are prioritized based on the distance from the cursor. Virtual text letters are placed in this order, with at least one letter per line. The order of letters can be changed by assigning to the following variable.

```
g:easyjump_letters = 'asdfgwercvhjkluiopynmbtqxzASDFGWERCVHJKLUIOPYNMBTQXZ0123456789'
```
