class Venue < ApplicationRecord
    validates :name, presence: true, uniqueness: true
    validates :layout_row, presence: true, numericality: { only_integer: true, greater_than: 4 }
    validates :layout_column, presence: true, numericality: { only_integer: true, greater_than: 4 }

    has_many :seats

    after_create :create_default_seats

    def create_default_seats
        logger.debug "somappa ======= #{self.layout_row} : #{self.layout_column}"
        middle_range = get_middle_range(self.layout_column)
        front_rows = []
        # assuming seats con't cross over 18278 so hard coded range ('a'..'zzz')
        ('a'..'zzz').each_with_index do |row, index|
            break unless index < self.layout_row 
            front_rows << row if index == 0 
            logger.debug front_rows
            (1..self.layout_column).each do |column|
                seat = self.seats.new 
                seat.seat_id = row + column.to_s
                seat.row = row
                seat.column = column
                # middle and front highest presedence 1
                # front presendence 2
                # middle presendence 3
                # side presendence 4
                if (middle_range.include? column and front_rows.include? row)
                    seat.closest = 1
                elsif (front_rows.include? row)
                    seat.closest = 2
                elsif (middle_range.include? column)
                    seat.closest = 3
                else
                    #default 
                end
                seat.save 
            end
        end
    end

    def get_middle_range column
        middle = column / 3
        return (1+middle..middle+middle)
    end
end
