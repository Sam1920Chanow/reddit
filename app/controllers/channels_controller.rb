class ChannelsController < ApplicationController
  def index
    @channels = Channel.all
  end
  def create
    @channel = Channel.new(channel_params)
    @channel.save
    redirect_to @channel
  end

  def new
    @channel = Channel.new
  end

  def show
    @channel = Channel.find_by(id: params[:id])
  end
  def edit
    @channel = Channel.find(params[:id])
  end
  def update
  @channel = Channel.find(params[:id])

  if @channel.update(channel_params)
    redirect_to @channel
  else
    render 'edit'
  end
end
  private
  def channel_params
    params.require(:channel).permit(:title).merge(user: current_user)
  end
end
