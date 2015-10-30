config-defaults = ->
    livereact:
        extensions: [ \ls, \lsx ]
        options:
            bare: true


config-validate = (config, validators) ->
    errors = []

    if  validators.ifExistsIsObject errors, "lsx config", config.lsx

        if validators.isArrayOfStringsMustExist errors, \lsx.extensions, config.lsx.extensions

            if config.lsx.extensions.length is 0
                errors.push "lsx.extensions cannot be an empty array"

    return errors


compile = ( mimosaConfig, file, cb ) ->
    const code         = file.inputFileText
          options      = mimosaConfig.lsx.options
          coffee-react = require \coffee-react-transform
          livescript   = require \livescript

    output = try
        livescript.compile ( coffee-react code ), options
    catch {error}

    cb error, output


getExtensions  = ( mimosaConfig ) ->
    mimosaConfig.lsx.extensions


module.exports =
    name:         \lsx
    compilerType: \javascript
    extensions:   getExtensions
    compile:      compile
    defaults:     config-defaults
    validate:     config-validate
