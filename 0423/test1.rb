# encoding: UTF-8

require 'sinatra'
require "sinatra/reloader"

get '/taeyean' do
   'Put this in your pipe & smoke it!'
end

get '/mine' do
  '<h1 align="center">you mine a block</h1>
  <p align="center"> by taeyean </p>'
end

get '/hello' do
  '<h1 align="center">you must say hello</h1>
  <p align="center"> by taeyean </p>'
end

get '/refresh' do
  '<h1 align="center">you have to take a rest!!</h1>
  <p align="center"> by taeyean </p>'
end

get '/thesis' do
  '<h1 align="center">huh huh huh huh !!</h1>
  <p align="center"> by taeyean </p>'
end