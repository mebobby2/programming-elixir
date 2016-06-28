defmodule Issues.GithubIssues do

  require Logger

  @user_agent [ { "User-agent", "Elixir dave@pragpro.com" } ]
  @github_url Application.get_env(:issues, :github_url)

  def fetch(user, project) do
    Logger.info "Fetching user #{user}'s project #{project}"
    issues_url(user, project)
    |> HTTPoison.get(@user_agent)
    |> handle_response
  end

  def issues_url(user, project) do
    "#{@github_url}/repos/#{user}/#{project}/issues"
  end

  def handle_response({:ok, httpoison_response}) do
    Logger.info "Successful response"
    Logger.debug fn -> inspect(httpoison_response.body) end
    { :ok, :jsx.decode(httpoison_response.body) }
  end
  def handle_response({:error, httpoison_response}) do
    Logger.info "Error response"
    { :error, :jsx.decode(httpoison_response.body) }
  end
end