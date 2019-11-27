class CreateGroups < ActiveRecord::Migration[5.2]
	def change
		create_table :groups do |t|
			t.string :name
			t.string :description
			t.jsonb :meta_info
            t.references :application

			t.timestamps
		end
	end
end
