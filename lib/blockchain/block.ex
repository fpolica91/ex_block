defmodule ExChain.BlockChain.Block do
  @keys [:timestamp, :last_hash, :hash, :data]
  @enforce_keys @keys
  defstruct @keys

  @type t :: %__MODULE__{
    timestamp: pos_integer(),
    last_hash: String.t(),
    hash: String.t(),
    data: any()
  }

  def new(timestamp, last_hash, data) do
    hash = hash(timestamp, last_hash, data)
    %__MODULE__{timestamp: timestamp, last_hash: last_hash, hash: hash, data: data}
  end


  def genesis() do
    new(1_599_909_623_805_627, "-", "genesis data")
  end

  def hash(timestamp, last_hash, data) do
    data = "#{timestamp}:#{last_hash}:#{Jason.encode!(data)}"
    Base.encode16(:crypto.hash(:sha256, data))
  end

  def mine_block(%__MODULE__{hash: last_hash }, data) do
    new(get_timestamp(), last_hash, data)
  end

  defp get_timestamp() do
    DateTime.utc_now()
    |>DateTime.to_unix(1_000_000)

  end

end
