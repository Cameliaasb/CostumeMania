module ApplicationHelper
  def filter(type, value, text)
    if params[type.to_sym] == value
      link_to request.params.except(type.to_sym), class: "filter-link active" do
        text.to_s
      end
    else
      link_to request.params.merge(type.to_sym => value), class: "filter-link" do
        text.to_s
      end
    end
  end
end
