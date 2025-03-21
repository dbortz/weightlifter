class Ui::Card::TitleComponent < ViewComponent::Base
  def initialize(class_name: "")
    @class_name = class_name
  end

  def classes
    [
      "text-2xl font-semibold leading-none tracking-tight",
      @class_name
    ].join(" ")
  end

  def call
    content_tag :h3, content, class: classes
  end
end 