module ApplicationHelper

  def link_to_add_fields(name, f, association, object_id, classes)
    new_object = f.object.send(association).klass.new
    id = new_object.object_id.to_s
    fields = f.fields_for(association, new_object, child_index: id) do |builder|
      render("partials/" + association.to_s.singularize + "_form", :f => builder)
    end
    link_to(name, '#',:id => object_id, :class => classes, data: {id: id, fields: fields.gsub("\n", "")})
  end

end
