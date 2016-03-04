var nominated = [];
$('#nominated').typeahead({
  name: 'TID Workers',
  local: [{
    "firstName": "Germán",
    "lastName": "Toro del Valle",
    "photo": "http://clubatletismomalaga.es/images/stories/unknown_user.jpg",
    "value": "Germán Toro del Valle",
  }, {
    "firstName": "Germán",
    "lastName": "Toro del Val",
    "photo": "http://clubatletismomalaga.es/images/stories/unknown_user.jpg",
    "value": "Germán Toro del Val",
  }, {
    "firstName": "Francisco",
    "lastName": "Vargas",
    "photo": "http://clubatletismomalaga.es/images/stories/unknown_user.jpg",
    "value": "Francisco Vargas",
  }, {
    "firstName": "Paquito",
    "lastName": "Vargas Elotro",
    "photo": "http://clubatletismomalaga.es/images/stories/unknown_user.jpg",
    "value": "Paquito Vargas Elotro",
  }],
  template: [
    '<img src="{{photo}}"/>',
    '<span>{{value}}</span>'
  ].join(''),
   engine: Hogan
}).on('typeahead:selected', function(evt, datum, name) {
  if (nominated.indexOf(datum.value) !== -1) {
    $('#nominated').typeahead('setQuery', '');
  } else {
    $('#selected').append('<p class="nominated">' + datum.value + ' <button type="button" class="btn btn-default btn-sm"><span class="glyphicon glyphicon-trash"></span></button></p>').on('click', function(ev) {
      ev.stopImmediatePropagation();
      if (ev.target.tagName !== 'P') {
        $(ev.target).parents('.nominated').remove();
        $('#nominated').attr('placeholder', 'Type your nominated colleague (' + (3 - $('#selected').children().length) + ' pending)');
        var index = nominated.indexOf($(ev.target).parents('.nominated').text().trim());
        if (index > -1) {
          nominated.splice(index, 1);
        }
      }
    });
    $('#nominated').attr('placeholder', 'Type your nominated colleague (' + (3 - $('#selected').children().length) + ' pending)');
    $('#nominated').typeahead('setQuery', '');
    nominated.push(datum.value);
  }
});