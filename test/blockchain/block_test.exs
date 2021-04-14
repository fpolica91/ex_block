defmodule ExChain.Blockchain.BlockTest do
  use ExUnit.Case
  alias ExChain.BlockChain.Block
  describe "block" do
    test "genesis is valid" do
      response =  Block.genesis()
      expected_response = %Block{
       data: "genesis data",
       hash: "F277BF9150CD035D55BA5B48CB5BCBE8E564B134E5AD0D56E439DD04A1528D3B",
       last_hash: "-",
       timestamp: 1599909623805627
     }

     assert expected_response == response
    end
  end


  describe "mines a new block" do
    test "mine_block/2" do
      %Block{hash: hash} = genesis_block = Block.genesis()
      # gen = Block.genesis()
      mined_block = genesis_block |> Block.mine_block("this is mined data")
      assert %Block{data: "this is mined data",  last_hash: ^hash } = mined_block
    end
  end
end
