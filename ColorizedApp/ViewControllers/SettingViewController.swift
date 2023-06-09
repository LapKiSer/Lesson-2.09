//
//  ViewController.swift
//  ColorizedApp
//
//  Created by Кирилл Лапковский on 24.03.2023.
//

import UIKit

final class SettingViewController: UIViewController {
    
    @IBOutlet var colorView: UIView!
    
    @IBOutlet var redSliderValue: UILabel!
    @IBOutlet var greenSliderValue: UILabel!
    @IBOutlet var blueSliderValue: UILabel!
    
    @IBOutlet var redSlider: UISlider!
    @IBOutlet var greenSlider: UISlider!
    @IBOutlet var blueSlider: UISlider!
    
    var colorViewSVC: UIColor!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        colorView.layer.cornerRadius = 10
        colorView.backgroundColor = colorViewSVC
        
        setSliderValue()
        
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
        colorView.backgroundColor = UIColor(
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
        guard let colorValue = colorView.backgroundColor?.cgColor.components else { return }
        if colorValue.count != 2 {
            redSlider.value = Float(colorValue[0])
            greenSlider.value = Float(colorValue[1])
            blueSlider.value = Float(colorValue[2])
        } else {
            redSlider.value = Float(colorValue[0])
            greenSlider.value = Float(colorValue[0])
            blueSlider.value = Float(colorValue[0])
        }
    }
}

