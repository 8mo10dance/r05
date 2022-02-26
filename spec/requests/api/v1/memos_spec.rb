# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Api::V1::Memos', type: :request do
  describe 'GET /api/v1/memos' do
    subject(:get_memos) { get '/api/v1/memos' }

    before { create_list :memo, 3 }

    it 'returns 200' do
      get_memos
      expect(response).to have_http_status :success
    end

    it 'レスポンスの型が正しい' do
      get_memos
      assert_response_schema_confirm 200
    end
  end

  describe 'POST /api/v1/memos' do
    subject(:post_memo) do
      post '/api/v1/memos', params: { memo: memo_params }
    end

    context '正常系' do
      let(:memo_params) { attributes_for :memo }

      it 'returns 200' do
        post_memo
        expect(response).to have_http_status :success
      end

      it 'レスポンスの型が正しい' do
        post_memo
        assert_response_schema_confirm 200
      end

      it { expect { post_memo }.to change(Memo, :count).by(1) }
    end

    context '異常系' do
      let(:memo_params) { attributes_for(:memo).merge(title: '') }

      it 'returns 422' do
        post_memo
        expect(response).to have_http_status :unprocessable_entity
      end

      it 'レスポンスの型が正しい' do
        post_memo
        assert_response_schema_confirm 422
      end

      it { expect { post_memo }.not_to change(Memo, :count) }
    end
  end

  describe 'GET /api/v1/memos/:id' do
    subject(:get_memo) { get "/api/v1/memos/#{memo.id}" }

    let(:memo) { create :memo }

    before { memo }

    it 'returns 200' do
      get_memo
      expect(response).to have_http_status :success
    end

    it 'レスポンスの型が正しい' do
      get_memo
      assert_response_schema_confirm 200
    end
  end

  describe 'PATCH /api/v1/memos/:id' do
    subject(:patch_memo) do
      patch "/api/v1/memos/#{memo.id}", params: { memo: memo_params }
    end

    let(:memo) { create :memo }

    before { memo }

    context '正常系' do
      let(:memo_params) { attributes_for :memo }

      it 'returns 200' do
        patch_memo
        expect(response).to have_http_status :success
      end

      it 'レスポンスの型が正しい' do
        patch_memo
        assert_response_schema_confirm 200
      end

      it 'memo が更新される' do
        patch_memo
        expect(memo.reload.title).to eq memo_params[:title]
      end
    end

    context '異常系' do
      let(:memo_params) { attributes_for(:memo).merge(title: '') }

      it 'returns 422' do
        patch_memo
        expect(response).to have_http_status :unprocessable_entity
      end

      it 'レスポンスの型が正しい' do
        patch_memo
        assert_response_schema_confirm 422
      end

      it 'memo が更新されない' do
        patch_memo
        expect(memo.reload.title).not_to eq memo_params[:title]
      end
    end
  end

  describe 'DELETE /api/v1/memos/:id' do
    subject(:delete_memo) { delete "/api/v1/memos/#{memo.id}" }

    let(:memo) { create :memo }

    before { memo }

    it 'returns 200' do
      delete_memo
      expect(response).to have_http_status :success
    end

    it { expect { delete_memo }.to change(Memo, :count).by(-1) }
  end
end
