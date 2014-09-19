class CreateMusees < ActiveRecord::Migration
  def change
    create_table :musees do |t|

      t.timestamps
    end
  end
end
