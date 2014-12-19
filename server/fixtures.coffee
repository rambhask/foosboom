# server/fixtures.coffee
 
if Teams.find().count() == 0
  _([
    {name: 'Barcelona'}
    {name: 'Manchester City'}
  ]).each (data) -> Teams.insert(data)