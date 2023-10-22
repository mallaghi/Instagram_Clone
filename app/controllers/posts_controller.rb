class PostsController < ApplicationController
  before_action :set_post, only: %i[ show edit update destroy]


  def index
    redirect_to root_path
  end


  def show
  end


  def new
    @post = Post.new
  end

  def edit
  end

  def contains_animal?(uploaded_image)
    tags_data = uploaded_image.dig('info', 'categorization', 'data', 'tags')
    tags_data&.each { |tag| puts "#{tag['tag']}: #{tag['confidence']}" }
    animal_tag = tags_data&.find { |tag| tag["tag"].downcase == 'animal' || tag["tag"].downcase == 'pet'}
    !animal_tag.nil?
  end

  def create
    @post = current_user.posts.new(post_params)

    uploaded_image = Cloudinary::Uploader.upload(params[:post][:images].second.tempfile.path, :categorization => "aws_rek_tagging", :auto_tagging => 0.7)
    puts "Uploaded Image: #{uploaded_image.inspect}"

    contains_animal = contains_animal?(uploaded_image)

    puts "CONTAINS ANIMAL:#{contains_animal}"

    # respond_to do |format|
    #   if contains_animal
    #     @post.save
    #     format.html { redirect_to root_path, notice: "Post was successfully created." }
    #     format.json { render :show, status: :created, location: @post }
    #   else
    #     @post.errors.add(:base, "Image must contain an animal.") unless contains_animal
    #     format.html { redirect_to root_path, status: :unprocessable_entity, alert: @post.errors.full_messages }
    #     format.json { render json: @post.errors, status: :unprocessable_entity }
    #   end
    # end
  end



  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to post_url(@post), notice: "Post was successfully updated." }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    return if current_user != @post.user
    @post.destroy

    respond_to do |format|
      format.html { redirect_to posts_url, notice: "Post was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

    def set_post
      @post = Post.find(params[:id])
    end

    def post_params
      params.require(:post).permit(:caption, :longitude, :latitude, :user_id, :allow_comments, :show_likes, images: [])
    end
end
