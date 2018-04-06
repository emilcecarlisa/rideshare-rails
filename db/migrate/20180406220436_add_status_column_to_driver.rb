class AddStatusColumnToDriver < ActiveRecord::Migration[5.1]
  def change
    add_column(:drivers, :status, :string)
  end
end
