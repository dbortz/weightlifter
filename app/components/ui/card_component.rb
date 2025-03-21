class Ui::CardComponent < ViewComponent::Base
  def initialize(class_name: "")
    @class_name = class_name
  end

  def classes
    [
      "rounded-lg border bg-card text-card-foreground shadow-sm",
      @class_name
    ].join(" ")
  end

  def call
    content_tag :div, content, class: classes
  end
end 