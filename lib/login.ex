defmodule Chatty.Login do
  require NITRO
  require Logger

  def event(:init) do
    buttons = [
      { :one, NITRO.button(id: :one, name: "one", body: "one", postback: :one, source: [:user]) },
      { :two, NITRO.button(id: :two, name: "two", body: "two", postback: :two, source: [:user]) },
      { :three, NITRO.button(id: :three, name: "three", body: "three", postback: :three, source: [:user]) }
    ]

    init_buttons(buttons)
  end
  def event(button) when button in [:one, :two, :three] do
    user = :nitro.to_list(:nitro.q(:user))
    room = :nitro.to_binary(button)

    :n2o.user(user)
    :n2o.session(:room, room)
    :nitro.redirect(["/app/index.htm?room=", room])
  end
  def event(unexpected) do
    unexpected
    |> inspect()
    |> Logger.warning(:warn)
  end

  defp init_buttons([]), do: :ok
  defp init_buttons([{id, button} | tail]) do
    :nitro.update(id, button)
    init_buttons(tail)
  end


end