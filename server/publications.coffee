# server/publications.coffee

Meteor.publish 'teams', -> Teams.find()