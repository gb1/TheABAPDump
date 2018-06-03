defmodule AbapDump.Factory do
  use ExMachina.Ecto, repo: AbapDump.Repo

  def user_factory do
    %AbapDump.User{
      token: "ffnebyt73bich9",
      email: "batman@example.com",
      name: "Bruce Wayne",
      provider: "google"
    }
  end
end
