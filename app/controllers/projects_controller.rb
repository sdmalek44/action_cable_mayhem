class ProjectsController < ApplicationController
  def index;end

  def update
    if @project.update(project_params)
      invoke_cables
      redirect_back(
        fallback_location: root_path,
        notice: 'Project was successfully updated.'
      )
    end
  end

  private

  def invoke_cables
    CableServices::NotifyJobService.new(
      project: @project,
      action: action_name.to_sym,
      user: current_user
    )
  end
end