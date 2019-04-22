//
//  ViewController.swift
//  Filter&SortBySuraj
//
//  Created by Suraj Prasad on 14/02/19.
//  Copyright © 2019 Suraj Prasad. All rights reserved.
//

import UIKit


class ViewController: UIViewController {

    @IBOutlet weak var minValueSlider: UILabel!
    
    @IBOutlet weak var maxValueSlider: UILabel!
    
    @IBOutlet weak var minValueProgress: UILabel!
    
    @IBOutlet weak var maxValueProgress: UILabel!
    
    @IBOutlet weak var quantityStepper: UILabel!
    
    @IBOutlet weak var priceProgress: UIProgressView!
    
    @IBOutlet weak var setMinPrice: UISlider!
    
    @IBOutlet weak var setMaxPrice: UISlider!
    
    @IBOutlet weak var olderItems: UILabel!
    
    @IBOutlet weak var newerItems: UILabel!
    
    @IBOutlet weak var quantityStepperOutlet: UIStepper!
    
    @IBOutlet weak var OldNewSwitchOutlet: UISwitch!
    
    
    @IBOutlet weak var minMaxProgressOutlet: UIProgressView!
    @IBAction func minPriceSlider(_ sender: UISlider) {
        
        minValueSlider.text = "\(Int(sender.value))"
        minValueProgress.text=minValueSlider.text
    }
    
    
    @IBAction func maxPriceSlider(_ sender: UISlider) {
          sender.minimumValue = setMinPrice.value
        maxValueSlider.text = "\(Int(sender.value))"
        maxValueProgress.text=maxValueSlider.text
        priceProgress.progress = (sender.value-sender.minimumValue)/1000
    }
    
    @IBAction func quantityStepperValue(_ sender: UIStepper) {
        quantityStepper.text = "\(Int(sender.value))"
    }
    
    
    @IBAction func oldNewItemsSwitch(_ sender: UISwitch) {
        if sender.isOn {
            olderItems.textColor = UIColor.black
            newerItems.textColor = UIColor.red
        }
        else
        {
            newerItems.textColor = UIColor.black
            olderItems.textColor = UIColor.red
        }
    }
    
    @IBAction func resetFilterButton(_ sender: UIButton) {
    
     minValueSlider.text = "0"
        maxValueSlider.text = "0"
        minValueProgress.text = "0"
        maxValueProgress.text = "0"
        quantityStepper.text = "1"
        setMinPrice.value = 0.0
        setMaxPrice.value = 0.0
        quantityStepperOutlet.value = 0.0
        OldNewSwitchOutlet.isOn = false
        minMaxProgressOutlet.progress = 0.0
    }
    
    
    //Segement for Filter and Sort Option
    @IBAction func optionSegment(_ sender: UISegmentedControl) {
        
        switch sender.selectedSegmentIndex {
        case 1:
            let actionSheet = UIAlertController(title: "Sort Screen", message: "Categories:", preferredStyle: .actionSheet)
            let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { (action) in
                sender.selectedSegmentIndex = 0
                print("Cancel Action for ActionSheet")
            }
            let popularity = UIAlertAction(title: "Popularity", style: .default) { (action) in
                print("Popularity ActionSheet")
                
            }
            let priceLH = UIAlertAction(title: "Price - Low to High", style: .default) { (action) in
                print("Price Low to High ActionSheet")
                
            }
            let priceHL = UIAlertAction(title: "Price High to Low", style: .default) { (action) in
                print("Price High to Low ActionSheet")
                
            }
            let newestFirst = UIAlertAction(title: "Newest First", style: .default) { (action) in
                print("Newest First ActionSheet")
                
            }
            let discount = UIAlertAction(title: "Discount", style: .default) { (action) in
                print("Discount ActionSheet")
                
            }
            actionSheet.addAction(popularity)
            actionSheet.addAction(priceLH)
            actionSheet.addAction(priceHL)
            actionSheet.addAction(newestFirst)
            actionSheet.addAction(discount)
            actionSheet.addAction(cancelAction)
            self.present(actionSheet, animated: true, completion: nil)
        default:
            break
        }
    }
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        olderItems.textColor = UIColor.red
    }


}

