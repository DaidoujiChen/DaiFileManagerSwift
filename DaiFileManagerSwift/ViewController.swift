//
//  ViewController.swift
//  DaiFileManagerSwift
//
//  Created by DaidoujiChen on 2015/11/9.
//  Copyright © 2015年 DaidoujiChen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("List Files in Document Folder : ", DaiFileManager.document.files.all())
        
        print("Create Folder Named \"Daidouji\"")
        DaiFileManager.document["/Daidouji/"]
        
        print("Create File Named\"Chen.empty\"")
        DaiFileManager.document["/Chen.empty"].write(NSData())
        
        print("List Files Contants String \".empty\" in Document Folder : ", DaiFileManager.document.files.filter(".empty"))
        
        print("List Folders in Document Folder : ", DaiFileManager.document.folders.all())
        
        print("Move \"/Chen.empty\" to \"/Daidouji/Haha.empty\"")
        DaiFileManager.document["/Chen.empty"].move(DaiFileManager.document["/Daidouji/Haha.empty"])
        
        print("Confirm File Moved to \"/Daidouji\": ", DaiFileManager.document["/Daidouji/"].files.all())
        
        print("Delete Daidouji Folder")
        DaiFileManager.document["/Daidouji/"].delete()
        
        print("Verify Daidouji Not Appear : ", DaiFileManager.document.folders.all())
    }

}

