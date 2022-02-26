# frozen_string_literal: true

class MemoBlueprint < Blueprinter::Base
  identifier :id

  fields :title

  view :with_memo_details do
    association :memo_details, blueprint: MemoDetailBlueprint
  end
end
