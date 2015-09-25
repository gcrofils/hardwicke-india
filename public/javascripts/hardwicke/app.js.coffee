app = angular.module('hardwicke', ['hardwicke-posts'])

api_base = 'http://india.local.dev:3000/locomotive/india/api/v3/'

app.config ($interpolateProvider) -> 
  $interpolateProvider.startSymbol('{$=')
  $interpolateProvider.endSymbol('$}')
  
posts= [
  title: 'my first post'
  body: 'lorem ipsum'
,
  title: 'my second post'
  body: 'lorem lapsum'
]

app.controller 'HomeController', [ '$http', ($http)-> 
  page = this
  req = 
    method: 'GET'
    url: api_base + 'pages/'
    withCredentials: true
    headers:
      'X-Locomotive-Account-Token': 'T9BoP141sGVayznKAUvx'
      'X-Locomotive-Account-Email': 'gilles@siz.yt'
  debugger
  $http(req).then (response)->
    alert 'ok'
    true
  , (response)->
    debugger
    alert 'ko'
]

  
app.controller 'PostsController', [ '$http', ($http)-> 
  page = this
  page.posts = posts
  $http.get('/.json').success (data)->
    #page.posts = data
  true
]