//
//  ViewController.swift
//  FoodSwipe
//
//  Created by Ilana Basman on 7/24/18.
//  Copyright © 2018 MakeSchool. All rights reserved.
//

import UIKit

class ViewController: UIViewController {


//    @IBOutlet var foodChooser: UISwipeGestureRecognizer!
    
    @IBAction func rightButtonClicked(_ sender: UIButton) {
        let randFood = lastFoodRight.text!
        if let index = foodChoices.index(of:randFood) {
            foodChoices.remove(at: index)
        foodCategoryHeight.constant = 48
        rightButtonClicked.isHidden = true
        lastFoodLeft.isHidden = true
        lastFoodRight.isHidden = true
        leftFoodPic.isHidden = true
        rightFoodPic.isHidden = true
        }
        generateAnswer()
    }
    @IBAction func leftButtonClicked(_ sender: UIButton) {
        let randFood = lastFoodLeft.text!
        if let index = foodChoices.index(of:randFood) {
            foodChoices.remove(at: index)
        foodCategoryHeight.constant = 48
        leftButtonClicked.isHidden = true
        lastFoodRight.isHidden = true
        lastFoodLeft.isHidden = true
        rightFoodPic.isHidden = true
        leftFoodPic.isHidden = true
        }
        generateAnswer()
    }

    @IBOutlet weak var rightFoodPic: UIImageView!
    @IBOutlet weak var leftFoodPic: UIImageView!
    @IBOutlet weak var foodPic: UIImageView!
    @IBOutlet weak var rightButtonClicked: UIButton!
    @IBOutlet weak var leftButtonClicked: UIButton!
    @IBOutlet weak var rightButtonHeight: NSLayoutConstraint!
    @IBOutlet weak var leftButtonHeight: NSLayoutConstraint!
    @IBOutlet weak var foodCategoryHeight: NSLayoutConstraint!
    @IBOutlet weak var lastFoodRight: UITextField!
    @IBOutlet weak var lastFoodLeft: UITextField!
    @IBOutlet weak var foodCategory: UITextField!
    
    var swipeRight: UISwipeGestureRecognizer!
    var swipeLeft: UISwipeGestureRecognizer!
    var index = 0
    var didSwipe = false
    var foodChoices = ["Chinese", "Mexican", "Italian", "Japanese", "Mediterranean", "French", "Thai", "Spanish", "Indian", "Greek", "BBQ", "Burgers", "Sandwich", "Seafood", "Pizza", "Steak"]
    
    //var maxIndex: Int = 0
    //        let randomIndex = Int(arc4random_uniform(maxIndex))
    //var currIndex = 0
//    if startingIndex == maxIndex {
//    startingIndex = 0
//    }
    
//    func getMaxInd() {
//        maxIndex = foodChoices.count
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        getMaxInd() // set the initial max index
//        func getMaxIndex() {
//        maxIndex = foodChoices.count
        
        //let foodCategoryChoice = foodCategory.text
        self.foodPic.contentMode = .scaleAspectFit
        self.rightFoodPic.contentMode = .scaleAspectFit
        self.leftFoodPic.contentMode = .scaleAspectFit
        swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.swipedToRight))
        swipeRight!.direction = .right
        self.view.addGestureRecognizer(swipeRight!)
        
        swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.swipedToLeft))
        swipeLeft!.direction = .left
        self.view.addGestureRecognizer(swipeLeft!)
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc func swipedToRight() {
        if didSwipe == false {
            didSwipe = true
        }
        generateAnswer()
        // Increment the index
        
        //currIndex += 1
    }
    
    @objc func swipedToLeft() {
        if didSwipe == false {
            didSwipe = true
        } else {
            //let randFood = foodCategory.text!
           // print("Left: \(randFood)")
            
            foodChoices.remove(at: index)
        }
        
        
        print("Swiped Left on Food Choices: \(foodChoices)")
        
        // FIXME: get the index value and pass it in
        index -= 1
        generateAnswer()
        
        
        // Set the max index again
        // Get the currentIndex
        // Increment the index Set the current index value
    }
    
    func selectedChoices(arrayOfFood: [String]) {
        var selectedFood = [String]()
        
        let randFood = foodCategory.text!
        print("Right: \(randFood)")
        
        if !selectedFood.contains(randFood) {
            selectedFood.append(randFood)
            
            
            
        }
        
        print("Swiped right on Food Choices: \(foodChoices)")
        print("Food Choices: \(foodChoices.count)")
    }
    func updateIndex() {
        index += 1
        if index >= foodChoices.count {
            index = 0
        }
    }
    func generateAnswer() {
        updateIndex()
        let maxIndex = foodChoices.count
        let randomIndex = Int(arc4random_uniform(UInt32(maxIndex)))
        foodPic.isHidden = false
        leftButtonHeight.constant = 0
        rightButtonHeight.constant = 0
        if foodChoices.count == 2 {
            
            print("\(foodChoices)")
            lastFoodRight.text = foodChoices[0]
            lastFoodLeft.text = foodChoices[1]
            foodCategoryHeight.constant = 0
            rightButtonClicked.isHidden = false
            leftButtonClicked.isHidden = false
            self.view.removeGestureRecognizer(swipeLeft)
            self.view.removeGestureRecognizer(swipeRight)
            foodPic.isHidden = true
            rightFoodPic.image = UIImage(named: foodChoices[0])
            
            
            leftFoodPic.image = UIImage(named: foodChoices[1])
          
            
        if foodChoices.count == 1 {
            print("\(foodChoices)")
            lastFoodRight.text = foodChoices[0]
            lastFoodLeft.text = foodChoices[1]
            foodCategoryHeight.constant = 48
            rightButtonClicked.isHidden = true
            leftButtonClicked.isHidden = true
            foodPic.isHidden = false
            //finalChoice.text = foodChoices[0]
            
            }
        }

        print("\(foodChoices.count)")
        print("\(foodChoices)")
        foodPic.image = UIImage(named: foodChoices[index])
        foodCategory.text = foodChoices[index]

    }
    
    
}


