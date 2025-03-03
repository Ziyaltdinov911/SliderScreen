//
//  SliderCell.swift
//  SliderScreen
//
//  Created by KAMA . on 03.03.2025.
//

import Foundation
import UIKit

class SliderCell: UICollectionViewCell {
    
    static let reuseId = "SliderCell"
    
    lazy var imageView: UIImageView = {
        $0.contentMode = .scaleAspectFill
        $0.clipsToBounds = true
        return $0
    }(UIImageView(frame: self.bounds))
    
    lazy var textLabel: UILabel = {
        $0.textColor = .black
        $0.font = UIFont.boldSystemFont(ofSize: 36)
        $0.textAlignment = .left
        $0.numberOfLines = 0
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UILabel())
    
    lazy var backgroundStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.backgroundColor = UIColor(red: 242/255, green: 242/255, blue: 242/255, alpha: 1)
        stackView.layer.cornerRadius = 25
        stackView.clipsToBounds = true
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        let margins = UIEdgeInsets(top: 30, left: 10, bottom: loginButton.bounds.height + 100, right: 10)
        stackView.layoutMargins = margins
        stackView.isLayoutMarginsRelativeArrangement = true
        
        return stackView
    }()
    
    lazy var emailTF: UITextField = {
        $0.placeholder = "Email"
        $0.backgroundColor = .white
        $0.layer.cornerRadius = 25
        $0.leftViewMode = .always
        $0.translatesAutoresizingMaskIntoConstraints = false
        
        let placeholderTextPadding = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: 50))
        
        $0.leftView = placeholderTextPadding
        $0.leftViewMode = .always
        
        return $0
    }(UITextField())
    
    lazy var passwordTF: UITextField = {
        $0.placeholder = "Пароль"
        $0.isSecureTextEntry = true
        $0.backgroundColor = .white
        $0.layer.cornerRadius = 25
        $0.leftViewMode = .always
        $0.translatesAutoresizingMaskIntoConstraints = false
        
        let placeholderTextPadding = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: 50))
        
        $0.leftView = placeholderTextPadding
        $0.leftViewMode = .always
        
        return $0
    }(UITextField())
    
    lazy var loginButton: UIButton = {
        $0.backgroundColor = .black
        $0.layer.cornerRadius = 25
        $0.setTitle("Войти", for: .normal)
        $0.tintColor = .white
        $0.translatesAutoresizingMaskIntoConstraints = false
        
        $0.addTarget(self, action: #selector(buttonTouchDown(_:)), for: .touchDown)
        $0.addTarget(self, action: #selector(buttonTouchUpInside(_:)), for: .touchUpInside)
        $0.addTarget(self, action: #selector(buttonDragExit(_:)), for: .touchDragExit)
        
        return $0
    }(UIButton())
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(backgroundStackView)
        addSubview(imageView)
        addSubview(textLabel)
        setConstraints()
    }
    
    func setConstraints() {
        NSLayoutConstraint.activate([
            textLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 125),
            textLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            textLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            textLabel.bottomAnchor.constraint(lessThanOrEqualTo: contentView.bottomAnchor),
            textLabel.widthAnchor.constraint(equalToConstant: contentView.frame.width - 60),
            textLabel.heightAnchor.constraint(greaterThanOrEqualToConstant: 100),
        ])
    }
    
    func setImageView(image: String) {
        imageView.image = UIImage(named: image)
    }
    
    func removeLoginBtnAndTF() {
        emailTF.removeFromSuperview()
        passwordTF.removeFromSuperview()
        loginButton.removeFromSuperview()
    }
    
    func addLoginBtn() {
        
        addSubview(backgroundStackView)
        backgroundStackView.addArrangedSubview(emailTF)
        backgroundStackView.addArrangedSubview(passwordTF)
        backgroundStackView.addSubview(loginButton)
        
        NSLayoutConstraint.activate([
            backgroundStackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: contentView.frame.height * 0.55),
            backgroundStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 30),
            backgroundStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -30),
            backgroundStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            
            emailTF.heightAnchor.constraint(equalToConstant: 50),
            passwordTF.heightAnchor.constraint(equalToConstant: 50),
            
            loginButton.bottomAnchor.constraint(equalTo: backgroundStackView.bottomAnchor, constant: -30),
            loginButton.leadingAnchor.constraint(equalTo: backgroundStackView.leadingAnchor, constant: 10),
            loginButton.trailingAnchor.constraint(equalTo: backgroundStackView.trailingAnchor, constant: -10),
            
            loginButton.heightAnchor.constraint(equalToConstant: 50),
            
            //MARK: - Конфликт констрейнтов // Решено
            
            // Расстояние между passwordTF и loginButton
            passwordTF.bottomAnchor.constraint(equalTo: loginButton.topAnchor, constant: -20) // Конфликт констрейнтов // Решено
        ])
        
        
    }
    
    func addTextLabel(text: String, textColor: UIColor) {
        textLabel.text = text
        textLabel.textColor = textColor
    }
    
    override func prepareForReuse() {
        backgroundStackView.removeFromSuperview()
        imageView.image = nil
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder() // Функция для скрытия клавиатуру по кнопке return
        return true
    }
    
    @objc func buttonTouchDown(_ sender: UIButton) {
        print("Вы коснулись кнопки: \(String(describing: sender.titleLabel?.text))")
        UIView.animate(withDuration: 0.1) {
            sender.transform = CGAffineTransform(scaleX: 0.9, y: 0.9)
            sender.alpha = 1.0
        }
    }
    
    @objc func buttonTouchUpInside(_ sender: UIButton) {
        print("Вы нажали кнопку: \(String(describing: sender.titleLabel?.text))")
        UIView.animate(withDuration: 0.2) {
            sender.transform = .identity
            sender.alpha = 1.0
        }
    }
    
    @objc func buttonDragExit(_ sender: UIButton) {
        UIView.animate(withDuration: 0.1) {
            sender.transform = .identity
            sender.alpha = 1.0
        }
    }
}

import SwiftUI

struct ViewControllerWrapper: UIViewControllerRepresentable {
    
    func makeUIViewController(context: Context) -> ViewController {
        return ViewController()
    }
    
    func updateUIViewController(_ uiViewController: ViewController, context: Context) {
        
    }
}

struct ContentView: View {
    var body: some View {
        ViewControllerWrapper().edgesIgnoringSafeArea(.all)
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}



