require("bundler/setup")
Bundler.require(:default)

Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }

get '/' do
  erb(:index)
end

get '/:mode/surveys' do
  @mode = params[:mode]
  @surveys = Survey.all
  erb(:surveys)
end

post '/design/surveys' do
  @survey = Survey.new({title: params["title"]})
  if @survey.save
    redirect "/design/surveys/#{@survey.id}"
  else
    @surveys = Survey.all
    @mode = "design"
    erb(:surveys)
  end
end

get '/:mode/surveys/:id' do
  @mode = params[:mode]
  @survey = Survey.find(params[:id].to_i)
  erb(:survey)
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
