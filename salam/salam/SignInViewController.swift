import UIKit

extension UIColor {
   convenience init(red: Int, green: Int, blue: Int) {
       assert(red >= 0 && red <= 255, "Invalid red component")
       assert(green >= 0 && green <= 255, "Invalid green component")
       assert(blue >= 0 && blue <= 255, "Invalid blue component")

       self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
   }

   convenience init(rgb: Int) {
       self.init(
           red: (rgb >> 16) & 0xFF,
           green: (rgb >> 8) & 0xFF,
           blue: rgb & 0xFF
       )
   }
}

class SignInViewController: UIViewController {
    
    func pageTitle(text: String) -> UILabel {
        let title = UILabel(frame: CGRect(x: 136, y: 123, width: 150, height: 21))
        title.text = text
        title.textColor = UIColor(rgb: 0x000000)
        title.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        
        return title
    }
    
    func styleTextField(placeholder: String, count: Int, isSecure: Bool = false, hasIcon: Bool = false) -> UITextField {
        let field =  UITextField(frame: CGRect(x: 23, y: 167 + count * 59, width: 345, height: 40))
        field.placeholder = placeholder
        field.layer.cornerRadius = 0
        field.backgroundColor = UIColor(rgb: 0xF3F3F3)
        field.font = UIFont.systemFont(ofSize: 14)
        field.borderStyle = UITextField.BorderStyle.roundedRect
        field.autocorrectionType = UITextAutocorrectionType.no
        field.keyboardType = UIKeyboardType.default
        field.returnKeyType = UIReturnKeyType.done
        field.clearButtonMode = UITextField.ViewMode.whileEditing
        field.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
        
        isSecure ? field.isSecureTextEntry = true : nil
        
        if (hasIcon) {
            field.rightImage(UIImage(named: "attach.png"))
        }
        
        return field
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.addSubview(pageTitle(text: "Authorization"))
        self.view.addSubview(styleTextField(placeholder: "Login", count: 0))
        self.view.addSubview(styleTextField(placeholder: "Password", count: 1))
    
        /*let authoTitle = UILabel();
        authoTitle.text = "Authorization"
        authoTitle.textColor = UIColor(rgb: 0x000000)
        authoTitle.frame = CGRect(x: 136, y: 123, width: 150, height: 21)
        authoTitle.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        //authoTitle.center = self.view.center
        //notSignedUp.contentHorizontalAlignment = .left
        self.view.addSubview(authoTitle)
        
        let login =  UITextField(frame: CGRect(x: 23, y: 167, width: 345, height: 40))
        login.placeholder = "Login"
        login.layer.cornerRadius = 0
        login.backgroundColor = UIColor(rgb: 0xF3F3F3)
        login.font = UIFont.systemFont(ofSize: 14)
        login.borderStyle = UITextField.BorderStyle.roundedRect
        login.autocorrectionType = UITextAutocorrectionType.no
        login.keyboardType = UIKeyboardType.default
        login.returnKeyType = UIReturnKeyType.done
        login.clearButtonMode = UITextField.ViewMode.whileEditing
        //login.borderStyle = UITextField.BorderStyle.line
        //login.layer.borderColor = UIColor(rgb: 0xF3F3F3).cgColor
        login.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
        self.view.addSubview(login)
        
        let password =  UITextField(frame: CGRect(x: 23, y: 226, width: 345, height: 40))
        password.placeholder = "Password"
        password.layer.cornerRadius = 0
        password.backgroundColor = UIColor(rgb: 0xF3F3F3)
        password.font = UIFont.systemFont(ofSize: 14)
        password.borderStyle = UITextField.BorderStyle.roundedRect
        password.autocorrectionType = UITextAutocorrectionType.no
        password.keyboardType = UIKeyboardType.default
        password.returnKeyType = UIReturnKeyType.done
        password.clearButtonMode = UITextField.ViewMode.whileEditing
        password.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
        self.view.addSubview(password)*/

        let signInBtn = UIButton(frame: CGRect(x: 23, y: 306, width: 345, height: 40))
        signInBtn.backgroundColor = UIColor(rgb: 0x2E2E2E)
        signInBtn.setTitle("Sign In", for: .normal)
        signInBtn.setTitleColor(UIColor(rgb: 0xFFFFFF), for: .normal)
        signInBtn.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
        signInBtn.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        self.view.addSubview(signInBtn)
        
        let notSignedUp = UILabel()
        notSignedUp.text = "Not signed up?"
        notSignedUp.textColor = UIColor(rgb: 0x000000)
        notSignedUp.frame = CGRect(x: 23, y: 376, width: 110, height: 16)
        notSignedUp.font = UIFont.systemFont(ofSize: 14)
        //notSignedUp.contentHorizontalAlignment = .left
        self.view.addSubview(notSignedUp)
        
        let toSignUp = UIButton()
        toSignUp.setTitle("Sign up now", for: .normal)
        toSignUp.setTitleColor(UIColor(rgb: 0x000000), for:.normal)
        toSignUp.frame = CGRect(x: 260, y: 376, width: 110, height: 16)
        toSignUp.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        //toSignUp.contentHorizontalAlignment = .right
        //toSignUp. = UIFont.systemFont(ofSize: 14)
        self.view.addSubview(toSignUp)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
