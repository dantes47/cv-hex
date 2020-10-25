class CreateCvs < ActiveRecord::Migration[6.0]
  def change
    create_table :cvs do |t|
      t.string :link
      t.string :state
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
