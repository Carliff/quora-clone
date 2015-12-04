get '/' do
	@user = current_user
  erb :"static/index"
end