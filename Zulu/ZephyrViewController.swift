//
//  ZephyrViewController.swift
//  Zulu
//
//  Created by Jonathan Paulson on 3/23/18.
//  Copyright © 2018 Zulu. All rights reserved.
//

import UIKit
import AVFoundation

class ZephyrViewController: UIViewController, AVCaptureMetadataOutputObjectsDelegate {
    var store = DataStore.sharedInstance
    
    var captureSession = AVCaptureSession()
    var videoPreviewLayer : AVCaptureVideoPreviewLayer?
    var qrCodeFrameView : UIView?
    
    private let supportedCodeTypes = [AVMetadataObject.ObjectType.qr]
    
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var namingTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
        
        // Do any additional setup after loading the view.
        var deviceDiscoverySession : AVCaptureDevice.DiscoverySession
        
        if AVCaptureDevice.default(.builtInDualCamera, for: AVMediaType.video, position: .back) != nil {
            deviceDiscoverySession = AVCaptureDevice.DiscoverySession(deviceTypes: [.builtInDualCamera], mediaType: AVMediaType.video, position: .back)
        } else {
            deviceDiscoverySession = AVCaptureDevice.DiscoverySession(deviceTypes: [.builtInWideAngleCamera], mediaType: AVMediaType.video, position: .back)
        }
        
        guard let captureDevice = deviceDiscoverySession.devices.first else {
            print("Failed to get the camera device")
            return
        }
        
        do {
            // Get an instance of the AVCaptureDeviceInput class using the previous device object.
            let input = try AVCaptureDeviceInput(device: captureDevice)
            
            // Set the input device on the capture session.
            captureSession.addInput(input)
            
            // Initialize a AVCaptureMetadataOutput object and set it as the output device to the capture session.
            let captureMetadataOutput = AVCaptureMetadataOutput()
            captureSession.addOutput(captureMetadataOutput)
            
            // Set delegate and use the default dispatch queue to execute the call back
            captureMetadataOutput.setMetadataObjectsDelegate(self, queue: DispatchQueue.main)
            captureMetadataOutput.metadataObjectTypes = supportedCodeTypes
            
        } catch {
            // If any error occurs, simply print it out and don't continue any more.
            print(error)
            return
        }
        
        
        // Initialize the video preview layer and add it as a sublayer to the viewPreview view's layer.
        videoPreviewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
        videoPreviewLayer?.videoGravity = AVLayerVideoGravity.resizeAspectFill
        videoPreviewLayer?.frame = view.layer.bounds
        view.layer.addSublayer(videoPreviewLayer!)
        
        // Start video capture.
        captureSession.startRunning()
        
        // Move the message label and top bar to the front
        view.bringSubview(toFront: messageLabel)
        
        // Initialize QR Code Frame to highlight the QR code
        qrCodeFrameView = UIView()
        
        if let qrCodeFrameView = qrCodeFrameView {
            qrCodeFrameView.layer.borderColor = UIColor.green.cgColor
            qrCodeFrameView.layer.borderWidth = 2
            view.addSubview(qrCodeFrameView)
            view.bringSubview(toFront: qrCodeFrameView)
        }
        
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        loadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func submitButtonTapped(_ sender: Any) {
        if namingTextField.text != "" {
            if let unwrappedText = namingTextField.text {
                switch unwrappedText {
                case "Item1":
                    let newItem = Item(name: unwrappedText, price: 2.75)
                    self.saveData(item: newItem)
                case "Item2":
                    let newItem = Item(name: unwrappedText, price: 3.75)
                    self.saveData(item: newItem)
                case "Item3":
                    let newItem = Item(name: unwrappedText, price: 4.75)
                    self.saveData(item: newItem)
                case "Item4":
                    let newItem = Item(name: unwrappedText, price: 5.75)
                    self.saveData(item: newItem)
                case "Item5":
                    let newItem = Item(name: unwrappedText, price: 6.75)
                    self.saveData(item: newItem)
                default:
                    let newItem = Item(name: unwrappedText, price: 9.99)
                    self.saveData(item: newItem)
                }
            }
        }
    }
    
    /*
    var filePath : String {
        //Manager lets you examine contents of files and folders in your app; creates a directory to where we are saving it
        let manager = FileManager.default
        
        //This returns an array of urls from our documentDirectory and we take the first path
        let url = manager.urls(for: .documentDirectory, in: .userDomainMask).first
        
        print("This is the url path in the documentDirectory \(url)")
        
        //Creates a new path component and creates a new path called Data which is where we will store our data array and save it to our file path. This does everything for encoding and decoding
        
        return (url!.appendingPathComponent("Data").path)
    }
    */
    private func saveData(item: Item){
        self.store.Items.append(item)
        
        //NSKeyedArchiver is going to look through every Item class and list and look for encode function and is going to encode our data and save it
        
        //archiveRootObject saves our array of items to our filepath url
        NSKeyedArchiver.archiveRootObject(self.store.Items, toFile: store.filePath)
    }
    
    private func loadData() {
        //If we can get our data back from our archives, get our data along our filepath and cast it as an array of Items
        
        if let ourData = NSKeyedUnarchiver.unarchiveObject(withFile: store.filePath) as? [Item] {
            self.store.Items = ourData
        }
    }
    
    func metadataOutput(_ output: AVCaptureMetadataOutput, didOutput metadataObjects: [AVMetadataObject], from connection: AVCaptureConnection) {
        // Check if the metadataObjects array is not nil and it contains at least one object.
        if metadataObjects.count == 0 {
            qrCodeFrameView?.frame = CGRect.zero
            messageLabel.text = "No QR code is detected"
            return
        }
        
        // Get the metadata object.
        let metadataObj = metadataObjects[0] as! AVMetadataMachineReadableCodeObject
        
        if metadataObj.type == AVMetadataObject.ObjectType.qr {
            // If the found metadata is equal to the QR code metadata then update the status label's text and set the bounds
            let barCodeObject = videoPreviewLayer?.transformedMetadataObject(for: metadataObj)
            qrCodeFrameView?.frame = barCodeObject!.bounds
            
            if metadataObj.stringValue != nil {
                messageLabel.text = metadataObj.stringValue
                if messageLabel.text == store.Products[messageLabel.text!]?.initName
                {
                    store.productToAdd = store.Products[messageLabel.text!]
                    performSegue(withIdentifier: "GoToConfirmation", sender: self)
                }
            }
        }
    }

    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
