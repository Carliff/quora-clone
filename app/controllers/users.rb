# User login

# post '/users/login' do
# 	user = User.find_by(email: params[:email], password: params[:password])
# 	session[:user_id] = user.id
# 	redirect "/users/#{user.id}"
# end

post '/users/login' do
	User.connection
	user = User.authenticate(params[:email], params[:password])
	if user 
		session[:user_id] = user.id
		redirect "/users/#{user.id}"
	else
		@warning = "Login failed, invalid details, please retry"
		erb :'user/index'
	end
end

# User logout

get '/users/logout' do
	session[:user_id] = nil
	redirect '/'
end

# Display new user form
get '/users/new' do
	erb :"user/new"
end

# Create new user

post "/users" do
	# byebug
	user = User.new(name: params[:name], email: params[:email], password: params[:password], password_confirmation: params[:password_confirmation])

	if user.save
		redirect "/users/#{user.id}"
	else
		@warning = "Sign up failed, invalid or incomplete info, please retry"
		erb :'/user/new'
	end
end

# View all user questions

get "/users/questions" do
	@user = current_user
	@questions = Question.where(user_id: session[:user_id])
	erb :'user/questions'
end


# View user profile

get '/users/:id' do
	@user = User.find(params[:id])
	erb :'user/show'
end

# Display user edit form

get '/users/:id/edit' do
	@user = User.find(params[:id])
	erb :'user/edit'
end 

# Update user

patch '/users/:id' do
	user = User.find(params[:id])
	user.update(name: params[:name], email: params[:email], password: params[:password])
	redirect "/users/#{user.id}"
end

# Delete user

delete '/users/:id' do
	user = User.find(params[:id])
	user.destroy
	erb :'static/index'
end

# View login page

get '/users' do
	erb :'user/index'
end





