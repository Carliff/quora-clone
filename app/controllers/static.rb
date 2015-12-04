# Home page

get '/' do
	@user = current_user
  erb :"static/index"
end

# All Questions Page
get '/questions/' do
	@user = current_user
	erb :"static/questions"
end