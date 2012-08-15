jQuery ->
  $("a[rel=popover]").popover()
  $(".tooltip").tooltip()
  $("a[rel=tooltip]").tooltip()
  $("a.close").click -> $(this).parent().slideUp('slow')
  $("a.close.modal-header").click -> 
    $(this).parent().modal('hide')
    $("#gsSong").hide()
    $("#modal-song .btn.loading").show()
  $("#modal-from-dom").bind('show', ->
    href = $(this).data('href')
    removeBtn = $(this).find('.btn-danger')
    removeBtn.attr('href', href)
  ).modal({ backdrop: true, show: false })
  $(".confirm-delete").click (e) -> 
    e.preventDefault()
    href = $(this).attr('href')
    $('#modal-from-dom').data('href', href).modal('show')
  $('.dropdown-toggle').dropdown()