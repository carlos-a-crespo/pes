# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
initCalendar = ->
  $('#calendar').each ->
    calendar = $(this)
    calendar.fullCalendar
      locale: 'es'
      header:
        left: 'prev,next today'
        center: 'title'
        right: 'month,agendaWeek,agendaDay'
      timeFormat: 'H:mm'
      selectable: true
      selectHelper: true
      editable: true
      eventLimit: true
      fixedWeekCount: false
      events: '/events.json'
      select: (start, end) ->
        $.getScript '/events/new', ->
          fakeEventStartInput = $('#fake_event_start')
          eventStartInput = $('#event_start')

          fakeEventEndInput = $('#fake_event_end')
          eventEndInput = $('#event_end')

          fakeEventStartInput.val moment(start).format('DD/MM/YYYY HH:mm')
          eventStartInput.val moment(start).format('YYYY-MM-DD HH:mm')

          actualEnd = moment(end).subtract(1, 'minutes');

          fakeEventEndInput.val actualEnd.format('DD/MM/YYYY HH:mm')
          eventEndInput.val actualEnd.format('YYYY-MM-DD HH:mm')

          initDateRangepicker(fakeEventStartInput, eventStartInput)
          initDateRangepicker(fakeEventEndInput, eventEndInput)

          return
        calendar.fullCalendar 'unselect'
        return
      eventClick: (event, jsEvent, view) ->
        $.getScript event.edit_url, ->
          fakeEventStartField = $('#fake_event_start')
          eventStartField = $('#event_start')

          fakeEventEndField = $('#fake_event_end')
          eventEndField = $('#event_end')

          fakeEventStartField.val moment(event.start).format('DD/MM/YYYY HH:mm')
          eventStartField.val event.start.format('YYYY-MM-DD HH:mm')

          fakeEventEndField.val moment(event.end).format('DD/MM/YYYY HH:mm')
          eventEndField.val event.end.format('YYYY-MM-DD HH:mm')

          initDateRangepicker(fakeEventStartField, eventStartField)
          initDateRangepicker(fakeEventEndField, eventEndField)

          return
        return
    return
  return

initDateRangepicker = (fakeInput, hiddenInput) ->
  fakeInput.daterangepicker {
    singleDatePicker: true
    timePicker: true
    timePickerIncrement: 1
    alwaysShowCalendars: true
    timePicker24Hour: true
    autoApply: true
    'locale':
      'format': 'DD/MM/YYYY HH:mm'
      'applyLabel': 'Ok',
      'cancelLabel': 'Cancelar',
      'daysOfWeek': [
        'Dom.',
        'Lun.',
        'Mar.',
        'Mie.',
        'Jue.',
        'Vie.',
        'Sab.',
      ],
      'monthNames': [
        'Enero',
        'Febrero',
        'Marzo',
        'Abril',
        'Mayo',
        'Junio',
        'Julio',
        'Agosto',
        'Septiembre',
        'Octubre',
        'Noviembre',
        'Diciembre'
      ],
      'firstDay': 1
  }, (start, end, label) ->
    hiddenInput.val start.format('YYYY-MM-DD HH:mm')
    return
  return

$(document).on 'turbolinks:load', initCalendar