//
//  PinCodeViewController.swift
//  KyivMetro
//
//  Created by Enkefa on 31.12.2019.
//  Copyright © 2019 Enkefa. All rights reserved.
//

import UIKit
@IBDesignable

class PinCodeView: UIView {
    
    @IBOutlet var contentView: PinCodeView!
    
    @IBOutlet weak var textField1: RoundTextField!
    @IBOutlet weak var textField2: RoundTextField!
    @IBOutlet weak var textField3: RoundTextField!
    @IBOutlet weak var textField4: RoundTextField!
    
    open var text: String? {
        get {
            let char1 = (textField1.text ?? "")
            let char2 = (textField2.text ?? "")
            let char3 = (textField3.text ?? "")
            let char4 = (textField4.text ?? "")
            
            let result = char1 + char2 + char3 + char4
            return result
        }
        set(text){
            // add setting for other text.
            textField1.text = ""
            textField2.text = ""
            textField3.text = ""
            textField4.text = ""
        }
    }
    
    override init(frame:CGRect) {
        super.init(frame:frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    private func commonInit() {
        Bundle.main.loadNibNamed("PinCodeView", owner: self, options: nil)
        addSubview(contentView)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        
        textField1.addTarget(self, action: #selector(textFieldDidChange(_ :)), for: UIControl.Event.editingChanged)
        textField2.addTarget(self, action: #selector(textFieldDidChange(_ :)), for: UIControl.Event.editingChanged)
        textField3.addTarget(self, action: #selector(textFieldDidChange(_ :)), for: UIControl.Event.editingChanged)
        textField4.addTarget(self, action: #selector(textFieldDidChange(_ :)), for: UIControl.Event.editingChanged)
        
        textField1.inputAccessoryView = addDoneButtonOnKeyboard()
        textField2.inputAccessoryView = addDoneButtonOnKeyboard()
        textField3.inputAccessoryView = addDoneButtonOnKeyboard()
        textField4.inputAccessoryView = addDoneButtonOnKeyboard()
        
    }
    
    @objc func textFieldDidChange(_ textField: UITextField) {
        if (textField.text?.count == 1) {
            switch (textField.tag){
            case 1:
                textField2.becomeFirstResponder()
                break
            case 2:
                textField3.becomeFirstResponder()
                break
            case 3:
                textField4.becomeFirstResponder()
                break
            case 4:
                
                break
            default:
                break
            }
        } else  if (textField.text?.count == 0){
            switch (textField.tag){
            case 1:
                break
            case 2:
                textField1.becomeFirstResponder()
                break
            case 3:
                textField2.becomeFirstResponder()
                break
            case 4:
                textField3.becomeFirstResponder()
                break
            default:
                break
            }
        }
    }
    
    func addDoneButtonOnKeyboard() -> UIToolbar {
        let doneToolbar: UIToolbar = UIToolbar()
        
        doneToolbar.barStyle = UIBarStyle.default
        let flexSpace = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
        let done: UIBarButtonItem = UIBarButtonItem(title: "Done", style: UIBarButtonItem.Style.done, target: self, action: #selector(PinCodeView.doneButtonAction))
        var items = [UIBarButtonItem]()
        items.append(flexSpace)
        items.append(done)
        doneToolbar.items = items
        doneToolbar.sizeToFit()
        return doneToolbar
        
    }
    
    @objc func doneButtonAction(){
        self.endEditing(true)
    }
    
    
}
