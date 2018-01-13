defmodule ChangelogWeb.NewsAdControllerTest do
  use ChangelogWeb.ConnCase

  alias Changelog.Hashid
  alias ChangelogWeb.NewsAdView

  test "getting a news ad page via hashid", %{conn: conn} do
    ad = insert(:news_ad, headline: "Hash ID 4 EVA!")
    hashid = Hashid.encode(ad.id)
    conn = get(conn, news_ad_path(conn, :show, hashid))
    assert redirected_to(conn) == news_ad_path(conn, :show, NewsAdView.slug(ad))
  end

  test "getting a news ad page via full slug", %{conn: conn} do
    ad = insert(:news_ad, headline: "You gonna like this")
    conn = get(conn, news_ad_path(conn, :show, NewsAdView.slug(ad)))
    assert html_response(conn, 200) =~ ad.headline
  end
end