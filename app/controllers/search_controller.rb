# frozen_string_literal: true

class SearchController < ApplicationController
  include SearchHelper

  def search
    resource = params[:resource]
    query_params = params

    @results, template = query(resource, query_params)

    respond_to do |format|
      format.html do
        if template.present?
          render template
        else
          not_found
        end
      end

      format.json do
        if template.present?
          render json: @results
        else
          render json: { error: "Not found" }, status: :not_found
        end
      end
    end
  end
end