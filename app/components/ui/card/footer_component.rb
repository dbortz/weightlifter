class Ui::Card::FooterComponent < ViewComponent::Base
  def initialize(class_name: "")
    @class_name = class_name
  end

  def classes
    [
      "flex items-center p-6 pt-0",
      @class_name
    ].join(" ")
  end

  def call
    content_tag :div, content, class: classes
  end
end 