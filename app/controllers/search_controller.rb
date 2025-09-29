# frozen_string_literal: true

class SearchController < ApplicationController
  include SearchHelper

  def search
    resource = params[:resource]
    query_params = params

    @results, template = query(resource, query_params)

    respond_to do |format|
      if template.present?
        format.html { render template }
        format.json { render json: @results }
      else
        format.html { not_found }
        format.json { render json: { error: "Not found" }, status: :not_found }
      end
    end
  end
end