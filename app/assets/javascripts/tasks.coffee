class Task
  constructor: (item) ->
    @item = $(item)
    @id = @item.data("id")
    @setEvents()

  setEvents: ->
    @item.children("input[type='checkbox']").on "click", @handleToggle

  # When used 'handleToggle: ->" then 'this' keywoard
  # inside the handleToggle will be the instance of input[type='checkbox']
  # Instead, when used 'handleToggle: =>' then 'this' keywoard
  # refers to the instance of the class and that is what is
  # required in this case
  handleToggle: =>
    $.ajax(
      url: "/tasks/#{@id}/complete",
      method: "PATCH",
      dataType: "JSON",
      success: @handleToggleSuccess
    )

  handleToggleSuccess: (data) =>
    description_tag = @item.children("span")
    if data.completed
      description_tag.html "<del>#{data.description}</del>"
    else
      description_tag.html "#{data.description}"

jQuery ->
  tasks = $.map $("li"), (item, index) ->
    new Task(item)
