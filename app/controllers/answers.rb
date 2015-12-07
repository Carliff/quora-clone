# Display new answer form
# get "/answers/new" do
# 	@user = current_user
# 	erb :"answer/new"
# end

get "/questions/:question_id/answers/new" do
	@user = current_user
	@question = Question.find(params[:question_id])
	erb :'answer/new'
end

# Create new Answer

post "/questions/:question_id/answers" do
	question = Question.find(params[:question_id])
	answer = question.answers.create(body: params[:body], user_id: current_user.id)
		# erb :'question/show'
		redirect to "/questions/#{question.id}"
end