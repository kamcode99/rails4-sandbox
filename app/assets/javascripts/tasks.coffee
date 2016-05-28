jQuery ->
  $("input[type='checkbox']").on "click", (e) ->
    id = $(this).data("id")
    $.ajax(
      url: "/tasks/#{id}/complete",
      method: "PATCH",
      dataType: "JSON",
      success: (data) =>
        if data.completed
          $(this).next().html "<del>#{data.description}</del>"
        else
          $(this).next().html "#{data.description}"
    )
