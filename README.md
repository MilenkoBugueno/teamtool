Teamtool
================

Teamtool is an emerging open source and web-based tool, which helps teams on one hand adopting new agile processes and on the other hand recruiting and training new members by means of on-the-job training units, so-called Agile Moves.

Agile Moves are
* clearly defined routines
* with a specific goal
* that can be done iteratively on the job
* to train certain aspects of teamwork at a time
* to improve team play and the overall productivity

“Agile”, because the moves enable team to think and develop in an agile way.

“Moves”, because single elements are taken from different methods like Scrum, similar to defined steps in dancing. These moves are then trained specifically and, much like in dancing, can be connected to increasingly complex sequences to live agile values on the job.

For more information about "agile moves" take a look at: http://blog.agile-moves.com/2014/06/05/what-are-agile-moves/


Getting Started
-------------

This application requires:
* Ruby 2.1.1
* Rails 4.1.6

If you need to install ruby on rails first you can find at http://rubyonrails.org/download/ how to do it.

Installation steps:
* Configure your database in "config/database.yml"
* Set application configuration variables in "config/application.yml"
* Run 'bundle install'
* Run 'rake db:setup'
* Start the server ('rails s')

For more information about how to run a ruby on rails project please take a look at http://guides.rubyonrails.org/getting_started.html


Testing the teamtool
-------------
Test scenarios are available for all features in gherkin style (Behaviour driven development). For this we are using the robot framework (http://robotframework.org). 

How to run the tests:
* Install the robot framework: https://github.com/robotframework/robotframework/blob/master/INSTALL.rst
* Configure the global variables at "robot/resource.robot"
* Set your secret variables at "robot/secrets.robot"
* For running all tests enter "pybot robot/*"
* For running a specific test enter "pybot --test "Test Scenario Name here" file_name_here.robot"

Documentation and Support
-------------------------
We are working on a wiki for the project. It should be publicy available soon. Till then please feel free to use the issue area to give us feedback.

License
-------
MIT License. For details please see the LICENSE file
