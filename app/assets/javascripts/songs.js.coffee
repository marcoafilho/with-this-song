# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
jQuery ->
  $("#modal-song").modal({ backdrop: true, show: false })
  $("#gsSong").hide()
  $(".info").click (e) -> 
    e.preventDefault()
    href = $(this).attr('href')
    $.ajax({
      url: href
    }).done (data) ->
      $('#modal-song h3.song_info_title').html(data["title"])
      $('#modal-song p span.song_info_album').html(data["album"])
      artists = for interpreter of data["interpreters"]
        "#{data['interpreters'][interpreter]['name']}"
      genres = for genre of data["genres"]
        "#{data['genres'][genre]['name']}"
      $('#modal-song p span.song_info_artists').html(artists.join("; "))
      $('#modal-song p span.song_info_genres').html(genres.join("; "))
      artist_names = (artist.replace(/\ /g, "+") for artist in artists)
      song = data["title"].replace(/\ /g, "+")
      info = artist_names.join("+") + "+" + song
      $.ajax({
        url: "song_provider/" + info
      }).done (data) ->
        $("#gsSong param[name='flashvars']").each ->
          $(this).attr('value', 'hostname=cowbell.grooveshark.com&songIDs=' + data["SongID"] + '&style=metal&p=0')
        $("#modal-song .loading").hide()
        $("#gsSong").show()
    $('#modal-song').modal('show')