# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
initDotDotDot = ->
  $('.truncable').each ->
    $(this).dotdotdot
      ellipsis: '… '
      keep: '.read-more'
      callback: (isTruncated) ->
        readMoreLink = $(this).find('a.read-more')
        if isTruncated
          readMoreLink.show()
        else
          readMoreLink.hide()
        return
      tolerance: 0
      truncate: 'word'
      watch: 'window'
    return
  return

initSimpleMDE =->
  textArea = $('#article_content')[0];
  if(textArea?)
    simpleMDE = new SimpleMDE(element: textArea)
  return

init =->
  initDotDotDot()
  initSimpleMDE()

$(document).on 'turbolinks:load', init