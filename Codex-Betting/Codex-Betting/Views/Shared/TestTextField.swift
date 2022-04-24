//
//  TestTextField.swift
//  Codex-Betting
//
//  Created by Carlos Hernández on 23/04/22.
//

import UIKit
import SwiftUI

struct DecimalPadTextField: UIViewRepresentable {
    @Binding var text: String
    var keyType: UIKeyboardType
    var placeholder: String
    var onSubmit: () -> Void
    func makeUIView(context: Context) -> UITextField {
        let textfield = UITextField()
        textfield.keyboardType = keyType
        let toolBar = UIToolbar(frame: CGRect(x: 0, y: 0, width: textfield.frame.size.width, height: 44))
        let doneButton = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(textfield.doneButtonTapped(button:)))
        toolBar.items = [doneButton]
        toolBar.setItems([doneButton], animated: true)
        textfield.inputAccessoryView = toolBar
        textfield.attributedPlaceholder = NSAttributedString(string: placeholder, attributes:[NSAttributedString.Key.foregroundColor: UIColor.gray])
        textfield.backgroundColor = .white
        textfield.layer.cornerRadius = 10.0
        textfield.setLeftPaddingPoints(10)
        textfield.textColor = .black
        textfield.delegate = context.coordinator
        
        return textfield
    }
    
    func updateUIView(_ uiView: UITextField, context: Context) {
        
    }
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(parent: self)
    }
    
    class Coordinator: NSObject, UITextFieldDelegate {
        var parent: DecimalPadTextField
        
        init(parent: DecimalPadTextField) {
            self.parent = parent
        }
        
        func textFieldDidEndEditing(_ textField: UITextField) {
            parent.onSubmit()
            parent.text = textField.text ?? ""
        }
        
        func textFieldDidChangeSelection(_ textField: UITextField) {
            parent.text = textField.text ?? ""
        }
    }
}

extension  UITextField{
    
    @objc func doneButtonTapped(button:UIBarButtonItem) -> Void {
        self.resignFirstResponder()
    }
    
    func setLeftPaddingPoints(_ amount:CGFloat){
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
        self.leftView = paddingView
        self.leftViewMode = .always
    }
    
}
