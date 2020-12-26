require 'application_system_test_case'

class CommentsTest < ApplicationSystemTestCase
  setup do
    @comment = comments(:one)
  end

  test 'creating a Comment' do
    visit comments_url
    click_on 'New Comment'

    fill_in 'Member', with: @comment.member_id
    fill_in 'Post', with: @comment.post_id
    fill_in 'Text', with: @comment.text
    click_on 'Create Comment'

    assert_text 'Comment was successfully created'
    click_on 'Back'
  end

  test 'destroying a Comment' do
    visit comments_url
    page.accept_confirm do
      click_on 'Destroy', match: :first
    end

    assert_text 'Comment was successfully destroyed'
  end
end
