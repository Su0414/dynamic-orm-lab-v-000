require_relative "../config/environment.rb"
require 'active_support/inflector'

class InteractiveRecord
  def self.table_name
    Student.to_s.downcase.pluralize
  end

  def self.column_names
      DB[:conn].results_as_hash = true

      sql = "PRAGMA table_info('#{Student.table_name}')"

      table_info = DB[:conn].execute(sql)
      column_names = []

      table_info.each do |column|
        column_names << column["name"]
      end
      column_names.compact
  end

  def initialize

  end

  Student.column_names.each do |col_name|
      attr_accessor col_name.to_sym
  end

  def save

  end

  def table_name_for_insert
  end

  def col_names_for_insert
  end

  def self.find_by_name
  end

  def self.find_by
  end

end
