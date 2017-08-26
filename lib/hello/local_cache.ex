defmodule Hello.LocalCache do
  use Nebulex.Cache, otp_app: :hello, adapter: Nebulex.Adapters.Local
end
