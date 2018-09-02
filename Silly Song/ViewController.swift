//
//  ViewController.swift
//  Silly Song
//
//  Created by Muhammad Rahmatullah on 02/09/18.
//  Copyright © 2018 Maatx. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var lyricsView: UITextView!
    @IBOutlet weak var nameFIeld: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        nameFIeld.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func reset(_ sender: Any) {
        nameFIeld.text = ""
        lyricsView.text = ""
    }
    
    @IBAction func displayLyrics(_ sender: Any) {
        let silly = lyricsFromName(lyricsTemplate: bananaFanaTemplate, fullName: nameFIeld.text!)
        lyricsView.text = silly
        
    }
}

extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return false
    }
}

let bananaFanaTemplate = [
    "<FULL_NAME>, <FULL_NAME>, Bo B<SHORT_NAME>",
    "Banana Fana Fo F<SHORT_NAME>",
    "Me My Mo M<SHORT_NAME>",
    "<FULL_NAME>"].joined(separator: " \n ")

func shortNameForName(name:String) -> String{
    var name = name
    name.remove(at: name.startIndex)
    return name
}
func lyricsFromName(lyricsTemplate: String, fullName: String) -> String{
    let shortName = shortNameForName(name: fullName)
    let lyrics = lyricsTemplate
        .replacingOccurrences(of: "<FULL_NAME>", with: fullName)
        .replacingOccurrences(of: "<SHORT_NAME>", with: shortName)
    return lyrics
}
