//
//  CropDurationView.swift
//  PryntTrimmerView
//
//  Created by bo cui on 2025/3/9.
//  Copyright © 2025 hhk. All rights reserved.
//

import UIKit
import AVFoundation

class CropDurationView: UIView {
    
    public let timeLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }
    
    private func setupView() {
        backgroundColor = UIColor.black.withAlphaComponent(0.5)
        layer.cornerRadius = 2.0
        clipsToBounds = true
        
        // timeLabel
        timeLabel.textColor = .white
        timeLabel.font = UIFont.systemFont(ofSize: 10)
        timeLabel.textAlignment = .center
        timeLabel.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(timeLabel)
        
        // Layout
        NSLayoutConstraint.activate([
            timeLabel.topAnchor.constraint(equalTo: topAnchor),
            timeLabel.bottomAnchor.constraint(equalTo: bottomAnchor),
            timeLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 4),
            timeLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -4)
        ])
    }
    
    /// set time label with CMTime
    func setTime(time: CMTime) {
        let seconds = CMTimeGetSeconds(time)
        setTime(seconds: seconds)
    }
    
    /// set time label with seconds
    func setTime(seconds: Double) {
        timeLabel.text = String(format: "%.2fs", seconds)
    }
}
