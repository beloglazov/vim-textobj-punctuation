# vim-textobj-punctuation

`vim-textobj-punctuation` is a Vim plugin providing text objects `iu` and `au`
(`u` stands for pUnctuation, as `p` is already taken for paragraphs) for
capturing the text between the current cursor position and a punctuation
character in front. This punctuation character can be one of: `,`, `.`, `:`,
`;`, `!`, and `?`. The text object can span multiple lines to reach the closest
punctuation character. Some examples (the cursor is shown with `|`):

- Before: `String |foo = "bar";`; after pressing `diu`: `String |;`
- Before: `if |i == 42:`; after pressing `diu`: `if |:`
- Before: `Vim is |a nice editor!`; after pressing `ciuthe best editor ever`:
  `Vim is the best editor ever!`


## Installation

This plugin requires
[vim-textobj-user](https://github.com/kana/vim-textobj-user) to be installed. If
you are using Vundle, just add the following lines to your `.vimrc`:

```
Bundle 'kana/vim-textobj-user'
Bundle 'beloglazov/vim-textobj-punctuation'
```

Then run `:BundleInstall` to install the plugins.


## Configuration

As most of the time, you need to operate on the text until punctuation, I add
the following bindings to make it even more convenient to use:

```
xmap u iu
omap u iu
```

Now, you just need to press `cu`, `du`, `yu`, or `vu` to operate on the text
until the closest punctuation.


Enjoy! :)


## License

Copyright (c) Anton Beloglazov. Distributed under the same terms as Vim itself.
See :help license.
