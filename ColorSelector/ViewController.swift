//
//  ViewController.swift
//  ColorSelector
//
//  Created by Дмитрий Никишов on 24.09.2022.
//

import UIKit

class ViewController: UIViewController {

    //MARK: Outlets
    @IBOutlet weak var mixerView: UIView!
    @IBOutlet weak var blueValueLabel: UILabel!
    @IBOutlet weak var greenValueLabel: UILabel!
    @IBOutlet weak var redValueLabel: UILabel!
    @IBOutlet weak var blueSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var redSlider: UISlider!
    
    //MARK: Private data
    private var redValue: Float = 0.0 {
        didSet {
            redValueLabel.text = String(format: "%.2f", redValue/255)
        }
    }

    private var greenValue: Float = 0.0 {
        didSet {
            greenValueLabel.text = String(format: "%.2f", greenValue/255)
        }
    }

    private var blueValue: Float = 0.0 {
        didSet {
            blueValueLabel.text = String(format: "%.2f", blueValue/255)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        configureViews()
    }

    //MARK: Actions
    @IBAction func blueValueChanged() {
        blueValue = blueSlider.value
        updateMixerView()
    }
    
    @IBAction func greenValueChanged() {
        greenValue = greenSlider.value
        updateMixerView()
    }
    
    @IBAction func redValueChanged() {
        redValue = redSlider.value
        updateMixerView()
    }
    
    //MARK: Private functions
    private func updateMixerView() {
        mixerView.backgroundColor = UIColor(
            red: CGFloat(redValue)/255,
            green: CGFloat(greenValue)/255,
            blue: CGFloat(blueValue)/255,
            alpha: 1.0
        )
    }
    
    private func configureViews() {
        mixerView.layer.cornerRadius = 10
        redValue = redSlider.value
        blueValue = blueSlider.value
        greenValue = greenSlider.value
        
        updateMixerView()
    }
}

