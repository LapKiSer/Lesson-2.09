//
//  EmptyViewController.swift
//  ColorizedApp2
//
//  Created by Кирилл Лапковский on 11.04.2023.
//

import UIKit

final class EmptyViewController: UIViewController {
    
    @IBOutlet var colorView: UIView!
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let settingVC = segue.destination as? SettingViewController else { return }
        settingVC.colorViewSVC = colorView.backgroundColor
    }
    
    @IBAction func unwind(for segue: UIStoryboardSegue) {
        guard let settingVC = segue.source as? SettingViewController else { return }
        colorView.backgroundColor = settingVC.colorView.backgroundColor
    }
}


