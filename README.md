Gitstatusd plugin for Oh-My-{Ba,Z}sh
------------------------------------

Add support for the [gitstatus](https://github.com/romkatv/gitstatus) tool in
both [Oh-My-Bash](https://github.com/ohmybash/oh-my-bash) and
[Oh-My-Zsh](https://github.com/ohmyzsh/ohmyzsh). The gitstatus makes polling for git
repository status much faster, reducing lag on updating the shell prompt.

The plugin, called `gitstatusd`, overrides the `git_prompt_info` function
provided by either framework, effectively changing which tool is used to poll
for git repository information.

_This has been tested with Oh-My-Zsh's tjkirch theme._

Setup
=====

The plugin depends on `gitstatus`, and expects it to be installed system-wide.
Follow the install instructions of `gitstatus`.

To use the plugin, clone this repository into the `customs/plugins/` directory
of the frameworks top-dir. After this, updated the RC to use the plugin. Start a
new shell and enjoy!

Todo
====

The plugin is currently very limited, implementing only the most basic support.

- implement most (all?) function in the `lib/git.{zsh,sh}` file, making
    `gitstatus` implicitly available for all themes.
- add support for beautifying the git prompt (maybe this is something for themes
    to do, not a plugin?)
- implement tests/CI to make sure this works for a variety of setups.

<!-- :vim textwidth=80 -->
