defmodule Rumbl.Multimedia.Annotation do
  use Ecto.Schema
  import Ecto.Changeset

  schema "annotations" do
    field :body, :string
    field :at, :integer

    belongs_to :user, Rumbl.Accounts.User
    belongs_to :video, Rumbl.Multimedia.Video
    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(annotation, attrs) do
    annotation
    |> cast(attrs, [:body, :at])
    |> validate_required([:body, :at])
  end
end
