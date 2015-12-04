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

post "/answers" do
	# byebug
	@user = current_user
	@answer = Answer.create(body: params[:body], question_id: session[:question_id], user_id: session[:user_id])
		erb :'question/show'
		#redirect to "/question/#{question.id}"
end