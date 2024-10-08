//
//  ScannerVC.swift
//  ios-weather
//
//  Created by S on 2024/7/23.
//

import AVFoundation
import UIKit

// UIViewController

enum CameraError {
	case invalidDeviceInput
	case invalidScannerValue
}

protocol ScannerVCDelegate: AnyObject {
	func didFind(barcode: String)
	func didSurface(error: CameraError)
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
	
	override func viewDidLoad() {
		super.viewDidLoad()
		setupCaptureSession()
	}
	
	override func viewDidLayoutSubviews() {
		super.viewDidLayoutSubviews()
		
		guard let previewLayer else {
			scannerDelegate?.didSurface(error: .invalidDeviceInput)
			return
		}
		
		previewLayer.frame = view.layer.bounds
	}
	
	private func setupCaptureSession() {
		guard let videoCaptureDevice = AVCaptureDevice.default(for: .video) else {
			scannerDelegate?.didSurface(error: .invalidDeviceInput)
			return
		}
		
		let videoInput: AVCaptureDeviceInput
		
		do {
			try videoInput = AVCaptureDeviceInput(device: videoCaptureDevice)
		} catch {
			scannerDelegate?.didSurface(error: .invalidDeviceInput)
			return
		}
		
		if captureSession.canAddInput(videoInput) {
			captureSession.addInput(videoInput)
		} else {
			scannerDelegate?.didSurface(error: .invalidDeviceInput)
			return
		}
		
		let metaDataOutput = AVCaptureMetadataOutput()
		
		if captureSession.canAddOutput(metaDataOutput) {
			captureSession.addOutput(metaDataOutput)
			metaDataOutput.setMetadataObjectsDelegate(self, queue: DispatchQueue.main)
			metaDataOutput.metadataObjectTypes = [.ean8, .ean13]
		} else {
			scannerDelegate?.didSurface(error: .invalidDeviceInput)
			return
		}
		
		previewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
		previewLayer!.videoGravity = .resizeAspectFill
		view.layer.addSublayer(previewLayer!)
		
		captureSession.startRunning()
	}
}

extension ScannerVC {
	func metadataOutput(_ output: AVCaptureMetadataOutput, didOutput metadataObjects: [AVMetadataObject], from connection: AVCaptureConnection) {
		guard let object = metadataObjects.first else {
			return
		}
		
		guard let machineReadableObject = object as? AVMetadataMachineReadableCodeObject else {
			scannerDelegate?.didSurface(error: .invalidScannerValue)
			return
		}
		
		guard let barcode = machineReadableObject.stringValue else {
			scannerDelegate?.didSurface(error: .invalidScannerValue)
			return
		}
		
		scannerDelegate?.didFind(barcode: barcode)
	}
}
