class SerieSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :image_url, :slug, :description

  has_many :reviews
end
