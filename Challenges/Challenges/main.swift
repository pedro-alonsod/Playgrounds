//
//  main.swift
//  Challenges
//
//  Created by Nora Hilda De los Reyes on 01/07/17.
//  Copyright © 2017 Bamaja Labs. All rights reserved.
//

import Foundation


func challenge27(fileName: String, n: Int) {
    
    guard let input = try? String(contentsOfFile: fileName) else { return }
    var lines = input.components(separatedBy: "\n")
    guard lines.count > 0 else { return }
    lines.reverse()
    
    for i in 0..<min(lines.count, n) {
        print(lines[i])
    }
}

challenge27(fileName: "damageproto.txt", n: 100)

func challenge28(file: String, log: String) {
    
    var logE = (try? String(contentsOfFile: file)) ?? ""
    logE.append("\(Date()): \(log) \n")
    
    do {
        try logE.write(toFile: file, atomically: true, encoding: .utf8)
    } catch {
        print("Failed to write to log: \(error.localizedDescription)")
    }
}

challenge28(file: "dup.txt", log: "test")
challenge28(file: "dup.txt", log: "testtets test test")

func challenge29() -> [URL] {
    print(FileManager.default.urls(for: .documentDirectory, in: .userDomainMask))
    return FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
}

challenge29()

func challenge30(dir: String) -> [String] {
    let fm = FileManager.default
    let diURL = URL(fileURLWithPath: dir)
    
    guard let files = try? fm.contentsOfDirectory(at: diURL, includingPropertiesForKeys: nil) else {
        return [] }
    
    var jpegs = [String]()
    
    for file in files {
        if file.pathExtension == "jpeg" || file.pathExtension == "jpg" {
            guard let attributes = try? fm.attributesOfItem(atPath: file.path) else { continue }
            
            guard let creationDate = attributes[.creationDate] as? Date else { continue }
            
            if creationDate > Date(timeIntervalSinceNow: -60 * 60 * 48) {
                
                jpegs.append(file.lastPathComponent)
            }
        }
    }
    print(jpegs)
    return jpegs
}

challenge30(dir: "Users")

func chhallenge31(src: String, des: String) -> Bool {
    let fm = FileManager.default
    var isDirectory: ObjCBool = false
    
    guard fm.fileExists(atPath: src, isDirectory: &isDirectory) || isDirectory.boolValue == false else { return false }
    let srcURL = URL(fileURLWithPath: src)
    let desURL = URL(fileURLWithPath: des)
    
    do {
        try fm.copyItem(at: srcURL, to: desURL)
    } catch let error {
        print(error.localizedDescription)
        return false
    }
    return true
}

func challenge32(src: String, count: String) -> Int {
    guard let inputString = try? String(contentsOfFile: src) else { return 0 }
    var nonLetters = CharacterSet.letters.inverted
    nonLetters.remove("'")
    
    let allWords = inputString.components(separatedBy: nonLetters)
    let wordSet = NSCountedSet(array: allWords)
    
    return wordSet.count(for: count)
}

func challenge33(dir: String) -> [String] {
    let fm = FileManager.default
    let dirURL = URL(fileURLWithPath: dir)
    var duplicates = Set<String>()
    var seen = Set<String>()
    
    guard let files = fm.enumerator(atPath: dirURL, includingPropertiesForKeys: nil) else { return [] }
    
    for case let file as URL in files {
        guard file.hasDirectoryPath == false else { continue }
        let fileName = file.lastPathComponent
        
        if seen.contains(fileName) {
            duplicates.insert(fileName)
        }
        
        seen.insert(fileName)
    }
    
    return Array(duplicates)
}

func challenge34(dir: String) -> [String] {
    let fm = FileManager.default
    let dirURL = URL(fileURLWithPath: dir)
    
    guard let files = try? fm.contentsOfDirectory(at: dirURL, includingPropertiesForKeys: nil) else { return [] }
    var returnValue = [String]()
    
    for file in files {
        guard file.hasDirectoryPath == false else { continue }
        
        if fm.isExecutableFile(atPath: file.path) {
            returnValue.append(file.lastPathComponent)
        }
    }
    
    return returnValue
}

// iOS
func challenge35(dir: String) {
    let fm = FileManager.default
    let dirURL = URL(fileURLWithPath: dir)
    guard let files = try? fm.contentsOfDirectory(at: dirURL, includingPropertiesForKeys: nil) else { return }
    
    for file in files {
        guard file.pathExtension == "jpeg" || file.pathExtension == "jpg" else { return }
        guard let image = UIImage(contentsOfFile: file.path) else { continue }
        guard let png = UIImagePNGRepresentation(image) else { continue }
        let newFileName = file.deletingPathExtension().appendingPathExtension("png")
        _ = try? png.write(to: newFileName)
    }
}
func challenge36(){}

