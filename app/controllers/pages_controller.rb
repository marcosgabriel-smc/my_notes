class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[home about index]

  def home
  end

  def about
  end

  def index
    @posts = Post.where(public: true).order(created_at: :desc).page(params[:page]).per(6)
  end
end
