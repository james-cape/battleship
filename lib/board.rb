class Board
  attr_reader :cells

   def initialize

     @cells = {
         "A1" => Cell.new("A1"),
         "A2" => Cell.new("A2"),
         "A3" => Cell.new("A3"),
         "A4" => Cell.new("A4"),
         "B1" => Cell.new("B1"),
         "B2" => Cell.new("B2"),
         "B3" => Cell.new("B3"),
         "B4" => Cell.new("B4"),
         "C1" => Cell.new("C1"),
         "C2" => Cell.new("C2"),
         "C3" => Cell.new("C3"),
         "C4" => Cell.new("C4"),
         "D1" => Cell.new("D1"),
         "D2" => Cell.new("D2"),
         "D3" => Cell.new("D3"),
         "D4" => Cell.new("D4")
        }

     end

     def valid_coordinate?(coordinate_array)
       @cells.keys.include?(coordinate_array)
     end

     def valid_placement?(ship, coordinate_array)
       coor_array.length == ship.length
     end

#### provide column labels to compare 
     def extract_column
       columns = []
       @cells.keys.each do |column|
         columns << column[0]
       end
       columns
       # => ["A", "A", "A", "A", "B", "B", "B", "B", "C", "C", "C", "C", "D", "D", "D", "D"]
     end

     def extract_rows
       rows = []
       @cells.keys.each do |row|
         rows << row[1]
       end
       rows
       # => ["1", "2", "3", "4", "1", "2", "3", "4", "1", "2", "3", "4", "1", "2", "3", "4"]
     end


  end


# A -> A or B
#


























  # def cells
  #   i = 0
  #   until i >= @cells_array.length
  #     # binding.pry
  #     @cells[@coordinates_array[i]] = @cells_array[i]
  #     i += 1
  #   end
  #   @cells
  # end


#
