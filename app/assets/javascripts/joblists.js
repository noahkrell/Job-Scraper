$(document).ready(function() {

  console.log('hello')

  $('.joblist-save-hide').on('click', function(e) {
    alert('Job saved. Check ya profile.')
  });

  $('.profile-save-hide').on('click', function(e) {
    e.preventDefault()
    alert('delete function not yet available... check back soon!')
  });

});

