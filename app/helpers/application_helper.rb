module ApplicationHelper
  def sortable(column, title = nil)
    title ||= column.titleize
    css_class = column == sort_column ? "current #{sort_direction}" : nil
    direction = column == sort_column && sort_direction == "asc" ? "desc" : "asc"
    if params[:sort] == column
      link_to "#{title} <i class='#{direction == "desc" ? "icon-chevron-down" : "icon-chevron-up"}'></i>".html_safe, {:sort => column, :direction => direction}, {:class => css_class}
     else
       link_to "#{title}".html_safe, {:sort => column, :direction => direction}, {:class => css_class}
     end
  end
  
  def link_to_add_fields(name, f, association, html_options={}, color=true)
     new_object = f.object.send(association).klass.new
     id = new_object.object_id
     fields = f.fields_for(association, new_object, child_index: id) do |builder|
       render(association.to_s.singularize + "_fields", f: builder, number: '_NUM_', new_field: true)
     end
     html_options[:data] = {id: id, fields: fields.gsub("\n", "")}
     link_to(name, '#', html_options) #class: "add_fields", data: {id: id, fields: fields.gsub("\n", "")})
   end

   def render_new_nested_fields(f, association)
      new_object = f.object.send(association).klass.new
      id = new_object.object_id
      fields = f.fields_for(association, new_object, child_index: id) do |builder|
        render(association.to_s.singularize + "_fields", f: builder, number: '_NUM_', new_field: true )
      end
      # html_options[:data] = {id: id, fields: fields.gsub("\n", "")}
      # link_to(name, '#', html_options) #class: "add_fields", data: {id: id, fields: fields.gsub("\n", "")})
      fields
    end
   
  
end
