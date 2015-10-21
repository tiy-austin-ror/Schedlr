var AcceptButton = React.createClass({
  getInitialState: function () {
    return {
      accepted: false
    };
  },

  handleClick: function (event) {
      $.ajax({
        url: '/invitees/1',
        method: "PUT",
        dataType: "JSON",
        data: {
          invitee: {
            user_id: this.props.userID,
            event_id: this.props.eventID,
            accepted: true
          }
        }
          }).done(function () {
          this.setState({ accepted: true });
          }.bind(this));
  },

  render: function () {
    if (this.state.accepted) {
        return (<div className=''>You Accepted the Invitation!</div>);
    } else {
        return (
            <div className='btn btn-default' onClick={this.handleClick}>Accept & RSVP</div>
        );
    }
  }
});
