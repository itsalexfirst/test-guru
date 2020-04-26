document.addEventListener('turbolinks:load', function() {
  var progressBar = document.querySelector(".progress-bar")

  if (progressBar) {
    var totalQuestions = progressBar.dataset.totalQuestions
    var passedQuestions = progressBar.dataset.questionNumber -1

    var rate = ((passedQuestions * 100) / totalQuestions) + '%'

    progressBar.style.width = rate
    progressBar.innerHTML = rate
  }
})
