# If the attribute in question is true, then set the CSS style to display:none for the block. Regardless, rap the result in a <div> tag.

module ApplicationHelper
  def hidden_div_if(condition, attributes = {}, &block)
    if condition
      attributes["style"] = "display: none"
    end
    content_tag("div", attributes, &block)
  end
end
