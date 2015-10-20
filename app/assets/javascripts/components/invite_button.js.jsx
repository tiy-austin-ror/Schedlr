var InviteButton = React.createClass({
  getInitialState: function () {
    return {
      invited: false
    };
  },

  handleClick: function (event) {
      $.ajax({
        url: '/invitees',
        method: "POST",
        dataType: "JSON",
        data: {
          invitee: {
            user_id: this.props.userID,
            event_id: this.props.eventID,
          }
        }
          }).done(function () {
          this.setState({ invited: false });
          }.bind(this));
  },

  render: function () {
    if (this.state.invited) {
        return (<div className=''>Employee Invited!</div>);
    } else {
        return (
            <div className='btn btn-default' onClick={this.handleClick}>Invite Employee!</div>
        );
    }
  }
});
