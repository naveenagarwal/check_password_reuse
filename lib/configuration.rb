require 'digest'

module CheckPasswordReuse

  class Configuration

    class << self
      def config
        yield self
      end

      def password_attribute_name
        @password_attribute_name ||= :password
      end

      def password_attribute_name=(name)
        @password_attribute_name = name.to_sym
      end

      def password_can_not_be_resued_number
        @password_can_not_be_resued_number ||= 3
      end

      def password_can_not_be_resued_number=(number)
        @password_can_not_be_resued_number = number
      end

      def encryption
        @encryption ||= default_encryption
      end

      def encryption=(encrption_object)
        @encryption = encrption_object
      end

      def default_encryption
        Digest::SHA256.new
      end

    end

  end

end

CheckPasswordReuse::Configuration.config do |c|
  c.password_attribute_name = :pass
  c.password_can_not_be_resued_number = 2
end

puts CheckPasswordReuse::Configuration.password_attribute_name
puts CheckPasswordReuse::Configuration.password_can_not_be_resued_number