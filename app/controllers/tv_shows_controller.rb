class TvShowsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_tv_shows, only: [:show, :update, :destroy ]

  def index
    @tv_shows = TvShow.includes(:episodes)
    render json: @tv_shows
  end

  def show
    render json: @tv_show
  end

  def create
    @tv_show = TvShow.new(tv_show_params)
    @tv_show.user_id = current_user.id
    if @tv_show.save
      render json: @tv_show
    else
      render json: @tv_show.errors, status: :unprocessable_entity
    end
  end

  def update
    if @tv_show.update_attributes(tv_show_params)
      render json: @tv_show
    end
  end

  def destroy
    @tv_show.delete
    render json: @tv_show
  end

private

  def set_tv_shows
    @tv_show = TvShow.find(params[:id])
  end

  def tv_show_params
    params.require('tv_show').permit(:title, :description, :rank)
  end
end
