class PagesController < ApplicationController


  def index_ac
    @page = Post.all
    @user = User.all
  end

  end
