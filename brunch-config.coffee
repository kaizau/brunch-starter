#
# Lots of config options available:
#   https://github.com/brunch/brunch/blob/master/docs/config.md
#

module.exports =
  paths:
    watched: [ 'source' ]

  conventions:
    assets: /source\/static/

  files:
    javascripts:
      joinTo:
        'assets/javascripts/package.js': /^source\/assets\/javascripts/
      #entryPoints:
        #'source/assets/javascripts/index.js': 'assets/javascripts/index.js'
    stylesheets:
      joinTo:
        'assets/stylesheets/package.css': /^source\/assets\/stylesheets/

  modules:
    nameCleaner: (path) ->
      path.replace('source/assets/javascripts/', '')
    #autoRequire:
      #'assets/javascripts/package.js': ['index.js']

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
    eslint:
      pattern: /^source\/assets\/javascripts\/.*\.js/
