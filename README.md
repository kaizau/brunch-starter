## Getting Started

This template runs on [Brunch](http://brunch.io/), which is similar to Gulp /
Grunt-based static site workflows, minus 74.2% of the hassle and configuration.

It has been customized to make use of ES6, Stylus, and Jade. It renames files
wrapped in `DIGEST(filename.css)` to enable cache-busting. It generates source
maps. It integrates JShint running on airbnb/javascript settings.

```sh
npm install     # install dependencies
npm start       # start local dev server
npm run build   # build for production
```

## Getting Around

```
source
| assets
| | javascripts
| | stylesheets
| static
| | images
| content
public
brunch-config.coffee
```

**source** directories contain the files that get transformed / copied into the
build.

**public** is where compiled files go. It is completely regenerated before
every `npm start` and `npm run build`.

## Getting Serious

Jade templates are compiled into **public** relative to their directory
structure in **source/content**. Changing this is just a matter of editing
`plugins.jadeStatic.formatPath()` in **brunch-config.coffee**.

Jade templates have access to a `__` local variable that holds the `filepath`
and `directory` properties. These can be used to add an `.active` class to
menus, which is way tricker than it should be.

Styling hot fixes and experiments should go in **_INBOX.styl** until they can
be integrated in a more thoughtful way. This keeps the rest of the styles from
getting out of control.

## TODO

- Add a Stylus linter
- Write a Jade helper to determine whether we're on the current template
- Implement image optimization
