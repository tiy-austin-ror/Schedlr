var AcceptButton = React.createClass({
  getInitialState: function () {
    return {
      accepted: false
    };
  },
//need URL to be whoever the invitee accepting is
  handleClick: function (event) {
    var invitee_id = this.props.inviteeID
      $.ajax({
        url: '/invitees/' + invitee_id,
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
        }.bind(this));s
  },

  render: function () {
    if (this.state.accepted) {
        return (<div className=''>You Accepted the Invitation!</div>);
    } else {
        return (
            <div className='btn btn-default' onClick={this.handleClick}>Accept</div>
        );
    }
  }
});
