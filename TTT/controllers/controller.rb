class Controller
  def initialize(model: nil, view: nil)
    @model = model
    @view = view
  end

  def accept_input(index)
    @model.place_at(index.to_i)
    @view.render(@model.board)

    @view.render_win && exit if @model.winner?
  rescue ArgumentError
    @view.try_again
    @view.render(@model.board)
  end
end