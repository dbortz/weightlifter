class Ui::Card::HeaderComponent < ViewComponent::Base
  def initialize(class_name: "")
    @class_name = class_name
  end

  def classes
    [
      "flex flex-col space-y-1.5 p-6",
      @class_name
    ].join(" ")
  end

  def call
    content_tag :div, content, class: classes
  end
end 