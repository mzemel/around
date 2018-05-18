# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
    Around.Repo.insert!(%Around.Social.Event{name: "Test Event"})
    Around.Repo.insert!(%Around.Social.Event{name: "Another Test Event"})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.
