# frozen_string_literal: true

module ExampleApp

  class << self

    # Return the branch name which created this release
    #
    # @return [String, nil]
    def branch
      return @branch if instance_variable_defined?(:@branch)

      @branch ||= read_version_file("BRANCH")
    end

    # Return the version
    #
    # @return [String, nil]
    def version
      return @version if instance_variable_defined?(:@version)

      @version ||= read_version_file("VERSION") || "0.0.0"
    end

    private

    def read_version_file(file)
      path = Rails.root.join(file)
      return unless File.exist?(path)

      value = File.read(path).strip
      value.empty? ? nil : value
    end

  end

end
