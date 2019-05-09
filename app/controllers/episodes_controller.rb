class EpisodesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_tv_show
  before_action :set_episode, only: [:show, :update, :destroy ]

  def index
    @episodes = @tv_show.episodes

    render :json => @episodes
  end

  def show
    render :json => @episode
  end

  def create
    @episode = @tv_show.episodes.build(episode_params)
    if @episode.save
      render :json => @episode
    else
      render json: @episode.errors, status: :unprocessable_entity
    end
  end

  def update
    if @episode.update_attributes(episode_params)
      render :json => @episode
    end
  end

  def destroy
    @episode.delete
    render :json => @episode
  end

  private

  def set_episode
    @episode = @tv_show.episodes.find(params[:id])
  end

  def set_tv_show
    @tv_show = TvShow.find(params[:tv_show_id])
  end

  def episode_params
    params.require('episode').permit(:title, :watched, :episode_no)
  end
end