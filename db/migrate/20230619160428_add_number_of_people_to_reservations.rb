class AddNumberOfPeopleToReservations < ActiveRecord::Migration[7.0]
  def change
    add_column :reservations, :number_of_people, :integer
  end
end
