defmodule Operately.Features.ResourceHubLink.ProviderLinksTest do
  use Operately.FeatureCase
  use Operately.Support.ResourceHub.Deletion
  use Operately.Support.ResourceHub.Comments
  use Operately.Support.ResourceHub.Moving

  alias Operately.Support.Features.ResourceHubLinkSteps, as: Steps

  setup ctx, do: Steps.setup(ctx)

  @link %{
    title: "Link",
    url: "http://localhost:4000",
    notes: "This is a link"
  }

  describe "Create links" do
    feature "Airtable link", ctx do
      ctx
      |> Steps.visit_resource_hub_page()
      |> Steps.create_airtable_link(@link)
      |> Steps.assert_link_content(@link)
      |> Steps.assert_link_is_airtable(@link.title)
    end

    feature "Dropbox link", ctx do
      ctx
      |> Steps.visit_resource_hub_page()
      |> Steps.create_dropbox_link(@link)
      |> Steps.assert_link_content(@link)
      |> Steps.assert_link_is_dropbox(@link.title)
    end

    feature "Figma link", ctx do
      ctx
      |> Steps.visit_resource_hub_page()
      |> Steps.create_figma_link(@link)
      |> Steps.assert_link_content(@link)
      |> Steps.assert_link_is_figma(@link.title)
    end

    feature "Notion link", ctx do
      ctx
      |> Steps.visit_resource_hub_page()
      |> Steps.create_notion_link(@link)
      |> Steps.assert_link_content(@link)
      |> Steps.assert_link_is_notion(@link.title)
    end
  end
end
