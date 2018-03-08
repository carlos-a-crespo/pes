json.array! @events do |event|
  json.id event.id
  json.title event.title

  date_format = '%Y-%m-%dT%H:%M:%S';
  json.start event.start.strftime(date_format)
  json.end event.end.strftime(date_format)
  json.edit_url edit_event_path(event)

  json.color event.event_type.color
end