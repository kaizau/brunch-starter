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

`source/*` directories contain the files that get transformed / copied into the
build.

`public` is where compiled files go. It is completely regenerated before
every `npm start` and `npm run build`.
