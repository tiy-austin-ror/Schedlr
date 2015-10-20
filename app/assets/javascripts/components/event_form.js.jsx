var ScheduleEventForm = React.createClass({
  getInitialState: function () {
    return {
      scheduled: false
    };
  },

  handleClick: function (event) {
      $.ajax({
        url: '/events',
        method: "POST",
        dataType: "JSON",
        data: {
          event: {
            user_id: this.props.userID,
            room_id: this.props.roomID,
            duration: this.state.Duration,
            description: this.state.Description
          }
        }
          }).done(function () {
          this.setState({ scheduled: true });
          }.bind(this));
  },

  changeDuration: function (e) {
    this.setState({ Duration: e.target.value });
  },

  changeDescription: function (e) {
    this.setState({ Description: e.target.value });
  },

  render: function () {
    if (this.state.scheduled) {
        return (<div className=''>Event Scheduled!</div>);
    } else {
        return (
          <div className='form'>
            <label htmlFor='Start'>Duration</label>
            <input id='Start' placeholder={'Enter duration'}
                size="50" type="integer"
                onChange={this.changeDuration}
                value={this.state.Duration}
                className={this.state.className}/>

              <label htmlFor='Start'>Description</label>
            <input id='Description' placeholder={'Describe your event'}
              size="50" type="string"
              onChange={this.changeDescription}
              value={this.state.Description}
              className={this.state.className}/>

            <div className='btn btn-default' onClick={this.handleClick}>Schedule An Event!</div>
          </div>
        );
    }
  }
});
