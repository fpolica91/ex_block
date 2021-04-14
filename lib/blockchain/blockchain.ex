defmodule ExChain.BlockChain do
 alias ExChain.BlockChain.Block

 @type t :: %__MODULE__{
  chain: [Block.t({})]
}

 defstruct ~w(chain)a

 def build() do
  %__MODULE__{}
  |>add_genesis()
 end

 defp add_genesis(%__MODULE__{} = blockchain) do
  %{blockchain | chain: [Block.genesis()]}
 end


 def add_block(%__MODULE__{chain: chain} = blockchain, data) do
  # gets the last block
  {last_block, _} = List.pop_at(chain, -1)
  blockchain
   = %{blockchain | chain: chain ++ [Block.mine_block(last_block, data)]}
   blockchain
 end


end
