//: Playground - noun: a place where people can play

import UIKit
import PlaygroundSupport
import chroma

let contentView = UIView(frame: CGRect(x: 0, y: 0, width: 300, height: 50))
PlaygroundPage.current.needsIndefiniteExecution = true
PlaygroundPage.current.liveView = contentView

let redColor = UIColor.red
let tealColor = UIColor(red: 0, green: 128 / 255, blue: 128 / 255, alpha: 1)

let normalView = UIView(frame: CGRect(x: 0, y: 0, width: 300, height: 20))
let normalGradientLayer = CAGradientLayer()
normalGradientLayer.frame = normalView.bounds
normalGradientLayer.locations = [0, 1]
normalGradientLayer.startPoint = CGPoint(x: 0, y: 0.5)
normalGradientLayer.endPoint = CGPoint(x: 1, y: 0.5)
normalGradientLayer.colors = [redColor.cgColor, tealColor.cgColor]
normalView.layer.addSublayer(normalGradientLayer)
contentView.addSubview(normalView)

let chromaView = UIView(frame: CGRect(x: 0, y: 30, width: 300, height: 20))
let chromaGradientLayer = CAGradientLayer()
chromaGradientLayer.frame = chromaView.bounds
chromaGradientLayer.locations = [0, 0.2, 0.4, 0.6, 0.8, 1]
chromaGradientLayer.startPoint = CGPoint(x: 0, y: 0.5)
chromaGradientLayer.endPoint = CGPoint(x: 1, y: 0.5)
chromaGradientLayer.colors = Chroma().scale([redColor, tealColor], colorSpace: .lab).split(6).map { $0.cgColor }
chromaView.layer.addSublayer(chromaGradientLayer)
contentView.addSubview(chromaView)
