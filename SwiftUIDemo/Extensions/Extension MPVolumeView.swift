//
//  Extension MPVolumeView.swift
//  SwiftUIDemo
//
//  Created by Varun Kapoor on 22/12/23.
//


import MediaPlayer

extension MPVolumeView {
    static func setVolume(_ volume: Float) -> Void {
        let volumeView = MPVolumeView()
        let slider = volumeView.subviews.first(where: { $0 is UISlider }) as? UISlider

        DispatchQueue.main.async {
            slider?.value = volume
        }
    }
}
