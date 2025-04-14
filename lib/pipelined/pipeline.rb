# frozen_string_literal: true

module Pipelined
  class Pipeline
    def initialize(*middlewares)
      @middlewares = Array.new(middlewares).flatten
      @uniqed = false
    end

    def use(middleware)
      @uniqed = false
      @middlewares << middleware
    end

    def call(env, &final)
      final ||= ->(mod_env) { mod_env }

      uniq_middlewares!.reverse
                       .reduce(final) { |acc, elem| ->(mod_env) { elem.new(acc, mod_env).call } }
                       .call(env)
    end

    def size
      uniq_middlewares!.size
    end

    def index(middleware)
      @middlewares.index(middleware)
    end

    def index!(middleware)
      idx = index(middleware)
      return idx if idx

      raise(ArgumentError)
    end

    def insert(index, middleware)
      @uniqed = false
      @middlewares.insert(index, middleware)
    end

    def insert_before(before, middleware)
      insert(index!(before), middleware)
    end

    def insert_after(after, middleware)
      insert(index!(after) + 1, middleware)
    end

    def replace(replaced, middleware)
      @uniqed = false
      @middlewares[index!(replaced)] = middleware
    end

    def swap(first, second)
      first_idx = index!(first)
      second_idx = index!(second)
      @middlewares[first_idx] = second
      @middlewares[second_idx] = first
    end

    def delete(middleware)
      @middlewares.delete(middleware)
    end

    private

    def uniq_middlewares!
      return @middlewares if @uniqed

      @uniqed = true
      @middlewares.uniq!
      @middlewares
    end
  end
end
