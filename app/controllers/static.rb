# Home page

get '/' do
	@user = current_user
	@question = Question.all
  erb :"static/index"
end

# # All Questions Page
# get '/questions' do
# 	@user = current_user
# 	@question = Question.all
# 	erb :"static/questions"
# end