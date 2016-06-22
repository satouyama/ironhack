class PasswordChecker
    def check_length(password)
      if password.length > 7
        true
      else
        false
      end
    end
    def check_character(password)
        if password.match(/\d/) && password.match(/[a-zA-Z]/) && password.match(/\W/)
          true
        else
          false
        end
    end
    def check_case(password)
      if password.match(/[a-z]/) && password.match(/[A-Z]/)
        true
      else
        false
      end
    end
    def check_email(password, email)
      parsed_email = email.split(/@|[.]/)
      name = parsed_email[0]
      domain = parsed_email[1]

      if password.include?(name) || password.include?(domain)
        false
      else
        true
      end
    end
    def check_password(password, email)
      if check_length(password) != true
        false
      elsif check_character(password) != true
        false
      elsif check_case(password) != true
        false
      elsif check_email(password, email) != true
        false
      else
        true
      end
    end
          

end 