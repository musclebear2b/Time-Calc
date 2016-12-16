//
//  Period.swift
//  Time Calc
//
//  Created by Richard Whent on 11/12/2016.
//  Copyright © 2016 Chunkster.net. All rights reserved.
//

import UIKit

class Period: NSObject {
    
    private var _startTimeHour: Int
    private var _startTimeMinute: Int
    private var _endTimeHour: Int
    private var _endTimeMinute: Int
    
    private var _totalMinutes: Int
    private var _totalHours: Int
    
    private var _timeString: String!
    private var _timeDecimal: Float!
    
    init(sHour: Int, sMinute: Int, eHour: Int, eMinute: Int) {
        func calculateDifference(start: Int, end: Int) -> Int {
            let difference = end - start
            return difference
        }
        
        let minutes = calculateDifference(start: sMinute, end: eMinute)
        let hours = calculateDifference(start: sHour, end: eHour)
        
        if (minutes > 0) {
            self._totalMinutes = minutes
            self._totalHours = hours
        }  else if (minutes < 0) {
            self._totalHours = hours - 1
            self._totalMinutes = 60 + minutes
        }  else {
            self._totalMinutes = minutes
            self._totalHours = hours
        }
        
        self._startTimeHour = sHour
        self._startTimeMinute = sMinute
        self._endTimeHour = eHour
        self._endTimeMinute = eMinute
        
    }
    
    var startTimeHour: Int {
        get {
            return self._startTimeHour
        }
    }
    var startTimeMinute: Int{
        get {
            return self._startTimeMinute
        }
    }
    var endTimeHour: Int{
        get {
            return self._endTimeHour
        }
    }
    var endTimeMinute: Int{
        get {
            return self._endTimeMinute
        }
    }
    
    var totalMinutes: Int {
        get {
            return self._totalMinutes
        }
    }
    
    var totalHours: Int {
        get {
            return self._totalHours
        }
    }
    
    
    var timeString: String {
        get {
            return ("\(self._totalHours)hr(s) \(self._totalMinutes)mins")
        }
    }
    
    var timeDecimal: Float {
        get {
            let decimalMinutes: Float = Float(self._totalMinutes) / 60.0
            self._timeDecimal = Float(self._totalHours) + decimalMinutes
            return self._timeDecimal
        }
    }
    
    
}
