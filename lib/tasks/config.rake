# frozen_string_literal: true

namespace :config do
  task :generate do # rubocop:disable Rails/RakeEnvironment
    require_relative "../example_app/config"
    require "konfig/exporters/env_vars_as_markdown"
    output = Konfig::Exporters::EnvVarsAsMarkdown.new(ExampleApp::ConfigSchema).export
    output_path = File.expand_path("../../CONFIG.md", __dir__)
    File.write(output_path, output)

    # Export helm app vars output
    require_relative "../example_app/helm_config_exporter"
    output = ExampleApp::HelmConfigExporter.new(ExampleApp::ConfigSchema).export
    output_path = File.expand_path("../../chart/templates/_app_config_vars.tpl", __dir__)
    File.write(output_path, "#{output}\n")
  end
end
