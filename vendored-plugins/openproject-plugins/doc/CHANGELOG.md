<!---- copyright
OpenProject Plugins Plugin

Copyright (C) 2013 - 2014 the OpenProject Foundation (OPF)

This program is free software; you can redistribute it and/or
modify it under the terms of the GNU General Public License version 3.

You should have received a copy of the GNU General Public License
along with this program; if not, write to the Free Software
Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA.

See doc/COPYRIGHT.md for more details.

++-->

# Changelog

## 1.0.8

* `#5357` Updated readme and copyrights
* Changed settings default parameter key to be a symbol like in the core

## 1.0.7

* Fixed non-functional plugin generation when this gem is taken from github directly

## 1.0.6

* Allows plugin register to receive a block so plugins don't have to register with this plugin AND Redmine::Plugin

## 1.0.5

* Readme: Add note about db:create and db:migrate in same rake process
* Generator: Add explicit require to fix load-order problems
* Minor changes to the copyright header

## 1.0.4

* `#2340` Develop migration mechanism for renamed plugins

## 1.0.3

* Harmonize copyright and copyright header

## 1.0.2

* `#1900` Release openproject-plugins gem
