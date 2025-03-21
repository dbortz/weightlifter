class Ui::Card::DescriptionComponent < ViewComponent::Base
  def initialize(class_name: "")
    @class_name = class_name
  end

  def classes
    [
      "text-sm text-muted-foreground",
      @class_name
    ].join(" ")
  end

  def call
    content_tag :p, content, class: classes
  end
end 