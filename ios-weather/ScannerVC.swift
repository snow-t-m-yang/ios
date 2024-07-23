//
//  ScannerVC.swift
//  ios-weather
//
//  Created by S on 2024/7/23.
//

import AVFoundation
import UIKit

protocol ScannerVCDelegate: AnyObject {
	func didFind(barcode: String)
}

final class ScannerVC: UIViewController, AVCaptureMetadataOutputObjectsDelegate {
	// Delegates & protocal
	
	let captureSession = AVCaptureSession()
	var previewLayer: AVCaptureVideoPreviewLayer?
	weak var scannerDelegate: ScannerVCDelegate?
	
	init(scannerDelegate: ScannerVCDelegate) {
		super.init(nibName: nil, bundle: nil)
		self.scannerDelegate = scannerDelegate
	}
	
	@available(*, unavailable)
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	private func setupCaptureSession() {
		guard let videoCaptureDevice = AVCaptureDevice.default(for: .video) else {
			return
		}
		
		let videoInput: AVCaptureDeviceInput
		
		do {
			try videoInput = AVCaptureDeviceInput(device: videoCaptureDevice)
		} catch {
			return
		}
		
		if captureSession.canAddInput(videoInput) {
			captureSession.addInput(videoInput)
		} else {
			return
		}
		
		let metaDataOutput = AVCaptureMetadataOutput()
		
		if captureSession.canAddOutput(metaDataOutput) {
			captureSession.addOutput(metaDataOutput)
			metaDataOutput.setMetadataObjectsDelegate(self, queue: DispatchQueue.main)
			metaDataOutput.metadataObjectTypes = [.ean8, .ean13]
		} else {
			return
		}
		
		previewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
		previewLayer!.videoGravity = .resizeAspectFill
		view.layer.addSublayer(previewLayer!)
		
		captureSession.startRunning()
	}
}

extension ScannerVC: AVCaptureMetadataOutputObjectsDelegate {}
