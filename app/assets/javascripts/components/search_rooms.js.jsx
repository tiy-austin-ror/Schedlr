var Search = React.createClass({
    getDefaultProps: function() {
      return {
        rooms: []
      };
    },

    getInitialState: function() {
      return {
        rooms: this.props.rooms,
        search: ''
      };
    },

    handleChange: function(event) {
      var matched_rooms = this.props.rooms.filter(function (room) {
        return (room.name.toLowerCase().indexOf(event.target.value.toLowerCase()) > -1);
      });
      this.setState({
        search: event.target.value,
        rooms: matched_rooms
      });
    },

    render: function() {
      return (
        <section>
          <p>
            <input className='form-control' type='text'
              onChange={this.handleChange} value={this.state.search}
              placeHolder='search rooms' />
          </p>
          <div className="table-responsive">
            <table className="table table-hover">
              <thead>
                <tr>
                  <th>Name</th>
                  <th>Capacity</th>
                  <th>Building</th>
                </tr>
              </thead>
              <tbody>
                {this.state.rooms.map(function (room, building) {
                  return (
                    <tr>
                      <td> { room.name } </td>
                      <td> { room.capacity }</td>
                      <td> { building.name }</td>
                    </tr>
                  );
                })}
              </tbody>
            </table>
          </div>
        </section>
    );
  }
});
