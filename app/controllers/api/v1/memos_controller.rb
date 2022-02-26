# frozen_string_literal: true

module Api
  module V1
    class MemosController < ApplicationController
      def index
        memos = Memo.all
        render json: { memos: MemoBlueprint.render_as_json(memos) }
      end

      def create
        memo = Memo.new(memo_attributes)
        return render json: { messages: memo.errors.full_messages }, status: :unprocessable_entity if memo.invalid?

        memo.save!
        render json: { memo: MemoBlueprint.render_as_json(memo) }
      end

      def show
        memo = Memo.find(params[:id])
        render json: { memo: MemoBlueprint.render_as_json(memo, view: :with_memo_details) }
      end

      def update
        memo = Memo.find(params[:id])
        memo.attributes = memo_attributes
        return render json: { messages: memo.errors.full_messages }, status: :unprocessable_entity if memo.invalid?

        memo.save!
        render json: { memo: MemoBlueprint.render_as_json(memo) }
      end

      def destroy
        memo = Memo.find(params[:id])
        memo.destroy!
        head :ok
      end

      private

      def memo_attributes
        params.require(:memo).permit(:title)
      end
    end
  end
end
