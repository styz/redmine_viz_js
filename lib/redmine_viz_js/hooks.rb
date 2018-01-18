module RedmineVizJs
  class Hook < Redmine::Hook::ViewListener
    def view_layouts_base_html_head(context = {})
      tags = javascript_include_tag 'viz.js', plugin: 'redmine_viz_js'
      tags
    end
  end

  class Hook < Redmine::Hook::ViewListener
    def view_layouts_base_content(context = {})
      tags = javascript_tag("$(function() {" +
               "$('div.dot').each(function(i, elem) {" +
               "$('div#viz'+elem.id.slice(3))[0].innerHTML = Viz(elem.innerText);" +
               "});" +
               "})")
      tags
    end
  end
end
