# The _fontawesome_free_ package

## Up-to-date LuaLaTeX support for Font Awesome

There are several packages on CTAN that provide access to the free Font Awesome icons, but these have all become outdated and are missing many icons from newer versions of Font Awesome. The _fontawesome_free_ package deals with this problem by building the LaTeX support dynamically from data in the fonts themselves; updating the package is as simple as replacing the font files with newer ones. The drawback of this approach is that the package only works with LuaLaTeX.


## Installation

This package is installed by copying the contents of the `texmf/` directory to either your `$TEXMFLOCAL` or your `$TEXMFHOME` tree. Installing it in `$TEXMFLOCAL` will make the package available to all users on your system; installing it in `$TEXMFHOME` makes it available just for you. The exact values of `$TEXMFLOCAL` and `$TEXMFHOME` depend on your TeX installation; see your installation's documentation. If you are using TeX Live, you can find the value of these variables by running

    kpsewhich -expand-var '$TEXMFLOCAL'

and similarly for `$TEXMFHOME`.


## Usage

The _fontawesome_free_ package contains all icons from the free subset of the Font Awesome fonts. The package provides one command, `\fa`, with a single mandatory argument: the name of the icon. Some icons have light or 'open' variants. Those variants are accessed by adding `-o` to the icon name: `\fa{file-pdf-o}` versus `\fa{file-pdf}`. A full list of icons and their names is included in the documentation.

By default, the Font Awesome icons have varying widths. The `\fa` command has a starred variant `\fa*` that produces fixed-width icons, by centering them in a 1.25em wide box.


## Copyright

The fonts are Copyright 2024 Fonticons, Inc. (https://fontawesome.com) with Reserved Font Name: "Font Awesome".

All other files are Copyright 2024 Marc Penninga.


## License

The Font Awesome Free fonts are released under the SIL Open Font License, version 1.1.
The rest of this package is released under the LaTeX Project Public License, version 1.3c.

All brand icons are trademarks of their respective owners.
The use of these trademarks does not indicate endorsement of the trademark holder by Font Awesome or the author, nor vice versa.
**Please do not use brand logos for any purpose except to represent the company, product, or service to which they refer.**
