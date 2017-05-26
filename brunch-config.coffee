#
# http://brunch.io/docs/config.html
#

config =
  paths:
    watched: [ 'source' ]

  conventions:
    assets: /source\/static/

  files:
    javascripts:
      joinTo:
        'assets/javascripts/package.js': [
          'node_modules/**/*.js'
          'source/javascripts/**/*.js'
        ]
    stylesheets:
      joinTo:
        'assets/stylesheets/package.css': [
          'source/stylesheets/**/*.styl'
        ]

  modules:
    nameCleaner: (path) ->
      path.replace('source/javascripts/', '')
    autoRequire:
      'assets/javascripts/package.js': ['global.js']

  npm:
    enabled: true
    static: []

  plugins:
    babel:
      presets: ['es2015']
    copyfilemon:
      'assets/images': ['source/images']
    digest:
      referenceFiles: /\.(html|js)$/
    jadeStatic:
      basedir: 'source/content'
      formatPath: (path) =>
        path.match(/^source\/content\/(.+)\.jade/)[1]
      pretty: true
      locals:
        BRUNCH_ENV: process.env.BRUNCH_ENV || 'development'
    stylus:
      plugins: ['jeet']
      includeCss: true
    eslint:
      pattern: /^source\/javascripts\/.*\.js/
    envstatic:
      prefix: '$ENV_'
      pattern: /\$ENV_(\w+)/g
      referenceFiles: /\.(js|html)$/
      variables:
        CUSTOM_VAR: ''

  overrides:
    production:
      envstatic:
        variables:
          CUSTOM_VAR: ''

module.exports = config
