class AddDescriptionToMovies < ActiveRecord::Migration[6.1]
  def change
    add_column :series, :description, :text
  end
end
