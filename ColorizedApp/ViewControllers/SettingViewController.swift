//
//  ViewController.swift
//  ColorizedApp
//
//  Created by Кирилл Лапковский on 24.03.2023.
//

import UIKit

final class SettingViewController: UIViewController {
    
    @IBOutlet var colorViewSVC: UIView!
    
    @IBOutlet var redSliderValue: UILabel!
    @IBOutlet var greenSliderValue: UILabel!
    @IBOutlet var blueSliderValue: UILabel!
    
    @IBOutlet var redSlider: UISlider!
    @IBOutlet var greenSlider: UISlider!
    @IBOutlet var blueSlider: UISlider!
    
    var colorsEmptyVC: [CGFloat]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        colorViewSVC.layer.cornerRadius = 10
        
        setSliderValue()
        setColorView()
        
        redSliderValue.text = string(from: redSlider)
        greenSliderValue.text = string(from: greenSlider)
        blueSliderValue.text = string(from: blueSlider)
    }
    
    @IBAction func sliderAction(_ sender: UISlider) {
        setColorView()
        
        switch sender {
        case redSlider:
            redSliderValue.text = string(from: redSlider)
        case greenSlider:
            greenSliderValue.text = string(from: greenSlider)
        default:
            blueSliderValue.text = string(from: blueSlider)
        }
    }
    
    private func setColorView() {
        colorViewSVC.backgroundColor = UIColor(
            red: CGFloat(redSlider.value),
            green: CGFloat(greenSlider.value),
            blue: CGFloat(blueSlider.value),
            alpha: 1
        )
    }
    
    private func string(from slider:UISlider) -> String {
        String(format: "%.2f", slider.value)
    }
    
    private func setSliderValue() {
        if colorsEmptyVC.count != 2 {
            redSlider.value = Float(colorsEmptyVC[0])
            greenSlider.value = Float(colorsEmptyVC[1])
            blueSlider.value = Float(colorsEmptyVC[2])
        } else {
            redSlider.value = Float(colorsEmptyVC[0])
            greenSlider.value = Float(colorsEmptyVC[0])
            blueSlider.value = Float(colorsEmptyVC[0])
        }
    }
    
    @IBAction func unwind(for segue: UIStoryboardSegue) {
        //guard let emptyVC = segue.destination as? EmptyViewController else { return }
        
    }
}

