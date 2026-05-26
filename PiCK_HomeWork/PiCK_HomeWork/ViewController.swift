//
//  ViewController.swift
//  PiCK_HomeWork
//
//  Created by 장태균 on 5/18/26.
//

import UIKit

class ViewController: UIViewController {

    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        let fullText = "PiCK에 로그인하기"
        let attributedString = NSMutableAttributedString(string: fullText)
        let purpleColor = UIColor(red: 0.62, green: 0.49, blue: 1.0, alpha: 1.0)
        attributedString.addAttribute(.foregroundColor, value: purpleColor, range: (fullText as NSString).range(of: "PiCK"))
        
        label.attributedText = attributedString
        label.font = .systemFont(ofSize: 30, weight: .bold)
        return label
    }()

    private lazy var subTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "PiCK 계정으로 로그인 해주세요."
        label.font = .systemFont(ofSize: 16, weight: .regular)
        label.textColor = .systemGray
        return label
    }()

    private lazy var emailLabel: UILabel = {
        let label = UILabel()
        label.text = "이메일"
        label.font = .systemFont(ofSize: 16, weight: .medium)
        label.textColor = .black
        return label
    }()

    private lazy var emailTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "학교 이메일을 입력해주세요"
        textField.autocapitalizationType = .none
        textField.backgroundColor = UIColor(white: 0.95, alpha: 1.0)
        textField.layer.cornerRadius = 8
        textField.font = .systemFont(ofSize: 14, weight: .regular)
        
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: 0))
        textField.leftView = paddingView
        textField.leftViewMode = .always
        
        let rightLabel = UILabel()
        rightLabel.text = "@dsm.hs.kr  "
        rightLabel.font = .systemFont(ofSize: 14, weight: .regular)
        rightLabel.textColor = .systemGray
        
        textField.rightView = rightLabel
        textField.rightViewMode = .always
        return textField
    }()

    private lazy var passwordLabel: UILabel = {
        let label = UILabel()
        label.text = "비밀번호"
        label.font = .systemFont(ofSize: 16, weight: .medium)
        label.textColor = .black
        return label
    }()

    private lazy var passwordTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "비밀번호를 입력해주세요"
        textField.backgroundColor = UIColor(white: 0.95, alpha: 1.0)
        textField.layer.cornerRadius = 8
        textField.isSecureTextEntry = true
        textField.font = .systemFont(ofSize: 14, weight: .regular)
        
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: 0))
        textField.leftView = paddingView
        textField.leftViewMode = .always
        
        let eyeButton = UIButton(type: .custom)
        eyeButton.setImage(UIImage(systemName: "eye.slash"), for: .normal)
        eyeButton.setImage(UIImage(systemName: "eye"), for: .selected)
        eyeButton.tintColor = .systemGray
        eyeButton.frame = CGRect(x: 0, y: 0, width: 40, height: 40)
        eyeButton.addTarget(self, action: #selector(togglePasswordVisibility), for: .touchUpInside)
        
        textField.rightView = eyeButton
        textField.rightViewMode = .always
        return textField
    }()

    private lazy var forgotPasswordLabel: UILabel = {
        let label = UILabel()
        label.text = "비밀번호를 잊어버리셨나요?"
        label.font = .systemFont(ofSize: 14, weight: .regular)
        label.textColor = .systemGray
        return label
    }()

    private lazy var changePasswordButton: UIButton = {
        let button = UIButton(type: .system)
        let title = "비밀번호 변경"
        let purpleColor = UIColor(red: 0.62, green: 0.49, blue: 1.0, alpha: 1.0)
        
        let attributedString = NSMutableAttributedString(string: title)
        attributedString.addAttribute(.underlineStyle, value: NSUnderlineStyle.single.rawValue, range: NSRange(location: 0, length: title.count))
        attributedString.addAttribute(.foregroundColor, value: purpleColor, range: NSRange(location: 0, length: title.count))
        
        button.setAttributedTitle(attributedString, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 14, weight: .medium)
        return button
    }()

    private lazy var loginButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("로그인하기", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 16, weight: .semibold)
        button.backgroundColor = UIColor(red: 0.88, green: 0.82, blue: 1.0, alpha: 1.0)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 8
        button.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
        return button
    }()

    private lazy var signUpStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 6
        stackView.alignment = .center
        return stackView
    }()

    private lazy var noAccountLabel: UILabel = {
        let label = UILabel()
        label.text = "PiCK 계정이 없으신가요?"
        label.font = .systemFont(ofSize: 14, weight: .regular)
        label.textColor = .systemGray
        return label
    }()

    private lazy var signUpButton: UIButton = {
        let button = UIButton(type: .system)
        let title = "회원가입"
        let purpleColor = UIColor(red: 0.62, green: 0.49, blue: 1.0, alpha: 1.0)
        
        let attributedString = NSMutableAttributedString(string: title)
        attributedString.addAttribute(.underlineStyle, value: NSUnderlineStyle.single.rawValue, range: NSRange(location: 0, length: title.count))
        attributedString.addAttribute(.foregroundColor, value: purpleColor, range: NSRange(location: 0, length: title.count))
        
        button.setAttributedTitle(attributedString, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 14, weight: .medium)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        signUpStackView.addArrangedSubview(noAccountLabel)
        signUpStackView.addArrangedSubview(signUpButton)
        
        view.addSubview(titleLabel)
        view.addSubview(subTitleLabel)
        view.addSubview(emailLabel)
        view.addSubview(emailTextField)
        view.addSubview(passwordLabel)
        view.addSubview(passwordTextField)
        view.addSubview(forgotPasswordLabel)
        view.addSubview(changePasswordButton)
        view.addSubview(loginButton)
        view.addSubview(signUpStackView)
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        subTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        emailLabel.translatesAutoresizingMaskIntoConstraints = false
        emailTextField.translatesAutoresizingMaskIntoConstraints = false
        passwordLabel.translatesAutoresizingMaskIntoConstraints = false
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        forgotPasswordLabel.translatesAutoresizingMaskIntoConstraints = false
        changePasswordButton.translatesAutoresizingMaskIntoConstraints = false
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        signUpStackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 60),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            
            subTitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 12),
            subTitleLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            
            emailLabel.topAnchor.constraint(equalTo: subTitleLabel.bottomAnchor, constant: 50),
            emailLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            
            emailTextField.topAnchor.constraint(equalTo: emailLabel.bottomAnchor, constant: 8),
            emailTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            emailTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            emailTextField.heightAnchor.constraint(equalToConstant: 40),
            
            passwordLabel.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 44),
            passwordLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            
            passwordTextField.topAnchor.constraint(equalTo: passwordLabel.bottomAnchor, constant: 8),
            passwordTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            passwordTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            passwordTextField.heightAnchor.constraint(equalToConstant: 40),
            
            changePasswordButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 12),
            changePasswordButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            
            forgotPasswordLabel.centerYAnchor.constraint(equalTo: changePasswordButton.centerYAnchor),
            forgotPasswordLabel.trailingAnchor.constraint(equalTo: changePasswordButton.leadingAnchor, constant: -4),
            
            loginButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -60),
            loginButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            loginButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            loginButton.heightAnchor.constraint(equalToConstant: 47),
            
            signUpStackView.bottomAnchor.constraint(equalTo: loginButton.topAnchor, constant: -16),
            signUpStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24)
        ])
    }

    @objc private func togglePasswordVisibility(_ sender: UIButton) {
        sender.isSelected.toggle()
        passwordTextField.isSecureTextEntry.toggle()
    }

    @objc private func loginButtonTapped() {
        print("로그인 버튼 클릭됨")
    }
}
