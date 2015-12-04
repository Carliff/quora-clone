# Display new answer form
get "/answers/new" do
	@user = current_user
	erb :"answer/new"
end

# Create new Answer

post "/answers" do
	# byebug
	@user = current_user
	@answer = Answer.new(body: params[:body], question_id: session[:question_id], user_id: session[:user_id])

	if @answer.save
		# erb :"/user/questions"
		redirect to "/answers/#{@answer.id}"
	else
		@warning = "Action failed, invalid or incomplete info, please retry"
		erb :"answer/new"
	end
end