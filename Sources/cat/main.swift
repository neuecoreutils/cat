import Foundation
import ArgumentParser

let argc = CommandLine.argc
let argv = CommandLine.arguments
let fm = FileManager.default


for f: String in argv {
    if FileManager.default.fileExists(atPath: f) {

        let file: FileHandle? = FileHandle(forReadingAtPath: f)
        if file != nil {
            let data: Data = file!.readDataToEndOfFile()
            if data.count > 0 {
                let str: NSString? = NSString(data: data, encoding: String.Encoding.utf8.rawValue)
                if str != nil {
                    print(str!)
                }
            }
        }
    }

    else {
        print("File does not exist.")
        exit(1)
    }
}

