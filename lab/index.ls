config-defaults = ->
    cjsx:
      extensions: [ \cjsx ]
      options: {}


config-placeholder = ->
    """
    \t\n\n
    cjsx:                       # config settings for the cjsx compiler module\n" +
        lib: undefined          # use this property to provide a specific version of cjsx-tools\n" +
        extensions: [\"cjsx\"]  # default extensions for cjsx files\n" +
        options: {}             # default options will get passed to coffee compiler\n"
    """

config-validate = (config, validators) ->
    var errors = []

    if  validators.ifExistsIsObject errors, "lsx config", config.cjsx

        if !config.cjsx.lib
            config.cjsx.lib = require( "coffee-react" )

        if validators.isArrayOfStringsMustExist errors, \lsx.extensions, config.cjsx.extensions
            if config.cjsx.extensions.length is 0
                errors.push "lsx.extensions cannot be an empty array"

    return errors


compile        = ( mimosaConfig, file, cb ) ->
    const output  = null
          error   = null
          text    = file.inputFileText
          options = mimosaConfig.cjsx.options
    try
        output = mimosaConfig.cjsx.lib.compile text, options
    catch ( err ) ->
        error  = err
    cb error, output


getExtensions  = ( mimosaConfig ) ->
    mimosaConfig.cjsx.extensions


module.exports =
    name:         \clx
    compilerType: \javascript
    defaults:     config-defaults
    placeholder:  config-placeholder
    validate:     config-validate
    compile:      compile
    extensions:   getExtensions
