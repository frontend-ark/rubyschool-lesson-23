require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'

get '/' do
	erb "Hello! <a href=\"https://github.com/bootstrap-ruby/sinatra-bootstrap\">Original</a> pattern has been modified for <a href=\"http://rubyschool.us/\">Ruby School</a>"			
end

get '/about' do
	erb :about
end

get '/visit' do
	erb :visit
end

get '/contacts' do
  erb :contacts
end

get '/admin' do
  erb :admin
end

post '/visit' do
  @user_name = params[:user_name]
  @phone = params[:phone]
  @date_time = params[:date_time]
  @select_master = params[:select_master]

  @title = 'Thank you!'
  @message = "Dear #{@user_name},you have an appointment with #{@select_master}, we'll be waiting for you at #{@date_time}"

  f = File.open('./public/users.txt', 'a')
  f.write "\nUser: #{@user_name}, Phone: #{@phone}, Date and time: #{@date_time}, Master: #{@select_master}"
  f.close

  erb :message
end

post '/contacts' do
  @story = params[:story]
  @email = params[:email]

  @title = 'Thank you!'
  @message = "We would be glad to read your message"

  f = File.open('./public/message.txt', 'a')
  f.write "\nMessage: #{@story}, e-mail: #{@email}"
  f.close

  erb :message
end

post '/admin' do
  @login = params[:login]
  @password = params[:password]

  if @login == 'admin' && @password == '12345'
    @message = 'You win!'
    @logfile = File.open('./public/users.txt', 'r')
    erb :admin
  else
    @message = 'Go away, muggle!'
  end
end






