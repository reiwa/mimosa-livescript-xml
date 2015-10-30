## mimosa-LiveReact

### Overview

This is a LiveScript (XML) compiler for the Mimosa build tool.
Check out livescript.net for more information, examples, usage, and a language reference.

### Usage

Add `\liveReact` your list of modules. Mimosa will install the module for you when you start `mimosa watch` or `mimosa build`.

### Default Config

    livereact:
        extensions: [ \ls, \lsx ]
        options:
            bare: true

### fork

[LiveScript](https://github.com/gkz/LiveScript)

[coffee-react-transform](https://github.com/jsdf/coffee-react-transform)
