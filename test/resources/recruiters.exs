defmodule CompaniesRegEx.Resources.Test do
  use CompaniesRegEx.DataCase

  defmodule RecruitersFixture do
    alias CompaniesRegEx.Resources.Recruiters

    def create_recruiter() do
      %{
        title: "Elixir Potions Shop",
        introduction: "Elixir Shop",
        about_us: "About us - a long about!",
        recruitment_steps: "1. intro call, 2. Technical Test, 3. CTO call, 4. Work with us!",
        contact_us: "98766543210",
        location: "POINT(30 30)"
      }
      |> Recruiters.create()
    end
  end

  describe "recruiters" do
    alias CompaniesRegEx.Resources.Recruiters
    alias CompaniesRegEx.Resources.JobDescription
    alias CompaniesRegEx.Resources.Developer

    @invalid_attrs_nil %{
      about_us: "About us",
      recruitment_steps: "1. in string format",
      contact_us: "9988998899",
      introduction: "We are Elixir Shop! We have worked with elixir core team members. "
    }

    test "create/0" do
      assert {:ok, recruiter} = RecruitersFixture.create_recruiter()

      assert %{
               title: "Elixir Potions Shop",
               introduction: "Elixir Shop",
               about_us: "About us - a long about!",
               recruitment_steps:
                 "1. intro call, 2. Technical Test, 3. CTO call, 4. Work with us!",
               contact_us: "98766543210",
               location: %Geo.Point{
                 coordinates: {30, 30},
                 srid: nil,
                 properties: %{}
               }
             } ==
               Map.from_struct(recruiter)
               |> Map.take([
                 :title,
                 :introduction,
                 :about_us,
                 :recruitment_steps,
                 :contact_us,
                 :location
               ])
    end
  end
end
