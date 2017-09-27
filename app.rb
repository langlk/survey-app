require("bundler/setup")
Bundler.require(:default)

Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }

get '/' do
  erb(:index)
end

get '/surveys/:mode' do
  @mode = params[:mode]
  @surveys = Survey.all
  erb(:surveys)
end

get '/surveys/:mode/:id' do
  @mode = params[:mode]
  @survey = Survey.find(params[:id].to_i)
  erb(:survey)
end

post '/surveys/design' do
  @survey = Survey.new({title: params["title"]})
  if @survey.save
    redirect "/surveys/design/#{@survey.id}"
  else
    @surveys = Survey.all
    @mode = "design"
    erb(:surveys)
  end
end
