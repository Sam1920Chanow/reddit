class CommentsController < ApplicationController
  def index
  end

  def new
    @channel = Channel.find(params[:channel_id])
    @post = Post.find(params[:post_id])
    @comment = @post.comments.build
  end

  def edit
    @post = Post.find(params[:post_id])
    @channel = Channel.find(params[:channel_id])
    @comment = Comment.find(params[:id])
  end

  def update
    @post = Post.find(params[:post_id])
    @comment = Comment.find(params[:id])
    @channel = Channel.find(params[:channel_id])
    if @comment.update(comment_params)
      redirect_to channel_post_path(@channel, @post)
    else
      render 'edit'
    end
  end
  def destroy
    @channel = Channel.find(params[:channel_id])
    @post = Post.find(params[:post_id])
    @comment = Comment.find(params[:id])

    @comment.destroy

    redirect_to channel_post_path(@channel, @post)
  end
  def create
    @channel = Channel.find(params[:channel_id])
    @post = Post.find(params[:post_id])
    @comment = @post.comments.create(comment_params)
    redirect_to channel_post_path(@channel, @post)
  end
  private

  def comment_params
    params.require(:comment).permit(:text).merge(user: current_user)
  end
end
