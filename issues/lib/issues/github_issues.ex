defmodule Issues.GithubIssues do
  @user_agent [ { "User-agent", "Elixir dave@pragpro.com" } ]
  @github_url Application.get_env(:issues, :github_url)

  def fetch(user, project) do
    issues_url(user, project)
    |> HTTPoison.get(@user_agent)
    |> handle_response
  end

  def issues_url(user, project) do
    "#{@github_url}/repos/#{user}/#{project}/issues"
  end

  def handle_response({:ok, httpoison_response}) do
    { :ok, :jsx.decode(httpoison_response.body) }
  end
  def handle_response({:error, httpoison_response}) do
    { :error, :jsx.decode(httpoison_response.body) }
  end
end