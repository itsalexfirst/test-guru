document.addEventListener('turbolinks:load', function() {
  var showTimer = document.querySelector(".timer")

  if (showTimer) {
    var timeLeft = showTimer.dataset.timer;

    var timerID = setInterval(() => {
      if (timeLeft > 0) {
        timeLeft -= 1;
      } else {
        document.querySelector('#check').submit();
        clearInterval(intervalID);
      }

    var rate = timeLeft.toFixed()  + ' sec left';
    showTimer.innerHTML = rate;
    }, 1000);
  }
})
