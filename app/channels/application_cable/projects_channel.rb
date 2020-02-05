class ProjectsChannel < ApplicationCable::Channel
  def follow(data)
    stream_from "projects:#{data['project_id']}"
  end

  def unfollow
    stop_all_streams
  end
end
