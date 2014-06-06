require(['bootstrap'], function() {
  $(function() {
    var navbar = $('nav[data-spy="affix"]');
    navbar.affix({
      offset: {
        top: 350,
        bottom: function () {
          return (this.bottom = $('.footer').outerHeight(true));
        }
      }
    });
  });
})