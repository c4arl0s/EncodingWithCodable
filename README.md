# Encoding with Codable

```swift
struct Note: Codable {
    let title: String
    let text: String
    let timestamp: Date
}
```

### Creating an instance of Note

```swift
let newNote = Note(title: "new note", text: "this is a new note", timestamp: Date())
```

### encode a value to a plist

```swift
let propertyListEncoder = PropertyListEncoder()
if let encodedNote = try? propertyListEncoder.encode(newNote) {
    print(encodedNote)
    print("it prints the number of bytes stored in the Data Object")
}
```

```swift
// now we are going to decode
let propertyListDecoder = PropertyListDecoder()
if let decodedNote = try? propertyListDecoder.decode(Note.self, from: encodedNote) {
    print(decodedNote)
}
```

# Writing data to a file

```swift
        let newNote = Note(title: "new note", text: "this is a new note", timestamp: Date())
        // now look at the following example to see how to use encoder object to encode a value to a plist.
        
        // where to saved ?
        let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        let archiveURL = documentsDirectory.appendingPathComponent("notes_test").appendingPathExtension("plist")
        
        let propertyListEncoder = PropertyListEncoder()
        if let encodedNote = try? propertyListEncoder.encode(newNote) {
            print(encodedNote)
            print("it prints the number of bytes stored in the Data Object")
            // write
            try? encodedNote.write(to: archiveURL)
            
            // now we are going to decode
            let propertyListDecoder = PropertyListDecoder()
            // retrieve and decode
            if let retrievedNoteData = try? Data(contentsOf: archiveURL), let decodedNote = try propertyListDecoder.decode(Note.self, from: retrievedNoteData) {
                print(decodedNote)
            }
        }
```


# Saving an Array of Model Data

- You just save the array of notes, and then encode notes array.



