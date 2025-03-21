class Ui::ButtonComponent < ViewComponent::Base
  VARIANTS = {
    default: "bg-primary text-primary-foreground hover:bg-primary/90",
    destructive: "bg-destructive text-destructive-foreground hover:bg-destructive/90",
    outline: "border border-input bg-background hover:bg-accent hover:text-accent-foreground",
    secondary: "bg-secondary text-secondary-foreground hover:bg-secondary/80",
    ghost: "hover:bg-accent hover:text-accent-foreground",
    link: "text-primary underline-offset-4 hover:underline"
  }

  SIZES = {
    default: "h-10 px-4 py-2",
    sm: "h-9 rounded-md px-3",
    lg: "h-11 rounded-md px-8",
    icon: "h-10 w-10"
  }

  def initialize(variant: :default, size: :default, class_name: "", **options)
    @variant = variant.to_sym
    @size = size.to_sym
    @class_name = class_name
    @options = options
  end

  def classes
    [
      "inline-flex items-center justify-center rounded-md text-sm font-medium ring-offset-background transition-colors focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:pointer-events-none disabled:opacity-50",
      VARIANTS[@variant],
      SIZES[@size],
      @class_name
    ].join(" ")
  end

  def call
    content_tag :button, content, @options.merge(class: classes)
  end
end 