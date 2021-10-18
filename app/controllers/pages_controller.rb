class PagesController < ApplicationController


  def index_ac
    @page = Post.all
  end
  end
