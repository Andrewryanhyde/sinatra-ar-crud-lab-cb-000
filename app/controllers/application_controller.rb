
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do

  end

  get '/posts/new' do
    erb :new
  end

  get 'posts' do
    @posts = Posts.all
    erb :index
  end

  post '/posts' do
    Post.create(params)
    @posts = Post.all
    erb :index
  end

  get "/posts/:id" do
   @post = Post.find_by_id(params[:id])
   erb :show
 end


end
