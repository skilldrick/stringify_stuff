StringifyStuff
==============

StringifyStuff adds virtual attributes to your models to simplify interactions
with certain datatypes. There are currently three parts:

stringify_stuff
---------------

Use this to setup the variables and methods StringifyStuff needs.

stringify_time
--------------

Converts from date/time values to strings and back.

stringify_money
---------------

Converts from decimal to money and back.

StringifyStuff was inspired by Ryan Bates' Railscast on [Making a Plugin](http://railscasts.com/episodes/33-making-a-plugin).

Example
=======

    class MyModel < ActiveRecord::Base
      stringify_stuff
      stringify_money :cost
      stringify_time :end_date
    end

This gives you a number of useful methods:

* cost_string #The cost as a formatted money string
* cost_string= #A setter that takes a cost string
* end_date_string #The end_date as a formatted date string
* end_date_string= #A setter that takes a range of formatted date strings.
* cost_invalid? #True if the value given to `cost_string=` was invalid
* end_date_invalid? #True if the value given to `end_date_string=` was invalid

`cost_string` and `end_date_string` are both added to the `as_json` method so
when your model is rendered as json they will be included.


Notes
=====

Currently, string formats for dates and money are hard-coded, but hopefully one
day I'll make them so they're configurable without delving inside the plugin.


Copyright (c) 2011 Nick Morgan, released under the MIT license
