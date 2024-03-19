# frozen_string_literal: true

class AdminIndexComponent < ApplicationComponent
  slot :title
  slot :description
  slot :table_header
  slot :table_body
  slot :actions
  slot :pagy

  def render_in(view_context)
    @view_context = view_context
    yield self
    @view_context.render partial: "components/admin_index", locals: { component: self }
  end
end
