config-defaults = ->
    livescriptxml:
        extensions: [ \ls, \lsx ]
        options:
            bare: true


config-validate = (config, validators) ->
    errors = []

    if  validators.ifExistsIsObject errors, "livescriptxml config", config.livescriptxml

        if validators.isArrayOfStringsMustExist errors, \livescriptxml.extensions, config.livescriptxml.extensions

            if config.livescriptxml.extensions.length is 0
                errors.push "livescriptxml.extensions cannot be an empty array"

    return errors


compile = ( mimosaConfig, file, cb ) ->
    const code         = file.inputFileText
          options      = Object.create mimosaConfig.livescriptxml.options
          coffee-react = require \coffee-react-transform
          livescript   = require \livescript

    output = try
        livescript.compile ( coffee-react code ), options
    catch {error}

    cb error, output


getExtensions  = ( mimosaConfig ) ->
    mimosaConfig.livescriptxml.extensions


module.exports =
    name:         \livescriptxml
    compilerType: \javascript
    extensions:   getExtensions
    compile:      compile
    defaults:     config-defaults
    validate:     config-validate
