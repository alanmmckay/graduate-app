module StudentsHelper
  def has_degree?(user)
    user.student.degrees.exists?
  end

end
