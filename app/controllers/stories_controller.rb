class StoriesController < ApplicationController

  def show
    @story = Story.find(params[:id])
  end

  def new
    @story = Story.new
  end

  def create
    @story = current_user.stories.new(story_params)
    @story.expires_at = Time.now + 24.hours
    @story.save
  end

  def destroy
    return if current_user != @story.user || Time.now < @story.expires_at
    @story.destroy
  end

  private

  def story_params
    params.require(:story).permit(:image, :user_id)
  end
end
