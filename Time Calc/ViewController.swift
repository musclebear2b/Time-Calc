//
//  ViewController.swift
//  Time Calc
//
//  Created by Richard Whent on 11/12/2016.
//  Copyright © 2016 Chunkster.net. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var totalMinuteCounter: Float = 0.0
    var totalSumMinutes: Int = 0
    var totalSumHours: Int = 0
    
    var periods = [Period]()
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var startHour: UITextField!
    
    @IBOutlet weak var startMinute: UITextField!
    
    @IBOutlet weak var endHour: UITextField!
    
    @IBOutlet weak var endMinute: UITextField!
    
    @IBOutlet weak var totalMinutes: UILabel!
    
    @IBOutlet weak var totalHours: UILabel!
    
    @IBOutlet weak var sumHours: UILabel!
    
    @IBOutlet weak var hrsAndMins: UILabel!
    
    @IBAction func addButton(_ sender: Any) {
        
        if ((checkIfNumber(input: startHour.text!)) &&
            (checkIfNumber(input: startMinute.text!)) &&
            (checkIfNumber(input: endHour.text!)) &&
            (checkIfNumber(input: endMinute.text!))) {
            
            let sHour: Int = Int(startHour.text!)!
            let sMinute: Int = Int(startMinute.text!)!
            let eHour: Int = Int(endHour.text!)!
            let eMinute: Int = Int(endMinute.text!)!
            let newPeriod = Period(sHour: sHour, sMinute: sMinute, eHour: eHour, eMinute: eMinute)
            periods.append(newPeriod)
        
            totalMinuteCounter += newPeriod.timeDecimal
            sumHours.text = String(format: "%.2f", (totalMinuteCounter))
        
            totalMinutes.text = newPeriod.timeString
            totalHours.text = "\(newPeriod.timeDecimal)"
        
            totalSumHours += newPeriod.totalHours
            totalSumMinutes += newPeriod.totalMinutes
            if (totalSumMinutes > 59) {
                totalSumHours += 1
                totalSumMinutes -= 60
            }
            
            hrsAndMins.text = "\(totalSumHours):\(totalSumMinutes)"
        
            self.tableView.reloadData()
            resetTextBoxes()
        }
    }
    
    @IBAction func clearButton(_ sender: Any) {
        periods = [Period]()
        self.tableView.reloadData()
        totalMinuteCounter = 0.0
        totalSumMinutes = 0
        totalSumHours = 0
        resetTextBoxes()
        resetLabels()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        tableView.delegate = self
        tableView.dataSource = self
        resetLabels()
        resetTextBoxes()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    //  Table functions below here
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return periods.count // your number of cell here
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TimePeriodCell", for: indexPath) as! TimePeriodCell
        
        let row = self.periods[indexPath.row]
       
        let start = "\(row.startTimeHour):\(row.startTimeMinute)"
        cell.startTime.text = start
        print(start)
        let end = "\(row.endTimeHour):\(row.endTimeMinute)"
        cell.endTime.text = end
        print(end)
        cell.totalTime.text = row.timeString
        let decimalTime:String = String(format: "%.2f", (row.timeDecimal))
        cell.timeInDecimals.text = decimalTime
        print(decimalTime)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // cell selected code here
    }
    
    func resetTextBoxes() {
        startHour.text = ""
        startMinute.text = ""
        endHour.text = ""
        endMinute.text = ""
    }
    func resetLabels() {
        sumHours.text = String(format: "%.2f", (totalMinuteCounter))
        totalMinutes.text = "0"
        totalHours.text = "0"
        hrsAndMins.text = "\(totalSumHours):\(totalSumMinutes)"
    }
    
    func checkIfNumber(input: String) -> Bool {
        let value = Int(input)
        let isNumber = (value != nil)
        return isNumber
    }
    
}

