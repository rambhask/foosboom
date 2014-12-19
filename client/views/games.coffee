# client/views/games.coffee
 
Template.games.helpers
  teams: Teams.find()
  games: Games.find()
  creating: -> Session.get 'creating-game'
 
Template.games.events
  "click .create": (e, tpl) ->
    e.preventDefault()
    Session.set 'creating-game', true
 
  "click .cancel": (e, tpl) ->
    e.preventDefault()
    Session.set 'creating-game', null
    
  "submit form.form-create": (e, tpl) ->
    e.preventDefault()
 
    teamOneData = {
      id: tpl.$("select[name='teamOne']").val()
      name: tpl.$("select[name='teamOne'] option:selected").text()
      score: 0
    }
 
    teamTwoData = {
      id: tpl.$("select[name='teamTwo']").val()
      name: tpl.$("select[name='teamTwo'] option:selected").text()
      score: 0
    }
 
    game = {
      created_at: new Date()
      teams: [teamOneData, teamTwoData]
      completed: false
    }
 
    gameId = Games.insert(game)
 
    # Update each team's cached array of game ids
    Teams.update({_id: teamOneData.id}, {$addToSet: { games: gameId}})
    Teams.update({_id: teamTwoData.id}, {$addToSet: { games: gameId}})
