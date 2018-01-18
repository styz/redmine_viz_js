require 'redmine'
require_dependency 'redmine_viz_js/hooks'

Redmine::Plugin.register :redmine_viz_js do
  name 'Redmine Viz Js plugin'
  author 'Yuji Sato'
  description 'This is a Viz.js plugin for Redmine'
  version '0.0.1'
  url 'https://github.com/styz/redmine_viz_js'
  author_url 'https://github.com/styz'

  Redmine::WikiFormatting::Macros.register do
    desc 'Wiki/Issues viz.js'
    macro :viz do |obj, args, text|
      rand = Redmine::Utils.random_hex(4)
      html_id = "viz-#{rand}"
      dot_id = "dot-#{rand}"
      out = ''.html_safe
      out << content_tag('div', text, :style => 'display:none;', :id => "#{dot_id}", :class => 'dot')
      out << content_tag('div', "", :style => 'border:1px solid #000000;', :id => "#{html_id}")
      out
    end
  end
end
