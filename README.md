## Getting Started

This "app" runs on [Brunch](http://brunch.io/), a static site generator that
leverages npm, ES6, Stylus, Jade, etc.

```sh
npm install     # install dependencies
npm start       # start dev server at http://localhost:8080
npm run build   # build for production
```

## Getting Around

```
source
| assets
| | images
| | javascripts
| | stylesheets
| static
| content
| | index.jade
public/
brunch-config.coffee
package.json
```

**source** directories contain the files that get transformed / copied into the
build.

**source/static** is copied as-is into the generated files.

**public** is where compiled files go. It is completely regenerated before
every `npm start` and `npm run build`.

## Getting Serious

### Jade

Jade templates are compiled into **public** relative to their directory
structure in **source/content**. Overriding specific files just a matter of
editing `plugins.jadeStatic.formatPath()` in **brunch-config.coffee**.

Jade has a powerful layout/extension system. You basically define "mad-lib"
blocks in your layout markup (e.g. `content`, `headScripts`, `headMeta`) that
correspond with blocks of markup. When you extend a template, you can then fill
in / override each of these blocks.

Jade templates have access to a `__` local variable that holds the `filepath`
and `directory` properties. These can be used to add an `.active` class to
menus, which is still way tricker than it should be.

Asset cache-busting is supported via `DIGEST(filename.css)`.

### JS

Brunch is opinionated about modules, which is a good thing. Default settings
wrap all files as Common.JS modules and writes them to **global.js**. You must
then `require()` files by their filename (relative to
**source/assets/javascripts**) in order to use them.

### Stylus

Styling hot fixes and experiments should go their corresponding root file (the
one that @imports all other files) so that they can be integrated in a more
thoughtful way. This keeps the rest of the styles from getting out of control.

As for CSS conventions, here's the quick gist:

`.CapitalCase` is for top-level modules. That is, this class is a self-enclosed
"noun" and probably corresponds with a similarly-named JS module. Module
relationships should be made as clear as possible, arranged left-to-right in
order of specificity (e.g. `.Header` and `.HeaderTray`).

`.L-prefixed` is for general layout classes. Semantics aside, it's much easier
to reason about UI layout when it's separated from content-specific styling.

`.with-prefixed` is for general helpers. Similar to the previous point, it is
sometimes more elegant to describe a common styling pattern than a one-off
element.

Any other `.lowercase` is a child class. That is, it only receives styles if
nested below its corresponding `.CapitalCase` class.
