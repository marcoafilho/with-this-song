With this song [![Build Status][travis_logo]](http://travis-ci.org/marcoafilho/with-this-song)
==============

> I put all my genius into my life; I put only my talent into my works. <br>
> Oscar Wilde

A music database for those songs that InPacted.my world.

[travis_logo]: https://secure.travis-ci.org/marcoafilho/ai-mindbreaker.png?branch=master

Objective
---------
With the intention of testing my skill on Ruby on Rails, this application uses 
a set of the most popular gems to develop a complex web application with ease.

About
-----

This application uses the [Heroku][heroku_url] cloud platform as 
its deployment server. [Click here][app_url] to 
see the application working.

As for the test environment two main gems are being used: [RSpec][rspec_url] 
and [Capybara][capybara_url]. The first one is used for the unit and 
functional tests and both are used for behavioural tests. 
[Travis Continuous Integration][travis_url] is the platform used to build new 
instances of the application and verify if the code is working accordingly.

The methodology used to write this application is the Behaviour Driven 
Development. When new features are created first it's designed the expected 
behaviour of the application and afterwards the code is written.

All the issues are managed within the github website. You can see all the 
issues by clicking [here][issues_url]. Go to the closed issues tab to see what 
has already been done.

[app_url]: http://with-this-song.herokuapp.com/
[capybara_url]: https://github.com/jnicklas/capybara/
[heroku_url]: http://www.heroku.com/
[issues_url]: https://github.com/marcoafilho/with-this-song/issues?milestone=&page=1&state=open
[rspec_url]: http://rspec.info/
[travis_url]: http://travis-ci.org/marcoafilho/with-this-song

Features
--------

### Artists management

In the [artists screen][artists_url] you are able to manage artists. Create, 
edit and list them all.

There can be only one artist with a specific name and it should always have a 
name.

### Genre management

You are able to manage genres in the [genres screen][genres_url]. A genre must 
always have a name.

### Songs management

This is the main page of the application. In the [songs page][songs_url] a 
user can see all of their songs ordered by title. A song may have various 
artists so to see the interpreters you need to click on the play button.

### Internationalization support

Users are able to interact with the system with their native language. Just use 
the languages dropdown button on the right corner of the navigation bar. The 
currently available languages are: English, Portuguese and Spanish.

### Grooveshark integration

With the set (Artist name, Song title) the applivation is able to search on 
Grooveshark for the intended song. The result isn't a 100% correct, because of 
wrong inputs that may happen on the Grooveshark songs.

To listen to the songs just click on the play button in the 
[songs page][songs_url].

### Rating system

Songs can be evaluated and be given a rating. Rates goes from 1 to 5, where 5 
is the best grade. Rates can be seen as stars in the [songs page][songs_url].

[artists_url]: http://with-this-song.herokuapp.com/artists
[genres_url]: http://with-this-song.herokuapp.com/genres
[songs_url]: http://with-this-song.herokuapp.com/songs