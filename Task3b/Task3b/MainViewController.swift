//
//  MainViewController.swift
//  Task3b
//
//  Created by RKB on 26/01/2017.
//  Copyright © 2017 RKB. All rights reserved.
//

import UIKit

class MainViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, CRUDDelegate {

    @IBOutlet weak var mainTabView: MainTableView!
    
    @IBOutlet weak var varButtonDelete: UIButton!
    @IBOutlet weak var varButtonAdd: UIButton!
 
    @IBOutlet weak var varButtonEdit: UIButton!
    //var petRecordFromList:Animal = Animal(imie: "Empty", gatunek: .pies, zdjecie: nil)
    var petItems:[Animal]!
    var currentIndex:Int? = nil  {
        didSet {
            if currentIndex == nil {
            varButtonDelete.isEnabled = false
            varButtonEdit.isEnabled = false
            }
        }
    }
    

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    @IBAction func actionButtonAdd(_ sender: Any) {
    }

    @IBAction func actionButtonEdit(_ sender: Any) {
    }


     override func viewDidAppear(_ animated: Bool) {
        varButtonDelete.isEnabled = false
        varButtonEdit.isEnabled = false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        // Do any additional setup after loading the view.
    }

    func setupUI() {

        petItems = Model.sharedInstance.pet
        currentIndex = (petItems.count) - 1
        mainTabView.reloadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "Add" {
            let vcAdd:CRUDViewController = segue.destination as! CRUDViewController
            vcAdd.petRecordCrud = Animal(imie: "", gatunek: .pies, zdjecie: nil)
            vcAdd.mode = "Add"
            vcAdd.delegate = self
        }
        if segue.identifier == "Edit" {
            let vcAdd:CRUDViewController = segue.destination as! CRUDViewController
            vcAdd.petRecordCrud = petItems[currentIndex!]
            vcAdd.mode = "Edit"
            vcAdd.delegate = self
        }
        if segue.identifier == "Delete" {
            let vcAdd:CRUDViewController = segue.destination as! CRUDViewController
            vcAdd.petRecordCrud = petItems[currentIndex!]
            vcAdd.mode = "Delete"
            vcAdd.delegate = self
        }
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    
    func recAdd(pet: Animal, vc: CRUDViewController) {
        petItems.append(pet)
        mainTabView.reloadData()
    }
    
    func recEdit(pet: Animal, vc: CRUDViewController) {
        petItems[currentIndex!] = pet
        vc.dismiss(animated: true, completion: nil)
        mainTabView.reloadData()
    }
    
    func recDelete(pet: Animal, vc: CRUDViewController) {
        
        if currentIndex != nil {
            petItems.remove(at: currentIndex!)
        }
        if petItems.count == 0 {
            currentIndex = nil
        }
        vc.dismiss(animated: true, completion: nil)
        mainTabView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    
        currentIndex = indexPath.row

        
        varButtonDelete.isEnabled = true
        varButtonAdd.isEnabled = true
        varButtonEdit.isEnabled = true
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        
        varButtonDelete.isEnabled = false
        varButtonAdd.isEnabled = false
        varButtonEdit.isEnabled = false
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.petItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = mainTabView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! MainTableViewCell
        cell.cellImie.text = petItems[indexPath.row].imie

        return cell
    }

    
}
