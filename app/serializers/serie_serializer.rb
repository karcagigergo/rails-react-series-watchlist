class SerieSerializer
  include JSONAPI::Serializer
  attributes :name, :image_url, :slug, :description

  has_many :reviews
end
