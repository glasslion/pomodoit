React = require('react');
ReactDOM = require('react-dom')


Timer = React.createClass
    getInitialState: ->
        is_started: false


    startTimer: (event) ->
        update_clock_interval_id = window.setInterval(this.updateDigitClock, 1000)
        this.setState({
          is_started: !this.state.is_started,
          start_time: Date.now(),
          clock_text: '25:00',
          update_clock_interval_id: update_clock_interval_id
        });


    updateDigitClock: () ->
        remaining_seconds = 60*25 - ((Date.now() - this.state.start_time)//1000)
        this.setState({clock_text: remaining_seconds//60 + ':' + remaining_seconds%60});


    render: ->
        <div className="pomodoit-timer">
        {
            if this.state.is_started
                <p className="digit-clock">{this.state.clock_text}</p>
            else
                <i className="pomodoit-icon">Pomodoit</i>
        }
        <i className="fa fa-play-circle header-icon" id="start-btn" onClick={this.startTimer}></i>
        </div>


module.exports = Timer
