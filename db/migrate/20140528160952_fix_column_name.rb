class FixColumnName < ActiveRecord::Migration
  	def change
    change_table :posts do |t|
      t.rename :imageurl, :title
    end
  end
end
