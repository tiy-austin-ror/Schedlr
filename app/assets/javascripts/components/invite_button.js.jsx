var InviteButton = React.createClass({
  getInitialState: function () {
    return {
      invited: false
    };
  },

  handleClick: function (event) {
    console.log('Started');
      $.ajax({
        url: '/invitees',
        method: "POST",
        dataType: "JSON",
        data: {
          invitee: {
            user_id: this.props.userID,
            event_id: this.props.eventID,
          }
        },
        success: function () {
            console.log('succeeded!');
            this.setState({ invited: true });
        }.bind(this),
        error: function () {
          console.log('error occured');
        }
    });
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
