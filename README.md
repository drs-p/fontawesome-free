# The <span class=sans-serif>fontawesome-free</span> package

## Up-to-date LuaLaTeX support for Font Awesome


### Introduction

There are several packages on CTAN that provide access to the free *Font
Awesome* icons, but these have become outdated and are missing many
icons from newer versions of Font Awesome. The <span
class="sans-serif">fontawesome-free</span> package attempts to deal with
the update problem by building the support dynamically from data in the
fonts themselves; updating the package is then as simple as replacing
the font files with newer ones. The drawback of this approach is that
the package only works with LuaLaTeX.

### Installation

This package is not (yet?) available from CTAN, so it must be installed
manually; this is done by copying the contents of the `texmf/` directory
to either your `$TEXMFLOCAL` or your `$TEXMFHOME` tree. Installing it in
`$TEXMFLOCAL` will make the package available to all users on the system,
but may require administrator rights; installing it in `$TEXMFHOME`
makes it available only for your user. The exact values of `$TEXMFLOCAL`
and `$TEXMFHOME` depend on your TeX installation; see your installation’s
documentation for more information.

If you are using TeX Live (or another TeX distribution that uses
the `kpathsea` library), you can find the value of these variables by
running

<div class="center">

`kpsewhich -expand-var '$TEXMFLOCAL'`

</div>

and similarly for `$TEXMFHOME`.

### Usage

The <span class="sans-serif">fontawesome-free</span> package contains
all icons from the free subset of the Font Awesome fonts. The package
provides one command, `\fa`, with a single mandatory argument:
the _name_ of the icon.

Some icons have light or open variants. Those variants are accessed
by adding `-o` to the icon name: `\fa{face-smile-o}` versus `\fa{face-smile}`.
A list of all icons and their names is included in the appendices
of the [manual](https://github.com/drs-p/fontawesome-free/blob/main/texmf/doc/latex/fontawesome-free/fontawesome-free.pdf).

The Font Awesome icons have varying widths. The `\fa` command has
a starred variant `\fa*` that produces fixed-width icons,
by centering them in a 1.25em wide box.

### Copyright

The font files are Copyright 2024 Fonticons, Inc. (<https://fontawesome.com>)
with Reserved Font Name: “Font Awesome”.
All other files are Copyright 2024-2025 Marc Penninga.

### License

The Font Awesome Free fonts are released under the SIL Open Font
License, version 1.1. The rest of this package is released under the
LaTeX Project Public License, version 1.3c.

All brand icons are trademarks of their respective owners. The use of
these trademarks does not indicate endorsement of the trademark holder
by Font Awesome or the author, nor vice versa. **Please do not use brand
logos for any purpose except to represent the company, product, or
service to which they refer.**

