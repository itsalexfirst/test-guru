document.addEventListener('turbolinks:load', function() {
  var passwordConfirm = document.querySelector('#user_password_confirmation')
  if (passwordConfirm) { passwordConfirm.addEventListener('input', passwordCompare) }
})

  function passwordCompare() {
    var password = document.querySelector('#user_password');
    var passwordConfirm = document.querySelector('#user_password_confirmation');

    if (passwordConfirm.value == '') {
      document.querySelector('.octicon-check').classList.add('hide')
      document.querySelector('.octicon-x').classList.add('hide')
    } else if (password.value == passwordConfirm.value) {
      document.querySelector('.octicon-check').classList.remove('hide')
      document.querySelector('.octicon-x').classList.add('hide')
    } else {
      document.querySelector('.octicon-check').classList.add('hide')
      document.querySelector('.octicon-x').classList.remove('hide')

    }
  }


