class CreateMeasurements < ActiveRecord::Migration[5.0]
  def change
    create_table :measurements do |t|
      t.datetime :date
      t.float :temp
      t.integer :hum

      t.timestamps
    end
  end
end
