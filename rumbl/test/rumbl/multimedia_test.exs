defmodule Rumbl.MultimediaTest do
  use Rumbl.DataCase

  alias Rumbl.Multimedia

  describe "videos" do
    alias Rumbl.Multimedia.Video

    import Rumbl.MultimediaFixtures

    @invalid_attrs %{title: nil, " url": nil, decription: nil}

    test "list_videos/0 returns all videos" do
      video = video_fixture()
      assert Multimedia.list_videos() == [video]
    end

    test "get_video!/1 returns the video with given id" do
      video = video_fixture()
      assert Multimedia.get_video!(video.id) == video
    end

    test "create_video/1 with valid data creates a video" do
      valid_attrs = %{title: "some title", " url": "some  url", decription: "some decription"}

      assert {:ok, %Video{} = video} = Multimedia.create_video(valid_attrs)
      assert video.title == "some title"
      assert video. url == "some  url"
      assert video.decription == "some decription"
    end

    test "create_video/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Multimedia.create_video(@invalid_attrs)
    end

    test "update_video/2 with valid data updates the video" do
      video = video_fixture()
      update_attrs = %{title: "some updated title", " url": "some updated  url", decription: "some updated decription"}

      assert {:ok, %Video{} = video} = Multimedia.update_video(video, update_attrs)
      assert video.title == "some updated title"
      assert video. url == "some updated  url"
      assert video.decription == "some updated decription"
    end

    test "update_video/2 with invalid data returns error changeset" do
      video = video_fixture()
      assert {:error, %Ecto.Changeset{}} = Multimedia.update_video(video, @invalid_attrs)
      assert video == Multimedia.get_video!(video.id)
    end

    test "delete_video/1 deletes the video" do
      video = video_fixture()
      assert {:ok, %Video{}} = Multimedia.delete_video(video)
      assert_raise Ecto.NoResultsError, fn -> Multimedia.get_video!(video.id) end
    end

    test "change_video/1 returns a video changeset" do
      video = video_fixture()
      assert %Ecto.Changeset{} = Multimedia.change_video(video)
    end
  end
end
