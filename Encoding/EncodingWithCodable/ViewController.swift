//
//  ViewController.swift
//  EncodingWithCodable
//
//  Created by Carlos Santiago Cruz on 11/19/18.
//  Copyright © 2018 Carlos Santiago Cruz. All rights reserved.
//  Codable is a protocol that allows classes and structures to be encoded to o decoded from different types of data such as JASON or plist.
// The Codable Protocol declares two methods that a Class must implement so that its instances can be encoded and decoded, or seriealize, into data that can be written to a file on disk.
// plist format is similar to a representation of a Dictionary in a file that can be saved to disk.

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let newNote = Note(title: "new note", text: "this is a new note", timestamp: Date())
        // now look at the following example to see how to use encoder object to encode a value to a plist.
        
        // where to saved ?
        let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        let archiveURL = documentsDirectory.appendingPathComponent("notes_test").appendingPathExtension("plist")
        
        // encode
        let propertyListEncoder = PropertyListEncoder()
        if let encodedNote = try? propertyListEncoder.encode(newNote) {
            print(encodedNote)
            print("it prints the number of bytes stored in the Data Object")
            // write
            try? encodedNote.write(to: archiveURL)
            
            // now we are going to decode
            let propertyListDecoder = PropertyListDecoder()
            // retrieve and decode
            if let retrievedNoteData = try? Data(contentsOf: archiveURL), let decodedNote = try? propertyListDecoder.decode(Note.self, from: retrievedNoteData) {
                print(decodedNote)
            }
        }
        
        
        //
    }


}

