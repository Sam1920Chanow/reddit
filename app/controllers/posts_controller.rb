class PostsController < ApplicationController
  def create
  @channel = Channel.find(params[:channel_id])
  @post = @channel.posts.create(post_params)
  redirect_to channel_path(@channel)
  end

def destroy
  @article = Article.find(params[:article_id])
  @comment = @article.comments.find(params[:id])
  @comment.destroy
  redirect_to article_path(@article)
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
  params.require(:post).permit(:text, :title)
end
end
