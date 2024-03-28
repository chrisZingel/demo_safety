class VideosController < ApplicationController
  before_action :set_video, only: %i[ show edit update destroy ]

  # GET /videos or /videos.json
  def index
    @organisation=current_user.organisation
    @videos = @organisation.videos
  end

  # GET /videos/1 or /videos/1.json
  def show
    authorize @video
  end

  # GET /videos/new
  def new
    @organisation=current_user.organisation
    @video = @organisation.videos.new
    authorize @video
  end

  # GET /videos/1/edit
  def edit
    authorize @video
  end

  # POST /videos or /videos.json
  def create
    @organisation=current_user.organisation
    @video = @organisation.videos.new(video_params)
    authorize @video

    respond_to do |format|
      if @video.save
        format.html { redirect_to video_url(@video), notice: "Video was successfully created." }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /videos/1 or /videos/1.json
  def update
    authorize @video
    respond_to do |format|
      if @video.update(video_params)
        format.html { redirect_to video_url(@video), notice: "Video was successfully updated." }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /videos/1 or /videos/1.json
  def destroy
    authorize @video
    @video.destroy!
    respond_to do |format|
      format.html { redirect_to videos_url, notice: "Video was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_video
    @organisation=current_user.organisation
    @video = @organisation.videos.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def video_params
    params.require(:video).permit(:description, :file)
  end
end
