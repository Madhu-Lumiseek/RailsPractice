require "application_system_test_case"

class PosttsTest < ApplicationSystemTestCase
  setup do
    @postt = postts(:one)
  end

  test "visiting the index" do
    visit postts_url
    assert_selector "h1", text: "Postts"
  end

  test "creating a Postt" do
    visit postts_url
    click_on "New Postt"

    check "Canreadanyone" if @postt.canreadanyone
    fill_in "Description", with: @postt.description
    fill_in "Genre", with: @postt.genre
    fill_in "Noofpages", with: @postt.noofpages
    fill_in "Rating", with: @postt.rating
    fill_in "Title", with: @postt.title
    click_on "Create Postt"

    assert_text "Postt was successfully created"
    click_on "Back"
  end

  test "updating a Postt" do
    visit postts_url
    click_on "Edit", match: :first

    check "Canreadanyone" if @postt.canreadanyone
    fill_in "Description", with: @postt.description
    fill_in "Genre", with: @postt.genre
    fill_in "Noofpages", with: @postt.noofpages
    fill_in "Rating", with: @postt.rating
    fill_in "Title", with: @postt.title
    click_on "Update Postt"

    assert_text "Postt was successfully updated"
    click_on "Back"
  end

  test "destroying a Postt" do
    visit postts_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Postt was successfully destroyed"
  end
end
