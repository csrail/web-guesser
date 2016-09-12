## Exploration

This is a simple number guessing app built with sinatra. [Try it out!](https://csrail-web-guesser.herokuapp.com/)

The aim is to guess a number including and in between 1 and 100. Every time you submit a number you will be given a response indicating whether the number was too high or too low. Once you correctly guess the number or run out of guesses, another secret number is randomly generated.



## Exposition

[Sinatra](http://www.sinatrarb.com/) is a very light-weight framework written in Ruby for setting up web applications. You can think of it as the bare skeleton of a Rails framework since you have to do a lot of manual set up but there are still quite a few things that are happening under the hood. Learning sinatra is really great way to understand how Rails abstracts methods and paths to produce its conventional state.

By using sinatra I learned how to:
* Set up a basic route: `get '/' do ... end`
* Link a route to a view: `erb :index`
* Acquire local parameters and embed them into the views: `locals => {:key_to_refer => value }`

Embedding ruby logic into the views means that the webpage now has a dynamic element to it!

The `href` attribute in the `<link>` element by default looks within the public folder. This sort of automatic pathing lends itself to how Rails manages file paths.

As usual, I have adopted [BEM CSS syntax](http://cssguidelin.es/#bem-like-naming) which has made the styling easier to manage and has resulted in a skin for the app reflecting the original gameboy.

I have also started using commenting that is seen in the [Skeleton](http://getskeleton.com/examples/landing/) responsive design framework. It's quite sleek and it's not jarring at all; it somehow manages to instruct your eye but not distract it - weird. It looks like this: `/* Global
–––––––––––––––––––––––––––––––––––––––––––––––––– */`

From [The Odin Project's](http://www.theodinproject.com/ruby-on-rails/sinatra-basics) curriculum following a [Jumpstart tutorial](http://tutorials.jumpstartlab.com/projects/web_guesser.html).



## Excursion

In order to deploy this app successfully I needed to place `.bundle` into a `.gitignore` folder. This would have been easy to troubleshoot if I had a  closer read of the heroku logs.



## Expletives

Since no sessions are put in place, if more than one person is using the app, a user's get or post requests are interacting with each other and the guesses will make strange movements and either drop away really fast or reset to a higher number.