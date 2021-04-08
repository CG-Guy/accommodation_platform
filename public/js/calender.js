2019// Initiate calendar
var clndr = {};
$(function() {
  // PARDON ME while I do a little magic to keep these events relevant for the rest of time...
  var currentMonth = "2019-12";
  var nextMonth    = "2020-01";

  var events = [
    { date: '2019-12-10', title: 'Persian Kitten Auction', location: 'Center for Beautiful Cats' },
    { date: '2019-12-19', title: 'Cat Frisbee', location: 'Jefferson Park' },
    { date: '2019-12-23', title: 'Kitten Demonstration', location: 'Center for Beautiful Cats' },
    { date: '2020-01-07',    title: 'Small Cat Photo Session', location: 'Center for Cat Photography' }
  ];

  var clndrTemplate = $('#full-clndr-template').html();

  clndr = $('#full-clndr').clndr({
    // template: $('#full-clndr-template').html(),
    render: function(data) {
      return Mustache.render(clndrTemplate, data);
    },
    events: events,
    forceSixRows: true
  });
});    
