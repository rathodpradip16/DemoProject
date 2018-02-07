//
//  Utility.swift

var hud:MBProgressHUD = MBProgressHUD()

struct Utility{
    
    // MARK:- MBProgress Indicator Methods
    func showLoader() {
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
        hud = MBProgressHUD.showAdded(to: UIApplication.shared.keyWindow!, animated: true)
        UIApplication.shared.keyWindow?.addSubview(hud)
        hud.mode = .indeterminate
    }
    
    func hideLoader() {
        if UIApplication.shared.isNetworkActivityIndicatorVisible {
            UIApplication.shared.isNetworkActivityIndicatorVisible = false
        }
        hud.removeFromSuperview()
    }
    
    // MARK:- Bottom Border UITextField
    func addTextFieldpadding(txtField : UITextField,paddingLeft : CGFloat,paddingRight : CGFloat) {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: paddingLeft, height: txtField.frame.size.height))
        txtField.leftView = paddingView
        txtField.leftViewMode = .always
        
        let paddingView1 = UIView(frame: CGRect(x: 0, y: 0, width: paddingRight, height: txtField.frame.size.height))
        txtField.rightView = paddingView1
        txtField.rightViewMode = .always
    }
}

//// MARK: - Side Menu
//extension UIViewController {
//    func setupSideMenu() {
//        // Define the menus
//        SideMenuManager.menuAddPanGestureToPresent(toView: self.navigationController!.navigationBar)
//        SideMenuManager.menuAddScreenEdgePanGesturesToPresent(toView: self.navigationController!.view)
//        SideMenuManager.menuFadeStatusBar = false
//    }
//}


extension UITextField{
    @IBInspectable var placeHolderColor: UIColor? {
        get {
            return self.placeHolderColor
        }
        set {
            self.attributedPlaceholder = NSAttributedString(string:self.placeholder != nil ? self.placeholder! : "", attributes:[NSAttributedStringKey.foregroundColor: newValue!])
        }
    }
}

// MARK: - Toast Methods
func toastView(message : String) {
    let toastLabel = UILabel(frame: CGRect(x: UIApplication.shared.keyWindow!.frame.size.width/2 - 150, y: (UIApplication.shared.keyWindow?.frame.size.height)!-120, width:300,  height : 50))
    toastLabel.backgroundColor = UIColor.black.withAlphaComponent(0.6)
    toastLabel.textColor = UIColor.white
    toastLabel.textAlignment = NSTextAlignment.center;
    //appDelegate.window!.addSubview(toastLabel)
    UIApplication.shared.keyWindow?.addSubview(toastLabel)
    toastLabel.text = message
    toastLabel.numberOfLines = 0
    toastLabel.alpha = 1.0
    toastLabel.font = UIFont(name: "Montserrat-Light", size: 5.0)
    toastLabel.layer.cornerRadius = 10;
    toastLabel.clipsToBounds  =  true
    UIView.animate(withDuration: 6, delay: 0.1, options: UIViewAnimationOptions.curveEaseOut, animations: {
        toastLabel.alpha = 0.0
    })
}

// MARK: - Trim String
func trimString(string : NSString) -> NSString {
    return string.trimmingCharacters(in: NSCharacterSet.whitespaces) as NSString
}

// MARK:- Alert View
func showAlertView(_ strAlertTitle : String, strAlertMessage : String) -> UIAlertController {
    let alert = UIAlertController(title: strAlertTitle, message: strAlertMessage, preferredStyle: UIAlertControllerStyle.alert)
    alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler:{ (ACTION :UIAlertAction!)in
    }))
    return alert
}

// MARK:- Navigation
func navigateVC(identifierId : String) -> UIViewController {
    let controller = Constants.GlobalConstants.iPhoneStoryboard.instantiateViewController(withIdentifier: identifierId)
    return controller
}

func setUserDefault(ObjectToSave : AnyObject?  , KeyToSave : String) {
    let defaults = UserDefaults.standard
    
    if (ObjectToSave != nil)
    {
        
        defaults.set(ObjectToSave, forKey: KeyToSave)
    }
    
    UserDefaults.standard.synchronize()
}

func getUserDefault(KeyToReturnValye : String) -> AnyObject? {
    let defaults = UserDefaults.standard
    
    if let name = defaults.value(forKey: KeyToReturnValye)
    {
        return name as AnyObject?
    }
    return nil
}

// MARK: - Navigation Status Bar
extension UINavigationController {
    override open var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
        
    }
}

