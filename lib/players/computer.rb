module Players
  class Computer < Player

    attr_accessor :my_last
    def initialize(token)
      super
      @my_last = nil
    end

    def move(board)
      if @token == "X"
#////////////// EDGE CASE //////////////
        if board.turn_count == 0
           @my_last = "4"

        elsif board.turn_count == 2 && @my_last == "4"
          if board.last_move == "2" || board.last_move == "3"
            @my_last = "1"
          elsif board.last_move == "8" || board.last_move == "9"
            @my_last = "7"
          end

        elsif board.turn_count == 4
          if board.last_move == "7"
            @my_last = "5"
          end

        elsif board.turn_count == 6
          if board.last_move == "6"
            @my_last = "9"
          else
            @my_last = "6"
          end
        end
        #////////////// CENTER CASE //////////////

        if board.turn_count == 0
           @my_last = "5"

        elsif board.turn_count == 2 && @my_last == "4"
          if board.last_move.even? #if opponent plays 2, 4, 6, 8 => EDGE: OFFENSE MODE
            if board.last_move == "2" || board.last_move == "8"
              @my_last = "1" # REFACTOR: CAN ALSO BE 4, 7, 3,6,9
            elsif board.last_move == "4" || board.last_move == "6"
              @my_last = "3" # REFACTOR: CAN ALSO BE 1,2, 7,8,9
            end
          else #opponent plays corner: DEFENSE MODE
            @my_last = "7"  #A IMPLEMENTER
          end

        elsif board.turn_count == 4

          if @my_last == "1"
            if board.last_move == "9"
              @my_last = "7"
            else
              @my_last = "9" # WON!
            end
          end
          if @my_last == "3"
            if board.last_move == "7"
              @my_last = "1"
            else
              @my_last = "7" # WON!
            end
          end

        end

        elsif board.turn_count == 6
          if board.last_move == "6"
            @my_last = "9"
          else
            @my_last = "6"
          end
        end
      end



    end
  end
end



        #
        # case 1: EDGE
        #   ##################
        #   play 4
        #
        #   if player_2: 2/3
        #     play 1 then play 5
        #       if player_2 plays 9, play 8
        #           else play 9
        #   end
        #
        #   if player_2: 8/9
        #     play 7 then play 5
        #       play player_2 plays 3, play 6
        #           else play 3
        #   end
        #
        #   if player_2 plays anything else
        #     just follows
        #   end


          #####################
