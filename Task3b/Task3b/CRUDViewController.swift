//
//  CRUDViewController.swift
//  Task3b
//
//  Created by RKB on 27/01/2017.
//  Copyright © 2017 RKB. All rights reserved.
//

import UIKit

protocol CRUDDelegate {
    func recAdd(pet:Animal, vc:CRUDViewController)
    func recEdit(pet:Animal, vc:CRUDViewController)
    func recDelete(pet:Animal, vc:CRUDViewController)

}

class CRUDViewController: UIViewController, UITextFieldDelegate {

    
    @IBAction func actionButtonCancel(_ sender: Any) {
        
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func actionButtonSave(_ sender: Any) {
        
        petRecordCrud?.imie = imie.text!
        switch mode {
            case "Add":
             delegate?.recAdd(pet: petRecordCrud!, vc: self)
            case "Edit":
             delegate?.recEdit(pet: petRecordCrud!, vc: self)
            case "Delete":
            delegate?.recDelete(pet: petRecordCrud!, vc: self)
            default:
                delegate?.recEdit(pet: petRecordCrud!, vc: self)

        }
        dismiss(animated: true, completion: nil)
    }

    @IBOutlet weak var imie: UITextField!
    
    var delegate:CRUDDelegate?
    var petRecordCrud:Animal?
    var mode:String = "Edit"
    func setupUI() {
        
        imie.text = petRecordCrud?.imie
    }
    
    override func viewDidAppear(_ animated: Bool) {
        //setupUI()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        imie.resignFirstResponder()
        return true
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
