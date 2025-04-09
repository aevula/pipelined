# frozen_string_literal: true

module Pipelined
  class Middleware
    attr_reader :app, :env

    def initialize(app, env)
      @app = app
      @env = env
    end

    def call
      raise(NotImplementedError)
    end
  end
end
