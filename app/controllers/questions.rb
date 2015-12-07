# Display new question form
get "/questions/new" do
	@user = current_user
	erb :"question/new"
end

# Create new question

post "/questions" do
	# byebug
	@user = current_user
	@question = Question.new(question: params[:question], user_id: session[:user_id])

	if @question.save
		# erb :"/user/questions"
		redirect to "/questions/#{@question.id}"
	else
		@warning = "Action failed, invalid or incomplete info, please retry"
		erb :"question/new"
	end
end

# View the question

get "/questions/:id" do
	@user = current_user
	@question = Question.find(params[:id])
	@answers = @question.answers
	erb :'question/show'
end

# Delete question

delete '/questions/:id' do
	@user = current_user
	question = Question.find(params[:id])
	question.destroy
	erb :'user/questions'
end