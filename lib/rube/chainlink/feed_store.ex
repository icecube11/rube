defmodule Rube.Chainlink.FeedStore do
  use Stored.Store

  def after_put(feed) do
    Phoenix.PubSub.broadcast(Slurpee.PubSub, "after_put_feed", {"after_put_feed", feed})
  end
end
