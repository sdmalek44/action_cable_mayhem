module Cables
  class ProjectItemDomJob < ApplicationJob
    def perform(project)
      ActionCable.server.broadcast(
        "projects:#{project.id}",
        id: project.id,
        html: render_project(project)
      )
    end

    private

    def render_project(project)
      ApplicationController.render(
        partial: 'projects/project',
        locals: { project: project}
      )
  end
end