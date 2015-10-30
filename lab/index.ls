config-defaults = ->
    livereact:
        extensions: [ \ls, \lsx ]
        options:
            bare: true


config-validate = (config, validators) ->
    errors = []

    if  validators.ifExistsIsObject errors, "livereact config", config.livereact

        if validators.isArrayOfStringsMustExist errors, \livereact.extensions, config.livereact.extensions

            if config.livereact.extensions.length is 0
                errors.push "livereact.extensions cannot be an empty array"

    return errors


compile = ( mimosaConfig, file, cb ) ->
    const code         = file.inputFileText
          options      = mimosaConfig.livereact.options
          coffee-react = require \coffee-react-transform
          livescript   = require \livescript

    output = try
        livescript.compile ( coffee-react code ), options
    catch {error}

    cb error, output


getExtensions  = ( mimosaConfig ) ->
    mimosaConfig.lsx.extensions


module.exports =
    name:         \livereact
    compilerType: \javascript
    extensions:   getExtensions
    compile:      compile
    defaults:     config-defaults
    validate:     config-validate
