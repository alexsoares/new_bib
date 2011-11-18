# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def link_to_remove_fields(name, f)
    f.hidden_field(:_destroy) + link_to_function(name, "remove_fields(this)")
  end

  def link_to_add_fields(name, f, association)
    new_object = f.object.class.reflect_on_association(association).klass.new
    fields = f.fields_for(association, new_object, :child_index => "new_#{association}") do |builder|
      render("campos_" + association.to_s.singularize, :f => builder)
    end
    link_to_function(name, h("add_fields(this, \"#{association}\", \"#{escape_javascript(fields)}\")"))
  end
  def datepicker_tag(model, attribute, options ={}, datepicker_options ={})
    field_id = "#{model}_#{attribute}"
    field_name = "#{model}[#{attribute}]"
    field = ::ActionView::Helpers::InstanceTag.new(model, attribute, self)
    options = {:id => field_id, :name => field_name}.merge(options)
    datepicker_options = "#{options_for_javascript(datepicker_options)}"
    js = "$(document).ready(function() { $(\"\##{field_id}\").datepicker(#{datepicker_options});});"
    field.tag(:input, options) + javascript_tag(js)
  end

end
