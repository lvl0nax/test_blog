require 'spec_helper'

describe Article do
  subject { described_class.make! }
  it { should be_valid }
  it { should validate_presence_of :body }
  it { should validate_presence_of :title }

  context 'with comment' do
    let(:article){Article.make!}
    let!(:article1){Article.make!}
    let(:comment){article.comments.make!}
    it 'has correct counter cache' do
      Article.find(comment.article_id).comments_count.should be == 1
    end
    it 'most commented scope returns correct data' do
      Article.most_commented.count == 1
      Article.most_commented.pluck(:id).first == comment.article_id
    end
  end

end
