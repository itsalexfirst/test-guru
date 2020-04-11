document.addEventListener('turbolinks:load', function() {
  var controls = document.querySelectorAll('.form-inline-link')

  if (controls.length) { // saver
    for (var i = 0; i < controls.length; i++) {
      controls[i].addEventListener('click', formInlineLinkHandler)
    }
  }

  var errors = document.querySelector('.resource-errors')

  if (errors) {
    var resourceId = errors.dataset.resourceId
    formInlineHandler(resourceId)
  }
})

function formInlineLinkHandler(event) {
  event.preventDefault()

  var testId = this.dataset.testId
  formInlineHandler(testId)
}

function formInlineHandler(testId) {
  var link = document.querySelector(`.form-inline-link[data-test-id="${testId}"]`)
  var testTitle = document.querySelector(`.test-title[data-test-id="${testId}"]`)
  var formInLine = document.querySelector(`.form-inline[data-test-id="${testId}"]`)

  if (formInLine.classList.contains('hide')) {
    link.textContent = 'Cancel'
    testTitle.classList.add('hide')
    formInLine.classList.remove('hide')
  } else {
    link.textContent = 'Edit'
    testTitle.classList.remove('hide')
    formInLine.classList.add('hide')
  }
}
