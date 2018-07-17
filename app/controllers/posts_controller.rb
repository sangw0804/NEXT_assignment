class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :edit_notice, :update, :destroy]
  before_action :check_log_in

  # GET /posts
  # GET /posts.json
  def index
      @notices = Post.where(isNotice: true).order(updated_at: :desc)
      @posts = Post.where(isNotice: false).order(updated_at: :desc)
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
  end

  # GET /posts/new
  def new
    @post = Post.new
  end

  def new_notice
    @post = Post.new
  end

  # GET /posts/1/edit
  def edit
  end

  def edit_notice
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = Post.new(post_params)

    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: 'Post was successfully created.' }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def search
    permittedParams = search_params
    
    case permittedParams[:select]
    when "title"
      @notices = Post.where(title: permittedParams[:q]).where(isNotice: true).order(updated_at: :desc)
      @posts = Post.where(title: permittedParams[:q]).where(isNotice: false).order(updated_at: :desc) 
    when "name"
      @notices = User.where(name: permittedParams[:q]).first.posts.where(isNotice: true).order(updated_at: :desc)
      @posts = User.where(name: permittedParams[:q]).first.posts.where(isNotice: false).order(updated_at: :desc)
    when "email"
      @notices = User.where(email: permittedParams[:q]).first.posts.where(isNotice: true).order(updated_at: :desc)
      @posts = User.where(email: permittedParams[:q]).first.posts.where(isNotice: false).order(updated_at: :desc)
    else
      @notices = Post.where(isNotice: true).order(updated_at: :desc)
      @posts = Post.where(isNotice: false).order(updated_at: :desc)
    end
    render 'index'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:title, :user_id, :content, :isNotice)
    end

    def search_params
        params.require(:search).permit(:q, :select)
    end

    def check_log_in
      unless user_signed_in?
        redirect_to new_user_session_path
      end
    end
end
