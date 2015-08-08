React = require('react');
ReactDOM = require('react-dom')

Timer = require('./components/timer')
TodoList = require('./components/todolist')
actions = require('./actions')


PDApp = React.createClass
    getInitialState: ->
        activeTab: "todolist"
    handleTabSwitch: (event)->
        @setState
            activeTab: event.target.attributes['data-tab-name'].value
    render: ->
        <div className="app">
            <header>
                <Timer/>
            </header>
            {
                switch this.state.activeTab
                    when "todolist" then <TodoList/>
            }
            <footer>
                <div className="tab-bar">
                    <div className="tab-group left">
                        <i className="fa fa-list tab-icon" data-tab-name="todolist" onClick={this.handleTabSwitch}></i>
                        <i className="fa fa-history tab-icon" data-tab-name="timerhistory" onClick={this.handleTabSwitch}></i>
                        <a href="https://i.doitim.com/home/#/today"><i className="fa fa-link tab-icon"></i></a>

                    </div>
                    <div className="tab-group right">
                        <i className="fa fa-refresh tab-icon" data-tab-name="todolist" onClick={this.handleTabSwitch}></i>
                        <i className="fa fa-gears tab-icon" data-tab-name="todolist" onClick={this.handleTabSwitch}></i>
                     </div>
                </div>
            </footer>
        </div>


render_app = () ->
    ReactDOM.render(
        <PDApp/>,
        document.getElementsByClassName('main-container')[0]
    );
    actions.TodoListActions.fetchTodoList()

render_app();
