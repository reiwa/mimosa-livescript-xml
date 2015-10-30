exports.config =
    modules: [ \eslint, \copy, \livescript ]
    watch:
        sourceDir:     \lab
        compiledDir:   \src
        javascriptDir: null
    eslint:
        options:
            rules:
                "no-global-strict":     0
                "no-underscore-dangle": 0
            env:
                node: true
