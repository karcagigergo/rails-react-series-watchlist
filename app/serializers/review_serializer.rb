class ReviewSerializer
  include FastJsonapi::ObjectSerializer
  attributes :title, :description, :score, :serie_id
  belongs_to :serie
end
