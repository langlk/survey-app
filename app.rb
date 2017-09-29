require("bundler/setup")
Bundler.require(:default)

Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }

get '/' do
  erb(:index)
end

get '/:mode/surveys' do
  @mode = params[:mode]
  @surveys = Survey.order(:title)
  erb(:surveys)
end

post '/design/surveys' do
  @survey = Survey.new({title: params["title"]})
  if @survey.save
    redirect "/design/surveys/#{@survey.id}"
  else
    @surveys = Survey.order(:title)
    @mode = "design"
    erb(:surveys)
  end
end

get '/:mode/surveys/:id' do
  @mode = params[:mode]
  @survey = Survey.find(params[:id].to_i)
  if @mode == 'design'
    erb(:survey)
  elsif @mode == 'take'
    erb(:take_survey)
  end
end

get '/design/surveys/:id/edit' do
  @survey = Survey.find(params[:id].to_i)
  erb(:survey_edit)
end

patch '/design/surveys/:id/edit' do
  @survey = Survey.find(params[:id].to_i)
  if @survey.update({title: params["title"]})
    redirect "/design/surveys/#{@survey.id}"
  else
    erb(:survey_edit)
  end
end

delete '/design/surveys/:id/delete' do
  @survey = Survey.find(params[:id].to_i)
  if @survey.destroy
    redirect '/design/surveys'
  else
    @object = @survey
    erb(:errors)
  end
end

post '/design/surveys/:id/add-question' do
  @survey = Survey.find(params[:id].to_i)
  @question = Question.new({
    question_text: params['question-text'],
    number: params['number'].to_i,
    survey_id: @survey.id
  })
  if @question.save
    redirect "design/surveys/#{@survey.id}"
  else
    @mode = "design"
    erb(:survey)
  end
end

post '/design/questions/:id/add-answer' do
  question = Question.find(params[:id].to_i)
  @answer = Answer.new({answer_text: params['answer-text'], question_id: question.id, user_count: 0})
  if @answer.save
    redirect "/design/surveys/#{question.survey_id}"
  else
    @mode = "design"
    @survey = question.survey
    erb(:survey)
  end
end

get '/design/questions/:id/edit' do
  @question = Question.find(params[:id].to_i)
  erb(:question_edit)
end

patch '/design/questions/:id/edit' do
  @question = Question.find(params[:id].to_i)
  if @question.update({question_text: params['question-text'], number: params['number'].to_i})
    redirect "/design/surveys/#{@question.survey_id}"
  else
    erb(:question_edit)
  end
end

delete '/design/questions/:id/delete' do
  @question = Question.find(params[:id].to_i)
  if @question.destroy
    redirect "/design/surveys/#{@question.survey_id}"
  else
    @object = @question
    erb(:errors)
  end
end

get '/design/answers/:id/edit' do
  @answer = Answer.find(params[:id].to_i)
  erb(:answer_edit)
end

patch '/design/answers/:id/edit' do
  @answer = Answer.find(params[:id].to_i)
  if @answer.update({answer_text: params['answer-text']})
    redirect "/design/surveys/#{@answer.question.survey_id}"
  else
    erb(:answer_edit)
  end
end

delete '/design/answers/:id/delete' do
  @answer = Answer.find(params[:id].to_i)
  if @answer.delete
    redirect "/design/surveys/#{@answer.question.survey_id}"
  else
    @object = @answer
    erb(:errors)
  end
end

post '/take/surveys/:id' do
  @survey = Survey.find(params[:id].to_i)
  @survey.questions.each do |question|
    if question.answers.any?
      answer_id = params['question-' + question.id.to_s].to_i
      answer = Answer.find(answer_id)
      if !answer.update({user_count: (answer.user_count + 1)})
        @object = answer
        erb(:errors)
      end
    end
  end
  redirect "/take/surveys/#{@survey.id}/success"
end

get '/take/surveys/:id/success' do
  @survey = Survey.find(params[:id].to_i)
  erb(:success)
end
