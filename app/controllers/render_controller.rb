# frozen_string_literal: true

class RenderController < ApplicationController
  def index
    Sentry.capture_message('test_message')
  end
end
