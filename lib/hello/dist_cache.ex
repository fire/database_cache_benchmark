defmodule Hello.DistCache do
  use Nebulex.Cache, otp_app: :hello, adapter: Nebulex.Adapters.Dist
end
