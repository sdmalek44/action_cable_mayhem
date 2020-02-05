module CableServices
  class NotifyJobService
    attr_reader :project, :action, :user

    def initialize(params)
      @project = params[:project]
      @action = params[:action]
      @user = params[:user]
    end

    def self.call(params)
      new(params).send(:perform)
    end

    private

    def perform
      if action == :update
        # instantiates an object and passes it to a background job
        Cables::ProjectItemDomJob.perform_later(project)
      end
    end
  end
end
