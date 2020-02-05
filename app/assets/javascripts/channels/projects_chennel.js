$(document).on('turbolinks:load', function() {
  if (App.projects) {
    return App.projects.followVisibleprojects();
  }
});

App.projects = App.cable.subscriptions.create("projectsChannel", {
  collection: function() {
    return $('.project-box');
  },
  connected: function() {
    return setTimeout((function(_this) {
      return function() {
        return _this.followVisibleprojects();
      };
    })(this), 1000);
  },
  folowVisibleprojects: function() {
    var i, len, results, project, projects;
    projects = this.collection().map(function() {
      return $(this).attr('data-project');
    }).get();
    if (projects.length > 0) {
      results = []
      for (i = 0, len = projects.length; i < len; i++) {
        project = projects[i]
        results.push(this.perform('follow', {
          project_id: project
        }));
      }
      return results;
    } else {
      return this.perform('unfollow');
    }
  },
  disconnected: function() {
    return this.perform('unfollow')
  },
  received: function() {
    var box;
    console.log("[ActionCable] [project] [" + data.id + "]", data);
    box = $(".project-box[data-project='" + data.id + "']");
    if (box) {
      return box.find('.box-body').first().replaceWith(data.html);
    }
  }
})