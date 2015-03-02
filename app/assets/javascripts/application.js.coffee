#= require jquery
#= require jquery_ujs
#= require_tree .

$ ->
  emailRegex = /^[a-zA-Z0-9.!#$%&'*+\/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$/
  email = $('#email')
  tips = $('.validateTips')

  updateTips = (t) ->
    tips.text(t).addClass 'ui-state-highlight'
    setTimeout (->
      tips.removeClass 'ui-state-highlight', 1500
    ), 500

  checkRegexp = (field) ->
    if !emailRegex.test(field.val())
      field.addClass 'ui-state-error'
      updateTips 'E-mail has incorrect format'
      false
    else
      true

  addUser = ->
    valid = checkRegexp(email)
    email.removeClass 'ui-state-error'
    if valid
      $.post(
        'example.php'
        data:
          email: email
      ).done(->
        dialog.dialog 'close'
      ).fail ->
        alert 'error'

    valid

  dialog = $('#dialog-form').dialog(
    autoOpen: false
    closeText: false
    height: 130
    width: 250
    modal: true
    buttons:
      'Subscribe': addUser
      Cancel: ->
        dialog.dialog 'close'
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
