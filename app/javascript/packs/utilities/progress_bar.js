document.addEventListener('turbolinks:load', function() {
  var progressBar = document.querySelector(".progress-bar")

  if (progressBar) {
    var totalQuestions = progressBar.dataset.totalQuestions
    var questionNumber = progressBar.dataset.questionNumber

    var rate = ((questionNumber * 100) / totalQuestions) + '%'

    progressBar.style.width = rate
    progressBar.innerHTML = rate
  }
})
