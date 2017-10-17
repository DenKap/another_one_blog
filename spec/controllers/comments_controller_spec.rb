require 'rails_helper'
RSpec.describe CommentsController, type: :request do

  describe 'POST #create' do
    let!(:category) { create(:category) }

    context 'with valid attributes' do
      it 'creates the comment' do
        post category_comments_url(1), params: { comment: { author: 'John Doe.', content: 'Comment content' } }
        expect(Comment.count).to eq(1)
      end

      it '"show" action for the new comment' do
        post category_comments_url(1), params: { comment: { author: 'John Doe.', content: 'Comment content' } }
        expect(response).to redirect_to Category.find(1)
      end
    end

    context 'with invalid attributes' do
      it 'does not create the comment' do
        post category_comments_url(1), params: { comment: { author: 'John', content: 'Comment content' } }
        expect(response).to redirect_to Category.find(1)
        expect(Comment.count).to eq(0)
      end
    end
  end

  context 'DELETE #destroy' do
    it 'removes comment' do
      expect(Comment.count).to eq(0)
    end
  end
end
