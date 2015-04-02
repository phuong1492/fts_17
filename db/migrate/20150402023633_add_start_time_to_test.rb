class AddStartTimeToTest < ActiveRecord::Migration
  def change
    add_column :tests, :start_time, :datetime
  end
end
