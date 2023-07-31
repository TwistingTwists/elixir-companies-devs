defmodule CompaniesRegEx.Resources.Test do
  use CompaniesRegEx.DataCase

  defmodule RecruitersFixture do
    alias CompaniesRegEx.Resources.Recruiters

    def create_recruiter() do
      %{
        title: "Elixir Potions Shop",
        introduction: "Elixir Shop",
        about_us: "About us - a long about!",
        recruitment_steps: "1. intro call, 2. Technical Test, 3. CTO call, 4. Work with us!  ",
        contact_us: "98766543210"
      }
      |> Recruiters.create()
    end
  end

  describe "recruiters" do
    alias CompaniesRegEx.Resources.Recruiters
    alias CompaniesRegEx.Resources.JobDescription
    alias CompaniesRegEx.Resources.Developer
    alias CompaniesRegEx.Resources.Developer

    @invalid_attrs_nil %{
      about_us: "About us",
      recruitment_steps: "1. in string format",
      contact_us: "9988998899",
      introduction: "We are Elixir Shop! We have worked with elixir core team members. "
    }

    test "create/0" do
    end
  end
end
