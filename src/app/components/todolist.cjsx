React = require('react');
ReactDOM = require('react-dom')
Reflux = require('reflux')

stores = require('../stores')
actions = require('../actions')


TodoItem = React.createClass
    render: ->
        <li className="item">
            <i className="fa fa-chevron-right folder"></i>
            <span>{this.props.data.title}</span>
        </li>

TodoList = React.createClass
    mixins: [Reflux.connect(stores.TodoListStore, "todoList")],

    render: ->
        <div className="todo-list">
            <div className="todo-main">
                <ul>
                {<TodoItem data={item}/> for item in this.state.todoList}
                </ul>
            </div>
        </div>

module.exports = TodoList
