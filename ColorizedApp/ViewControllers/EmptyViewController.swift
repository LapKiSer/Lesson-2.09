//
//  EmptyViewController.swift
//  ColorizedApp2
//
//  Created by Кирилл Лапковский on 11.04.2023.
//

import UIKit

final class EmptyViewController: UIViewController {
    
    @IBOutlet var colorView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
                
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let settingVC = segue.destination as? SettingViewController else { return }
        guard let cgColorComponen = colorView.backgroundColor?.cgColor.components as? [CGFloat] else { return }
        settingVC.colorsEmptyVC = cgColorComponen
        
    }
}
