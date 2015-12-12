class window.AppView extends Backbone.View
  template: _.template '
    <button class="hit-button button-primary">Hit</button> <button class="stand-button button-primary">Stand</button>
    <div class="player-hand-container"></div>
    <div class="dealer-hand-container"></div>
    <div class="player-score-container"></div>
  '

  events:
    'click .hit-button': -> @model.get('playerHand').hit()
    'click .stand-button': -> @model.get('dealerHand').stand()

  # compare

  initialize: ->
    @render()
    @on "render": =>
     @render()

  render: ->
    @$el.children().detach()
    @$el.html @template()
    @$('.player-hand-container').html new HandView(collection: @model.get 'playerHand').el
    @$('.dealer-hand-container').html new HandView(collection: @model.get 'dealerHand').el
    @$('.player-score-container').html new ChipView(model: @model.get 'playerScore').el
