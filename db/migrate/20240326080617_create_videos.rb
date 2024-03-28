class CreateVideos < ActiveRecord::Migration[7.1]
  def change
    create_table :videos do |t|
      t.references :organisation
      t.string :description
      t.text :file_data
      t.timestamps
    end
  end
end
