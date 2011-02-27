StringifyStuff
==============

StringifyStuff adds virtual attributes to your models to simplify interactions
with certain datatypes. There are currently three parts:

stringify_time
--------------

Converts from date/time values to strings and back.

stringify_money
---------------

Converts from decimal to money and back.

stringify_percentage
--------------------

Converts a decimal value to a percentage string


Example
=======

    class MyModel < ActiveRecord::Base
      stringify_stuff
      stringify_money :cost
      stringify_time :end_date
      stringify_percentage :margin

      validate :money_strings_invalid?, :time_strings_invalid?,
    end

This gives you a number of useful methods:

* cost_string #The cost as a formatted money string
* cost_string= #A setter that takes a cost string
* end_date_string #The end_date as a formatted date string
* end_date_string= #A setter that takes a range of formatted date strings.
* margin_string #The margin as a percentage string (no setter for percentages)
* money_strings_invalid? #Validation method for methods passed to `stringify_money`
* time_strings_invalid? #Validation method for methods passed to `stringify_time`

Notes
=====

Currently, string formats for dates and money are hard-coded, but hopefully one
day I'll make them so they're configurable without delving inside the plugin.

StringifyStuff was inspired by Ryan Bates' Railscast on [Making a
Plugin](http://railscasts.com/episodes/33-making-a-plugin).

Copyright (c) 2011 Nick Morgan, released under the MIT license
