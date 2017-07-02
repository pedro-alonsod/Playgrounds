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
    logE.append("\(Date()): \(log)")
    
    do {
        try logE.write(toFile: file, atomically: true, encoding: .utf8)
    } catch {
        print("Failed to write to log: \(error.localizedDescription)")
    }
}

challenge28(file: "dup.txt", log: "test")
