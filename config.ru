require 'rubygems'
require 'sinatra'
require 'sequel'
require 'haml'
require 'mongo'
require 'bson_ext'
require 'json'
require './app.rb'

run Sinatra::Application

