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
        'assets/javascripts/package.js': /^source\/assets\/javascripts/
    stylesheets:
      joinTo:
        'assets/stylesheets/package.css': 'source/assets/stylesheets/package.styl'
    templates:
      joinTo: 'assets/javascripts/package.js'

  modules:
    nameCleaner: (path) ->
      path.replace('source/assets/javascripts/', '')
    autoRequire:
      'assets/javascripts/package.js': ['global.js']

  plugins:
    babel:
      presets: [ 'es2015' ]
    copyfilemon:
      'assets/images': ['source/assets/images']
    jadeStatic:
      basedir: 'source/content'
      formatPath: (path) =>
        path.match(/^source\/content\/(.+)\.jade/)[1]
      pretty: true
    stylus:
      includeCss: true
