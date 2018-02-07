//
//  Validation.swift

struct Validation{
    
    // MARK: - Firstname
    func isValidateFirstName(fname: String) -> Bool {
        let firstNameRegex =  "^[a-zA-Z]*$"
        let strfirstName = NSPredicate(format: "SELF MATCHES %@", firstNameRegex)
        return strfirstName.evaluate(with: fname)
    }
    
    // MARK: - Password
    func isPasswordValidate(value: String) -> Bool {
        let passwordRegex = "^[A-Za-z]+[a-zA-Z0-9'_.-@#]*${5,}"
        let strPassword = NSPredicate(format: "SELF MATCHES %@", passwordRegex)
        return strPassword.evaluate(with: value)
    }
    
    func isPasswordLenght(password: String) -> Bool {
        if (password.characters.count >= 8 && password.characters.count <= 15) {
            return true
        } else {
            return false
        }
    }
    
    // MARK: - Email
    func isEmailValidate(testStr:String) -> Bool {
        
        let emailRegEx = "^(?:(?:(?:(?: )*(?:(?:(?:\\t| )*\\r\\n)?(?:\\t| )+))+(?: )*)|(?: )+)?(?:(?:(?:[-A-Za-z0-9!#$%&’*+/=?^_'{|}~]+(?:\\.[-A-Za-z0-9!#$%&’*+/=?^_'{|}~]+)*)|(?:\"(?:(?:(?:(?: )*(?:(?:[!#-Z^-~]|\\[|\\])|(?:\\\\(?:\\t|[ -~]))))+(?: )*)|(?: )+)\"))(?:@)(?:(?:(?:[A-Za-z0-9](?:[-A-Za-z0-9]{0,61}[A-Za-z0-9])?)(?:\\.[A-Za-z0-9](?:[-A-Za-z0-9]{0,61}[A-Za-z0-9])?)*)|(?:\\[(?:(?:(?:(?:(?:[0-9]|(?:[1-9][0-9])|(?:1[0-9][0-9])|(?:2[0-4][0-9])|(?:25[0-5]))\\.){3}(?:[0-9]|(?:[1-9][0-9])|(?:1[0-9][0-9])|(?:2[0-4][0-9])|(?:25[0-5]))))|(?:(?:(?: )*[!-Z^-~])*(?: )*)|(?:[Vv][0-9A-Fa-f]+\\.[-A-Za-z0-9._~!$&'()*+,;=:]+))\\])))(?:(?:(?:(?: )*(?:(?:(?:\\t| )*\\r\\n)?(?:\\t| )+))+(?: )*)|(?: )+)?$"
 
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: testStr)
    }

    // MARK: - Username
    func isUserNameValidate(_ stringName:String) -> Bool {
        var sepcialChar = false
        var temp = false
        let characterset = CharacterSet(charactersIn: "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLKMNOPQRSTUVWXYZ0123456789")
        if stringName.rangeOfCharacter(from: characterset.inverted) != nil {
            print("String contains special characters")
            sepcialChar = true
        }
        else {
            temp = true
        }
        let phone = stringName.components(separatedBy: CharacterSet.decimalDigits.inverted).joined(separator: "")
        if phone != "" || sepcialChar == true {
            temp = false
            for chr in stringName.characters {
                if ((chr >= "a" && chr <= "z") || (chr >= "A" && chr <= "Z") ) {
                    temp = true
                    break
                }
            }
        }
        if temp == true {
            return true
        }
        else {
            return false
        }
    }

    // MARK: - Phonenumber
    func isPhoneNumberValidate(value: String) -> Bool {
       
        let PHONE_REGEX = "^\\d{10}$"
        let phoneTest = NSPredicate(format: "SELF MATCHES %@", PHONE_REGEX)
        let result =  phoneTest.evaluate(with: value)
        return result
    }
    
    // MARK: - Name
    func isNameValidate(_ stringName:String) -> Bool {
       
        let nameRegex = "^[A-Za-z]+([ ]?)+([a-zA-Z0-9'_.-@#]?)*${5,}"
        let nameTest = NSPredicate(format: "SELF MATCHES %@", nameRegex)
        return nameTest.evaluate(with: stringName)
    }
    
}
