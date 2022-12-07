//
//  ViewController.swift
//  messangerApp
//
//  Created by Consultant on 12/1/22.
//

import UIKit
//import FirebaseCore
//import FirebaseAuth
import Firebase


class LoginViewController: UIViewController {
    
    
    // Scroll View??
    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
//        scrollView.clipsToBounds = true
        return scrollView

    }()

    // LOGO
    private var imageView : UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "Logo")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()

    lazy var emailTextField: UITextField = {
        let email = UITextField(frame: .zero)
        email.translatesAutoresizingMaskIntoConstraints = false
        email.text = "Email"
        email.backgroundColor = .systemBlue
        email.clearsOnInsertion = true
        email.returnKeyType = .continue
        email.layer.cornerRadius = 12
        email.layer.borderWidth = 1
        email.layer.borderColor = UIColor.lightGray.cgColor
        email.allowsEditingTextAttributes = true
//        email.placeholder = "Email Adress"
        return email
    }()
    
    lazy var passwordTextField: UITextField = {
        let pass = UITextField(frame: .zero)
        pass.translatesAutoresizingMaskIntoConstraints = false
        pass.text = "Password"
        pass.backgroundColor = .systemBlue
        pass.clearsOnInsertion = true
        pass.isSecureTextEntry = true
        pass.layer.cornerRadius = 12
        pass.layer.borderWidth = 1
        pass.layer.borderColor = UIColor.lightGray.cgColor
        pass.allowsEditingTextAttributes = true

        return pass
    }()
    
    lazy var signInButton: UIButton = {
        let butt = UIButton(frame: .zero)
        butt.translatesAutoresizingMaskIntoConstraints = false
        butt.setTitle("Sign in", for: .normal)
        butt.backgroundColor = .systemBlue
        butt.addTarget(self, action: #selector(buttPressed), for: .touchUpInside)
        butt.layer.cornerRadius = 12
        butt.layer.borderWidth = 1
        butt.layer.borderColor = UIColor.lightGray.cgColor
        return butt
    }()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        createUI()
        
        view.backgroundColor = .white
        
        view.addSubview(scrollView)
        view.addSubview(imageView)
        scrollView.addSubview(emailTextField)
        scrollView.addSubview(passwordTextField)
        scrollView.addSubview(signInButton)
     
        
        let ref = Database.database().reference()
        //        ref.childByAutoId().setValue(["name" : "kun", "role": "editor"])
        ref.child("/messages/kun").setValue("12345")
        ref.child("/messages/kun").observeSingleEvent(of: .value) { data in
            print("*****************")
            print(data)
        }
    
        
        }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        scrollView.frame = view.bounds

        let size = scrollView.width/3
        imageView.frame = CGRect(x: (scrollView.width-size)/2, y: 75, width: size, height: size)
//
//        emailTextField.frame = CGRect(x: 30, y: imageView.bottom+10, width: scrollView.width-60, height: 52)
//
//
    }

    func createUI() {
        self.view.addSubview(imageView)
        self.view.addSubview(emailTextField)
        self.view.addSubview(passwordTextField)
        self.view.addSubview(signInButton)
        
        self.imageView.centerYAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.centerYAnchor, constant: 18).isActive = true
        self.imageView.centerXAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.centerXAnchor).isActive = true
        
        
        
        
        self.emailTextField.heightAnchor.constraint(equalToConstant: 44).isActive = true
        self.emailTextField.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 8).isActive = true
        self.emailTextField.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -8).isActive = true
        self.emailTextField.centerXAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.centerXAnchor).isActive = true
        self.emailTextField.centerYAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.centerYAnchor, constant: -26).isActive = true
        
        
        
        self.passwordTextField.heightAnchor.constraint(equalToConstant: 44).isActive = true
        self.passwordTextField.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 8).isActive = true
        self.passwordTextField.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -8).isActive = true
        self.passwordTextField.centerXAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.centerXAnchor).isActive = true
        self.passwordTextField.centerYAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.centerYAnchor, constant: 26).isActive = true


        self.signInButton.heightAnchor.constraint(equalToConstant: 44).isActive = true
        self.signInButton.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 8).isActive = true
        self.signInButton.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -8).isActive = true
        self.signInButton.centerXAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.centerXAnchor).isActive = true
        self.signInButton.topAnchor.constraint(equalTo: self.passwordTextField.bottomAnchor, constant: 8).isActive = true
            }
    
    @objc
    func buttPressed() {
        guard let email = emailTextField.text?.lowercased() else {return}
        guard let password = passwordTextField.text?.lowercased() else {return}
        
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            if let err = error {
                print("error signing in")
            } else {
                //next screen
                print("success signing in")
            }
        }
    }

}
