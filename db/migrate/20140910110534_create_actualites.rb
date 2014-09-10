class CreateActualites < ActiveRecord::Migration
  def change
    create_table :actualites do |t|

      t.timestamps
    end
  end
end
