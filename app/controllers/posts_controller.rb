class PostsController < ApplicationController
  def create
  @channel = Channel.find(params[:channel_id])
  @post = @channel.posts.create(post_params)
  redirect_to channel_path(@channel)
  end

  def show
    @channel = Channel.find(params[:channel_id])
    @post = Post.find(params[:id])
    @comments = Comment.all
  end

def destroy
  @channel = Channel.find(params[:channel_id])
  @post = @channel.posts.find(params[:id])
  @post.destroy
  redirect_to channel_path(@channel)
end
def edit
  @post = Post.find(params[:id])
  @channel = Channel.find(params[:channel_id])
end
def update
  @post = Post.find(params[:id])
  @channel = Channel.find(params[:channel_id])
  if @post.update(post_params)
    redirect_to @channel
  else
    render 'edit'
  end
end
def new
  @channel = Channel.find(params[:channel_id])
  @post = @channel.posts.build
end
private
def post_params
  params.require(:post).permit(:text, :title).merge(user: current_user)
end
end
