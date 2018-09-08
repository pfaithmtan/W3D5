require_relative 'db_connection'
require 'active_support/inflector'
require 'byebug'
# NB: the attr_accessor we wrote in phase 0 is NOT used in the rest
# of this project. It was only a warm up.

class SQLObject
  def self.columns
    # ...
    return @columns if @columns

    col = DBConnection.execute2(<<-SQL)
      SELECT
        *
      FROM
        #{self.table_name}
      LIMIT
        0
    SQL

    @columns = col.first.map(&:to_sym) 

  end

  def self.finalize!
  end

  def self.table_name=(table_name)
    # ...
    @table_name = table_name
    # instance_variable_set("@table_name", table_name)
  end

  def self.table_name
    # ...
    return @table_name if @table_name
    # self.to_s.tableize
    self.name.underscore.pluralize
  end

  def self.all
    # ... return an array of all records in DB
  end

  def self.parse_all(results)
    # ...
  end

  def self.find(id)
    # ... look up a single record by orimary key
  end

  def initialize(params = {})
    # ...

  end

  def attributes
    # ...
  end

  def attribute_values
    # ...
  end

  def insert
    # ... insert a new row into the table to represent the SQLObject
  end

  def update
    # ... update the row with the id of this SQLObject
  end

  def save
    # ... convenience method that either calls insert/update
    #depending on whether or not the SQLObject already exists in the table
  end
end
