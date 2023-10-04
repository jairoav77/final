//
//  ContentView.swift
//  final
//
//  Created by Jairo Aguilar on 2/22/23.
//

import SwiftUI
import Charts
struct ContentView: View {
    
    let ViewMonth: [ViewMonth] = [
    
        .init(date: Date.from(year: 2023, month: 1, day: 1), kWh: 890),
        .init(date: Date.from(year: 2023, month: 2, day: 1), kWh: 960),
        .init(date: Date.from(year: 2023, month: 3, day: 1), kWh: 879),
        .init(date: Date.from(year: 2023, month: 4, day: 1), kWh: 856),
        .init(date: Date.from(year: 2023, month: 5, day: 1), kWh: 923),
        .init(date: Date.from(year: 2023, month: 6, day: 1), kWh: 1026),
        .init(date: Date.from(year: 2023, month: 7, day: 1), kWh: 934),
        .init(date: Date.from(year: 2023, month: 8, day: 1), kWh: 1040),
        .init(date: Date.from(year: 2023, month: 9, day: 1), kWh: 855),
        .init(date: Date.from(year: 2023, month: 10, day: 1), kWh: 837),
        .init(date: Date.from(year: 2023, month: 11, day: 1), kWh: 938),
        .init(date: Date.from(year: 2023, month: 12, day: 1), kWh: 940)
        
    ]
    
    
    
    var body: some View {
        VStack {
            Chart {
                RuleMark(y:.value("Goal", 25))
                    .foregroundStyle(Color.red)
                    .lineStyle(StrokeStyle(lineWidth: 1, dash:[5]))
                    .annotation(alignment:.leading){
                        Text("Goal")
                            .font(.caption)
                            .foregroundColor(.secondary)
                    }
                ForEach(ViewMonth) {ViewMonth in
                    BarMark(
                        x: .value("Month", ViewMonth.date, unit: .month),
                        y: .value("kWh", ViewMonth.kWh)
                    )
                    .foregroundStyle(Color.green.gradient)
                }
            }
            .frame(height: 180)
            .chartXAxis {
                AxisMarks( values: ViewMonth.map{$0.date}){ date in
                    AxisValueLabel(format: .dateTime.month(.narrow), centered: true)
                    
                }
            }
            .chartXAxis{
                
            }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct ViewMonth: Identifiable {
    let id = UUID()
    let date: Date
    let kWh: Int
}
extension Date {
    static func from(year: Int, month: Int, day: Int) -> Date {
        let componets = DateComponents(year:year, month: month, day: day )
        return Calendar.current.date(from: componets)!
    }
}
