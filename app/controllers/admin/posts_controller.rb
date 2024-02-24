class Admin::PostsController < Admin::AdminController
  layout 'admin'
  before_action :set_post, only: %i[ edit update destroy ]

  # GET /posts or /posts.json
  def index
    @posts = Post.order(publishedOn: :desc)
    authorize([:admin, @posts])
  end

  # GET /posts/new
  def new
    @post = Post.new
    @post.publishedOn = Time.now
    authorize([:admin, @post])
  end

  # GET /posts/1/edit
  def edit
    authorize([:admin, @post])
  end

  # POST /posts or /posts.json
  def create
    @post = Post.new(post_params)
    authorize([:admin, @post])
    respond_to do |format|
      if @post.save
        format.html { redirect_to admin_posts_path, notice: "Post was successfully created." }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1 or /posts/1.json
  def update
    authorize([:admin, @post])
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to admin_posts_path, notice: "Post was successfully updated." }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1 or /posts/1.json
  def destroy
    @post.destroy!
    authorize([:admin, @post])
    respond_to do |format|
      format.html { redirect_to admin_posts_url, notice: "Post was successfully destroyed." }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def post_params
      params.require(:post).permit(:name, :content, :draft, :publishedOn)
    end
end
