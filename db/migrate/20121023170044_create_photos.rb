class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|

      t.string :name, :description, :file

      t.timestamps
    end
  end
end
