require_relative '../lib/logic.rb'

logic = Logic.new('X','O')
testBoardDraw = [['X','O','X'],['O','X','X'],['O','X','O']]
testBoardUnfinished = [['X','O','X'],['O',2,'X'],['O','X',1]]
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
end