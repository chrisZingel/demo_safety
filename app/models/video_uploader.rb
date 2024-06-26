class VideoUploader < Shrine
  plugin :processing
  plugin :versions

  process(:store) do |data|
    mov = data.download
    video = Tempfile.new(['video','.mp4'])
    screenshot = Tempfile.new(['video','.jpeg'])
    movie = FFMPEG::Movie.new(mov.path)
    movie.transcode(video.path)
    movie.screenshot(screenshot.path)

    mov.delete
    {video: video, screenshot: screenshot}
  end
end
