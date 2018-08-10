
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

  get "/posts/:id/edit" do
    @post = Post.find_by_id(params[:id])
    erb :edit
  end

  patch "/posts/:id" do
    post = Post.find_by_id(params[:id])
    post.name = params[:name]
    post.content = params[:content]
    post.save

    redirect :"/posts/#{post.id}"
  end

  delete "/posts/:id/delete" do
    @post = Post.find_by_id(params[:id])
    @post.destroy

    erb :delete
  end



end
