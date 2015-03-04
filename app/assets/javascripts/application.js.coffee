#= require jquery
#= require jquery_ujs
#= require_tree .

## ======================= subscription dialog ================================##
$ ->
  emailRegex = /^[a-zA-Z0-9.!#$%&'*+\/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$/
  email = $('#email')
  tips = $('.validateTips')

  updateTips = (t, flag = false) ->
    tips.text(t)
    if flag
      tips.addClass 'ui-state-highlight'
      setTimeout (->
        tips.removeClass 'ui-state-highlight', 1500
      ), 2500

  checkRegexp = (field) ->
    if !emailRegex.test(field.val())
      field.addClass 'ui-state-error'
      updateTips 'E-mail has incorrect format'
      false
    else
      true

  addUser = ->
    email.removeClass('ui-state-error')
    valid = checkRegexp(email)
    email.removeClass 'ui-state-error'
    if valid
      $.ajax(
        type: "POST"
        url: '/subscriptions'
        data: {email: email.val()}
      ).done (msg) ->
        if msg['status'] == 'ok'
          dialog.dialog 'close'
        else
          email.addClass('ui-state-error')
          updateTips msg['error'], 'error'
    valid

  dialog = $('#dialog-form').dialog(
    autoOpen: false
    closeText: false
    height: 130
    width: 250
    modal: true
    close: ->
      form[0].reset()
      updateTips 'Please, set your e-mail.'
      email.removeClass 'ui-state-error'
  )
  form = dialog.find('form').on('submit', (event) ->
    event.preventDefault()
    addUser()
  )

  $('.js_show_subscribe_form').on 'click', (event) ->
    event.preventDefault()
    email.val('')
    dialog.dialog 'open'

  $('.js_close_dialog').on 'click', (event) ->
    event.preventDefault()
    dialog.dialog 'close'

  $('.js_add_subscriber').on 'click', (event) ->
    event.preventDefault()
    addUser()
## ======================= end subscription dialog ================================##

## ======================= comment form ================================##
comment_html = (name, body)->
  date = new Date
  '<div class="comment"> <div class="comment__header"> <div class="comment__author">' +
  name +
  '</div>  <div class="comment__created_at"> Published at: ' +
  "#{$.datepicker.formatDate('dd.mm.yy', new Date())}" +
  '</div> </div> <div class="comment__body">' +
  body +
  '</div></div>'

$(document).on 'click', '.js_add_comment', (event) ->
  event.preventDefault()
  err = $('.comment__form__error')
  err.hide()
  article_id = $('.js_add_comment').data('article-id')
  body = $('#comment_body').val()
  author_name = $('#comment_author_name').val()
  $.ajax(
    type: "POST"
    url: "/articles/#{article_id}/comments"
    data:
      body: body
      author_name: author_name
  ).done (msg) ->
    if msg['status'] == 'ok'
      $('.comments__form form')[0].reset()
      $('.comments__list').append comment_html(author_name, body)
    else
      err.html(msg['errors'].join('</br>'))
      err.show()
## ======================= end comment form ================================##

