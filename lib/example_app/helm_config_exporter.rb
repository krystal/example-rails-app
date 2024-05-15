# frozen_string_literal: true

require "konfig/exporters/abstract"

module ExampleApp
  class HelmConfigExporter < Konfig::Exporters::Abstract

    def export
      contents = []
      contents << "{{- define \"app.appConfigEnvVars\" -}}"

      path = []

      @schema.groups.each do |group_name, group|
        path << group_name
        group.attributes.each_key do |name|
          full_path = path + [name]
          contents << env_var(full_path)
        end
        path.pop
      end

      contents << "{{- end -}}"
      contents.join("\n")
    end

    private

    def dig(paths, default, source)
      paths = paths.map { |p| "\"#{p}\"" }
      "(dig #{paths.join(' ')} #{default.nil? ? '""' : default} .Values.#{source})"
    end

    def env_var(path)
      env_var_name = Konfig::Sources::Environment.path_to_env_var(path)

      path = path.map do |p|
        p.to_s.gsub(/_[a-z]/) { |m| m[1].upcase }
      end

      default = dig(path, nil, "appConfigDefaults")
      <<~VAR.strip
        {{ include "app.envVar" (dict "name" "#{env_var_name}" "spec" #{dig(path, default, 'appConfig')} "root" . ) }}
      VAR
    end

  end
end
