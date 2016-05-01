## Getting Started

This template runs on [Brunch](http://brunch.io/), which is similar to Gulp /
Grunt-based static site workflows, minus 74.2% of the hassle and configuration.

It has been customized to make use of ES6, Stylus, and Jade. It renames files
wrapped in `DIGEST(filename.css)` to enable cache-busting. It generates source
maps. It integrates JShint running on airbnb/javascript settings.

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
public
brunch-config.coffee
```

**source** directories contain the files that get transformed / copied into the
build.

**public** is where compiled files go. It is completely regenerated before
every `npm start` and `npm run build`.

## Getting Serious

**Jade**

Jade templates are compiled into **public** relative to their directory
structure in **source/content**. Changing specific files just a matter of
editing `plugins.jadeStatic.formatPath()` in **brunch-config.coffee**.

Jade has a powerful layout/extension system. You basically define "ad-lib"
blocks in your layout markup (e.g. `content`, `headScripts`, `headMeta`) that
correspond with areas where content is likely to differ.  When you extend a
template, you can then fill in / override each of these blocks.  Much better
than chasing down a thousand "partials."

Jade templates have access to a `__` local variable that holds the `filepath`
and `directory` properties. These can be used to add an `.active` class to
menus, which is still way tricker than it should be.

**JS**

Brunch is opinionated about modules, which is a good thing. Default settings
wrap all files as Common.JS modules and writes them to **package.js**. You must
then `require()` files by their filename (relative to
**source/assets/javascripts**) in order to use them. The only exception is
**global.js** which is immediately loaded at the end of **package.js**.

**Stylus**

Styling hot fixes and experiments should go in **_INBOX.styl** until they can
be integrated in a more thoughtful way. This keeps the rest of the styles from
getting out of control.

Currently, we're using a hotfixed version of `stylus-brunch`, because open
source.

## TODO

- Add a Stylus linter
- Write a Jade helper to determine whether we're on the current template
- Implement image optimization
