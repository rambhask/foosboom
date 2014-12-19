# server/publications.coffee

Meteor.publish 'teams', -> Teams.find()
Meteor.publish 'games', -> Games.find()

