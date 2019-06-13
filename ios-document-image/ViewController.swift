//
//  ViewController.swift
//  ios-document-image
//
//  Created by 王晓鹏 on 2019/6/12.
//  Copyright © 2019 王晓鹏. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        copyFile()
    }

    func copyFile() {
        let fileManager = FileManager.default
        
        let path = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory, .userDomainMask, true).first
        let userFolder = "\(path ?? "")/assets"
        
        //create the assets folder
        var isDir : ObjCBool = false
        let isExist = fileManager.fileExists(atPath: userFolder, isDirectory: &isDir)
        if !isExist{
             try! fileManager.createDirectory(atPath: userFolder, withIntermediateDirectories: true, attributes: nil)
        }
        
        // copy the image from bundle to document
        let userPath = "\(userFolder)/200.jpg"
//        if !fileManager.fileExists(atPath: userPath) {
//            let originPath = Bundle.main.path(forResource: "200", ofType: "jpg")
//            if let _originPath = originPath {
//                try! fileManager.copyItem(atPath: _originPath, toPath: userPath)
//            }
//        }
        
        // copy the image from xcassets to document
        let image = UIImage(named: "200")
        if let _image = image {
            try! _image.pngData()?.write(to: URL(fileURLWithPath: userPath))
        }
        
        // show the image
        imageView.image = UIImage(contentsOfFile: userPath)
    }
}

