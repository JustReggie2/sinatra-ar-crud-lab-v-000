
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
  end

  get '/articles/new' do
    erb :new
  end

  post '/articles' do
    article = Article.new({title: params[:title], content: params[:content]})
    article.save

    redirect to '/articles'
  end

  get '/articles' do
    @articles = Articles.all

    erb :index
  end
end
