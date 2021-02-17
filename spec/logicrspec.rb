require_relative '../lib/logic.rb'

logic = Logic.new('X','O')
testBoardDraw = [['X','O','X'],['O','X','X'],['O','X','O']]
testBoardUnfinished = [['X','O','X'],['O',5,'X'],['O','X',9]]
testBoardWin = [['X','O','X'],['O','X','X'],['O','X','X']]

RSpec.describe Logic do
    describe "#check_draw" do
        it "Returns true if all board is filled" do
            expect(logic.check_draw(testBoardDraw)).to eql(true)
        end

        it "Returns false if all board is not filled" do
            expect(logic.check_draw(testBoardUnfinished)).to eql(false)
        end
    end

    describe "#check_win" do
        it "Returns nil if theres not a win combination" do
            expect(logic.check_win(testBoardDraw)).to eql(nil)
        end

        it "Returns true if theres a win combination" do
            expect(logic.check_win(testBoardWin)).to eql(true)
        end
    end

    describe "#check_status" do
        it "Returns true as the array entered is a draw" do
            expect(logic.check_status(testBoardDraw)).to eql(true)
        end

        it "Returns true as the array entered is a win" do
            expect(logic.check_status(testBoardWin)).to eql(true)
        end

        it "Returns false as the array entered is unfinished" do
            expect(logic.check_status(testBoardUnfinished)).to eql(false)
        end
    end

    describe "#numeric?" do
        it "Returns true if the entered number is an integer" do
            expect(logic.numeric?(1)).to eql(true)
        end

        it "Returns false for anything that is not an Integer" do 
            expect(logic.numeric?("Hello World")).to eql(false)
        end
    end

    describe "check_if_filled" do 
        it "Returns true if the position is filled" do
            expect(logic.check_if_filled(testBoardUnfinished, 1)).to eql(true)
        end
        it "Returns false if the position is not filled" do
            expect(logic.check_if_filled(testBoardUnfinished, 5)).to eql(false)
        end
    end

    describe "check_move" do
        
    end
end