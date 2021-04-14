defmodule ExChain.Blockchain.BlockchainTest do
  use ExUnit.Case
  alias ExChain.BlockChain.Block
  alias ExChain.BlockChain
  describe "blockchain" do
    test "should start with the genesis block" do
      expected_response = %Block{
        data: "genesis data",
        hash: "F277BF9150CD035D55BA5B48CB5BCBE8E564B134E5AD0D56E439DD04A1528D3B",
        last_hash: "-",
        timestamp: 1599909623805627
      }
      blockchain = BlockChain.build()

    # the first element in the blockchain should be the gensis block
     assert expected_response == hd(blockchain.chain)
    end
  end



end
