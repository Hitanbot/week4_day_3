require ('pg')
require_relative('../db/sql_runner')

class Student

  attr_reader :id
  attr_accessor :first_name, :last_name, :house, :age

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @first_name = options['first_name']
    @last_name = options['last_name']
    @house = options['house']
    @age = options['age']
    end

    def pretty_name()
      return "#{@first_name} #{@last_name}"
    end


    def save()
      sql = "INSERT INTO students
      (first_name, last_name, house, age)
      VALUES
      ($1, $2, $3, $4)
      RETURNING id"
      values = [@first_name,@last_name,@house,@age]
      returned_array = SqlRunner.run(sql,values)
      student_hash = returned_array[0]
      @id = student_hash['id'].to_i
    end

    def self.delete_all
      sql = "DELETE FROM students"
      SqlRunner.run(sql)
    end

    def self.all()
      sql = "SELECT * FROM students"
      students = SqlRunner.run(sql)
      return students.map{|student| Student.new(student)}
    end

    def self.find_id(id)
      sql = "SELECT * FROM students
      WHERE id = $1"
      values = [id]
      students = SqlRunner.run(sql, values)
      student=Student.new(students.first)
      return student
    end

  end
