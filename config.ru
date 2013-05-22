require 'rubygems'
require 'sinatra'
require 'sequel'
require 'haml'
require 'mongo'
require 'bson'
require 'json'
require './app.rb'

run Sinatra::Application

