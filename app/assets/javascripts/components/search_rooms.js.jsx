var Search = React.createClass({
  getInitialState: function () {
    return {
      filtered_rooms: [],
      all_rooms: [],
      search: ''
    };
  },

  componentDidMount: function () {
    $.ajax({
      url: '/company/rooms',
      dataType: 'JSON',
      method: 'GET'
    }).done(function (response) {

      this.setState({
        all_rooms: response,
        filtered_rooms: response
      });
    }.bind(this));
  },

  render: function() {
    return (
      <section>
        <p>
          <input className='form-control' type='text'
            onChange={this.handleChange} value={this.state.search}
            placeholder='search rooms' />
        </p>
        <div className="table-responsive">
          <table className="table table-hover">
            <thead>
              <tr>
                <th>Name</th>
                <th>Capacity</th>
                <th>Building name</th>
              </tr>
            </thead>
            <tbody>
              {this.state.filtered_rooms.map(function (room) {
                return (
                  <tr>
                    <td><a href={'/rooms/' + room.id}>{ room.name } </a></td>
                    <td> { room.capacity }</td>
                    <td> { room.building.name }</td>
                  </tr>
                );
              })}
            </tbody>
          </table>
        </div>
      </section>
  );
},

  handleChange: function (event) {
    var filtered_rooms = this.state.all_rooms.filter(function (room) {
      return (room.name.toLowerCase().indexOf(event.target.value.toLowerCase()) > -1);
    });
    this.setState({
      search: event.target.value,
      filtered_rooms: filtered_rooms
    });
  }
});
