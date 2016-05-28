class Task
  constructor: (item) ->
    @item = $(item)
    @setEvents()

  setEvents: ->
    @item.children("input[type='checkbox']").on "click", @handleToggle

  handleToggle: ->
    id = $(this).data("id")
    console.log("Toggle checkbox #{id}")


jQuery ->
  tasks = $.map $("li"), (item, index) ->
    new Task(item)

  console.log tasks

# jQuery ->
#   $("input[type='checkbox']").on "click", (e) ->
#     id = $(this).data("id")
#     $.ajax(
#       url: "/tasks/#{id}/complete",
#       method: "PATCH",
#       dataType: "JSON",
#       success: (data) =>
#         if data.completed
#           $(this).next().html "<del>#{data.description}</del>"
#         else
#           $(this).next().html "#{data.description}"
#     )
