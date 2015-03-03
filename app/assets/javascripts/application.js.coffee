#= require jquery
#= require jquery_ujs
#= require_tree .

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
    form[0].reset()
    updateTips 'Please, set your e-mail.'
    email.removeClass 'ui-state-error'
    dialog.dialog 'close'

  $('.js_add_subscriber').on 'click', (event) ->
    event.preventDefault()
    addUser()
