class Recipe < ApplicationRecord
  belongs_to :user
  
  has_many :recipe_ingredients, dependent: :destroy
  has_many :ingredients, through: :recipe_ingredients
  
  validates :name, presence: true, length: { minimum: 2, maximum: 255 }
  validates :source_url, presence: true, format: { with: URI::DEFAULT_PARSER.make_regexp, message: "must be a valid URL" }

  # Enable vector similarity search
  include PgVector::Model
  has_vector :embedding

  before_save :generate_embedding, if: :should_generate_embedding?

  def to_s
    <<~RECIPE
      #{name}

      Ingredients:
      #{recipe_ingredients.map(&:to_s).join("\n")}

      Source: #{source_url}
    RECIPE
  end

  private

  def should_generate_embedding?
    embedding.nil? || name_changed? || recipe_ingredients.any?(&:changed?)
  end

  def generate_embedding
    service = RecipeLlmService.new
    self.embedding = service.embed(to_s)
  end
end
