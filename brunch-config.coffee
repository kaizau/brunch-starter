#
# Lots of config options available:
#   https://github.com/brunch/brunch/blob/master/docs/config.md
#

module.exports =
  paths:
    watched: [ 'source' ]

  conventions:
    assets: 'source/static'

  files:
    javascripts:
      joinTo:
        'assets/javascripts/vendor.js': /^node_modules/
        'assets/javascripts/package.js': /^source\/assets\/javascripts/
    stylesheets:
      joinTo:
        'assets/stylesheets/package.css': 'source/assets/stylesheets/package.styl'
    templates:
      joinTo: 'assets/javascripts/package.js'

  plugins:
    babel:
      presets: [ 'es2015' ]
    jadeStatic:
      basedir: 'source/content'
      formatPath: (path) =>
        path.match(/^source\/content\/(.+)\.jade/)[1]
      pretty: true
    stylus:
      includeCss: true
