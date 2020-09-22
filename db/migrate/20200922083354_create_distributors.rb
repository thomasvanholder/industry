class CreateDistributors < ActiveRecord::Migration[6.0]
  def change
    create_table :distributors do |t|
      t.string :name
      t.string :email
      t.string :website
      t.string :phone
      t.string :address
      t.float :latitude
      t.float :longitude

      t.timestamps
    end
  end
end
