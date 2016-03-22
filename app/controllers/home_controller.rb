class HomeController < ApplicationController
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

  private
  def channel_params
    params.require(:channel).permit(:title).merge(user: current_user)
  end
end
