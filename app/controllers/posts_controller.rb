class PostsController < ApplicationController

  # http_basic_authenticate_with name:"admine",password: "123456",
  #                              except: [:index,:show]

  def index
    @post = Post.all
  end

  def new
    @post = Post.new
  end

  def show
    @post = Post.find(params[:id])
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update

    @post = Post.find(params[:id])
    if @post.user_id == current_user.id
      if @post.update(post_params)
        redirect_to @post
      else
        render 'edit'
      end
    else
      redirect_to home_path, notice: 'You are not authorized'
    end
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if (@post.save)
      redirect_to @post
    else
      render 'new'
    end
    # private
    # def post_params
    #   params.require(:post).permit(:title, :content, images: [])
    # end
  end

  def privacy_policy

  end

  private def post_params
    params.require(:post).permit(:title, :body, :answer_num)
  end

end

