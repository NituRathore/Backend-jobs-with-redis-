module Api
  module V1
    class StudentsController < ApplicationController
    
      def create
        @student = Student.new(student_params)

        if @student.save
          render json: @student, status: :created
        else
          render json: @student.errors, status: :unprocessable_entity
        end
      end

      private

  
      def student_params
        params.require(:student).permit(:name)
      end
    end
  end
end
