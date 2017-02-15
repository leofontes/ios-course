//
//  ItemDetailsVC.swift
//  DreamLister
//
//  Created by Leo Fontes on 14/02/17.
//  Copyright © 2017 Leo Fontes. All rights reserved.
//

import UIKit
import CoreData

class ItemDetailsVC: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var titleField: CustomTextField!
    @IBOutlet weak var storePicker: UIPickerView!
    @IBOutlet weak var priceField: CustomTextField!
    @IBOutlet weak var detailsField: CustomTextField!
    @IBOutlet weak var thumbImage: UIImageView!
    
    var stores = [Store]()
    var itemToEdit: Item?
    var imagePicker: UIImagePickerController!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let topItem = self.navigationController?.navigationBar.topItem {
            topItem.backBarButtonItem = UIBarButtonItem(title: "", style: UIBarButtonItemStyle.plain, target: nil, action: nil)
        }
        
        storePicker.dataSource = self
        storePicker.delegate = self
        
        imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        
//        let store = Store(context: context)
//        store.name = "Amazon"
//        let store2 = Store(context: context)
//        store2.name = "Apple"
//        let store3 = Store(context: context)
//        store3.name = "BMW Dealership"
//        let store4 = Store(context: context)
//        store4.name = "Audi Dealership"
//        let store5 = Store(context: context)
//        store5.name = "Amazon"
//        let store6 = Store(context: context)
//        store6.name = "Amazon"
//        
//        ad.saveContext()
        getStores()
        
        if itemToEdit != nil {
            loadItemData()
        }
        
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        let store = stores[row]
        return store.name
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return stores.count
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        //do something
    }

    func getStores() {
        let fetchRequest: NSFetchRequest<Store> = Store.fetchRequest()
        
        do {
            self.stores = try context.fetch(fetchRequest)
            self.storePicker.reloadAllComponents()
        } catch {
            
        }
    }
    
    
    
    @IBAction func savePressed(_ sender: Any) {
        var item: Item!
        let picture = Image(context: context)
        picture.image = thumbImage.image
        
        //Decide which kind of item you want
        if itemToEdit == nil {
            item = Item(context: context)
        } else {
            item = itemToEdit
        }
        
        item.toImage = picture
        
        if let title = titleField.text {
            item.title = title
        }
        
        if let price = priceField.text {
            item.price = (price as NSString).doubleValue
        }
        
        if let detail = detailsField.text {
            item.detail = detail
        }
        
        item.toStore = stores[storePicker.selectedRow(inComponent: 0)] //There is only one component (the storePicker)
        
        ad.saveContext()
        _ = navigationController?.popViewController(animated: true)
        
    }
    
    func loadItemData() {
        
        titleField.text = itemToEdit?.title
        priceField.text = "\(itemToEdit!.price)"
        detailsField.text = itemToEdit?.detail
        thumbImage.image = itemToEdit?.toImage?.image as? UIImage
        
        if let store = itemToEdit?.toStore {
            var index = 0
            repeat {
                let s = stores[index]
                if s.name == store.name {
                    storePicker.selectRow(index, inComponent: 0, animated: false)
                    break
                }
                index += 1
            } while(index < stores.count)
        }
    }
    
    
    @IBAction func deletePressed(_ sender: UIBarButtonItem) {
        if itemToEdit != nil {
            context.delete(itemToEdit!)
            ad.saveContext()
        }
        
        _ = navigationController?.popViewController(animated: true)
    }
    
    
    @IBAction func addImage(_ sender: Any) {
        present(imagePicker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let img = info[UIImagePickerControllerOriginalImage] as? UIImage {
            thumbImage.image = img
        }
        
        imagePicker.dismiss(animated: true, completion: nil)
    }
    
}
