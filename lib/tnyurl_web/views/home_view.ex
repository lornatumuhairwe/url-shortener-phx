defmodule TnyurlWeb.HomeView do
  use TnyurlWeb, :view

  def shorten_name(name) do
    if String.length(name) > 50 do
      String.split_at(name, 50) |> elem(0) |> String.pad_trailing(53, ".")
    else
      name
    end
  end
end
