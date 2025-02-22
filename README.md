# cdhist.yazi - cdhist plugin for Yazi

[Yazi][yazi] plugin for [cdhist][cdhist] to fuzzy select and navigate within
[Yazi][yazi] from your directory history.

## Installation

Use the [yazi package
manager](https://yazi-rs.github.io/docs/cli#package-manager) to install this
plugin:

```bash
ya pack -a bulletmark/cdhist
```

Then add to your [`~/.config/yazi/keymap.toml`](https://yazi-rs.github.io/docs/configuration/keymap):

```toml
[[manager.prepend_keymap]]
on   = "<A-c>"
run  = "plugin cdhist -- _ --fuzzy=fzf"
desc = "Select a directory from history using cdhist"
```

Make sure you have [cdhist][cdhist] installed, and can be found in `PATH`.

The above assigns `Alt-c` key mapping within yazi to bring up the fuzzy search
because it is the standard key mapping for [opening fzf on
directories](https://github.com/junegunn/fzf?tab=readme-ov-file#key-bindings-for-command-line)
and for [using with
cdhist](https://github.com/bulletmark/cdhist#fuzzy-finder-integration).
However, you may prefer to remap the standard `z` key mapping in yazi to
replace [`zoxide`](https://yazi-rs.github.io/docs/quick-start/#navigation), or
use a spare key like the `C` key.

Note that any of the popular command line fuzzy search finders such as
[`fzf`][fzf], [`sk`][skim], [`tv`][television], or [`fzy`][fzy] can be used in
the above configuration setting. Or leave the `--fuzzy` option out to use
native simple [cdhist index selection](https://github.com/bulletmark/cdhist#example-usage).

[yazi]: https://yazi-rs.github.io/
[cdhist]: http://github.com/bulletmark/cdhist
[fzf]: https://github.com/junegunn/fzf
[fzy]: https://github.com/jhawthorn/fzy
[skim]: https://github.com/skim-rs/skim
[television]: https://github.com/alexpasmantier/television
