//
//  ViewController.swift
//  RealmTutorial
//
//  Created by Leonardo Fontes on 28/03/17.
//  Copyright © 2017 Leonardo Fontes. All rights reserved.
//

import UIKit
import Charts
import RealmSwift

class ViewController: UIViewController {

    @IBOutlet weak var tfValue: UITextField!
    @IBOutlet weak var barView: BarChartView!
    
    weak var axisFormatDelegate: IAxisValueFormatter?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        axisFormatDelegate = self
        
        updateChartWithData()
        
        
    }
    
    func updateChartWithData() {
        var dataEntries: [BarChartDataEntry] = []
        
        let visitorCounts = getVisitorCountsFromDatabase()
        
        for i in 0..<visitorCounts.count {
            let timeIntervalForDate: TimeInterval = visitorCounts[i].date.timeIntervalSince1970
            let dataEntry = BarChartDataEntry(x: Double(timeIntervalForDate), y: Double(visitorCounts[i].count))
            dataEntries.append(dataEntry)
        }
        let chartDataSet = BarChartDataSet(values: dataEntries, label: "Visitor count")
        let chartData = BarChartData(dataSet: chartDataSet)
        barView.data = chartData
        
        let xaxis = barView.xAxis
        xaxis.valueFormatter = axisFormatDelegate
    }
    
    func getVisitorCountsFromDatabase() -> Results<VisitorCount> {
        do {
            let realm = try Realm()
            print("Path to realm file: " + realm.configuration.fileURL!.absoluteString)
            return realm.objects(VisitorCount.self)
        } catch let error as NSError {
            fatalError(error.localizedDescription)
        }
    }

    @IBAction func btnAddTapped(_ sender: Any) {
        if let value = tfValue.text , value != "" {
            let visitorCount = VisitorCount()
            visitorCount.count = (NumberFormatter().number(from: value)?.intValue)!
            visitorCount.save()
            tfValue.text = ""
        }
        updateChartWithData()
    }
}

// MARK: axisFormatDelegate
extension ViewController: IAxisValueFormatter {
    
    func stringForValue(_ value: Double, axis: AxisBase?) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm.ss"
        return dateFormatter.string(from: Date(timeIntervalSince1970: value))
    }
}
