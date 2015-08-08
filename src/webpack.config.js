var path = require('path');
module.exports = {
    entry:  {
        popup: path.resolve(__dirname, 'app/popup.cjsx')
    },

    output: {
        path: path.resolve(__dirname, 'build'),
        filename: "[name].entry.js"
    },
    resolve: {
        extensions: ['', '.js', '.jsx', '.coffee', '.cjsx']
    },
    module: {
        loaders: [
            { test: /\.jsx$/, loaders: ['jsx?harmony'] },
            { test: /\.cjsx$/, loaders: ['coffee', 'cjsx']},
            { test: /\.coffee$/, loader: 'coffee' },
            { test: /\.css$/, loader: "style!css" }
        ]
    }
}
