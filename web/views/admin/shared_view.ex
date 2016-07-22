defmodule Changelog.Admin.SharedView do
  use Phoenix.HTML

  def semantic_datetime_select(form, field, opts \\ []) do
    builder = fn b ->
      ~e"""
      <div class="fields">
        <div class="three wide field"><%= b.(:month, []) %></div>
        <div class="two wide field"><%= b.(:day, []) %></div>
        <div class="two wide field"><%= b.(:year, []) %></div> at
        <div class="two wide field"><%= b.(:hour, []) %></div>:
        <div class="two wide field"><%= b.(:minute, []) %></div>&nbsp;UTC
      </div>
      """
    end

    datetime_select form, field, [builder: builder] ++ opts
  end

  def error_class(form, field) do
    if form.errors[field], do: "error", else: ""
  end

  def error_message(form, field) do
    case form.errors[field] do
      {message, _} ->
        content_tag :div, class: "ui pointing red basic label" do
          message
        end
      nil -> ""
    end
  end

  def help_icon(help_text) do
    ~e"""
    <i class="help circle icon fluid" data-popup="true" data-variation="wide" data-content="<%= help_text %>"></i>
    """
  end

  def is_persisted(struct), do: is_integer(struct.id)
end