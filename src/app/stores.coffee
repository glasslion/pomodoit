Reflux = require('reflux')

actions = require('./actions')


TodoListStore = Reflux.createStore
    listenables: actions.TodoListActions

    getInitialState: () ->
        []

    onFetchTodoList: ()->
        timestamp = Date.now()
        jQuery.ajax({
            url: "https://i.doitim.com/api/tasks/today?_=#{timestamp}",
            dataType: 'json',
            type: 'GET',
            xhrFields: {
                withCredentials: true
            }
            success: (data) =>
                @trigger(data.entities)
            error: (xhr, status, err) ->
                console.log(status, err.toString())
        });




module.exports.TodoListStore = TodoListStore
