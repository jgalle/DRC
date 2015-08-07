class ActiveRecord::Base
  def update(*args)
    puts "======check"
    super
  rescue => e
    errors[:base] << e
    false
  end
  def save(*args)
    puts "======check"
    super
  rescue => e
    errors[:base] << e
    false
  end
end