//
//  ViewController.swift
//  ElliotableDebug
//
//  Created by denny.k on 24/02/2020.
//  Copyright © 2020 Taein Kim. All rights reserved.
//

import UIKit
import Elliotable

class ViewController: UIViewController {
    
    @IBOutlet var elliotable: Elliotable!
    private var courseList = [ElliottEvent]()
    private let daySymbol = ["월", "화", "수", "목", "금"]
    
    private var isAdded = false
    @IBOutlet weak var lblSwitch: UILabel!
    @IBOutlet weak var toggleBtn: UIButton!
    @IBOutlet weak var fullBorderSwitch: UISwitch!
    @IBAction func onClickSwitch(_ sender: UISwitch) {
        elliotable.isFullBorder = sender.isOn
        lblSwitch.text = sender.isOn ? "테두리 켬" : "테두리 끔"
    }
    
    @IBAction func addItem(_ sender: Any) {
        
        if !isAdded {
            courseList.append(ElliottEvent(courseId: "2150000012", courseName: "운제", roomName: "정보과학관\n21204", courseDay: .monday, startTime: "08:00", endTime: "08:55", backgroundColor: UIColor(named: "sample_2")!))
        
            courseList.append(ElliottEvent(courseId: "2150000013", courseName: "운제22", roomName: "정보과학관\n21204", courseDay: .thursday, startTime: "20:00", endTime: "21:55", backgroundColor: UIColor(named: "sample_5")!))
            
            isAdded = true
            toggleBtn.setTitle("추가한 항목제거", for: .normal)
        } else {
            courseList.removeLast()
            courseList.removeLast()
            isAdded = false
            toggleBtn.setTitle("강의 추가하기", for: .normal)
        }
        self.elliotable.reloadData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("viewWillAppear")
        self.elliotable.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let course_1 = ElliottEvent(courseId: "2150000001", courseName: "운영체제", roomName: "정보과학관\n21204", courseDay: .tuesday, startTime: "12:00", endTime: "13:15", backgroundColor: UIColor(named: "sample_2")!)
        
        let course_2 = ElliottEvent(courseId: "2150000002", courseName: "운영체제", roomName: "정보과학관\n21204", courseDay: .thursday, startTime: "12:00", endTime: "13:15", backgroundColor: UIColor(named: "sample_2")!)
        
        let course_3 = ElliottEvent(courseId: "2150000003", courseName: "빅데이터시스템", roomName: "정보과학관\n21203", courseDay: .tuesday, startTime: "10:30", endTime: "11:45", backgroundColor: UIColor(named: "sample_5")!)
        
        let course_4 = ElliottEvent(courseId: "2150000004", courseName: "정보보안", roomName: "정보과학관\n21201", courseDay: .monday, startTime: "09:00", endTime: "10:15", backgroundColor: UIColor(named: "sample_1")!)
        
        let course_5 = ElliottEvent(courseId: "2150000005", courseName: "정보보안", roomName: "정보과학관\n21201", courseDay: .wednesday, startTime: "09:00", endTime: "10:15", backgroundColor: UIColor(named: "sample_1")!)
        
        let course_6 = ElliottEvent(courseId: "2150000006", courseName: "정보기술세미나", roomName: "정보과학관\n21102", courseDay: .thursday, startTime: "16:30", endTime: "17:50", backgroundColor: UIColor(named: "sample_5")!)
        
        let course_7 = ElliottEvent(courseId: "2150000007", courseName: "컴퓨터공학특강2", roomName: "정보과학관\n21204", courseDay: .tuesday, startTime: "16:30", endTime: "17:45", backgroundColor: UIColor(named: "sample_4")!)
        
        let course_8 = ElliottEvent(courseId: "2150000008", courseName: "컴퓨터공학특강2", roomName: "정보과학관\n21204", courseDay: .friday, startTime: "16:30", endTime: "17:45", backgroundColor: UIColor(named: "sample_4")!)
        
        let course_9 = ElliottEvent(courseId: "2150000009", courseName: "데이터베이스", roomName: "정보과학관\n21203", courseDay: .monday, startTime: "12:00", endTime: "13:15", backgroundColor: UIColor(named: "sample_3")!)
        
        let course_10 = ElliottEvent(courseId: "2150000010", courseName: "데이터베이스", roomName: "정보과학관\n21203", courseDay: .wednesday, startTime: "12:00", endTime: "13:15", backgroundColor: UIColor(named: "sample_3")!)
        
        let course_11 = ElliottEvent(courseId: "2150000011", courseName: "데이터베이스", roomName: "정보과학관\n21203", courseDay: .wednesday, startTime: "18:00", endTime: "19:45", backgroundColor: UIColor(named: "sample_1")!)
        
        courseList.append(contentsOf: [course_1, course_2, course_3, course_4, course_5, course_6, course_7, course_8, course_9, course_10, course_11
        ])
        
        elliotable.delegate = self
        elliotable.dataSource = self
        
        self.elliotable.reloadData()
        
        elliotable.roundCorner = .left
        elliotable.elliotBackgroundColor = UIColor.white
        
        // Full Border Option Test
        elliotable.isFullBorder = true
        
        elliotable.borderWidth = 1
        elliotable.borderColor = UIColor(hex: "#dadada", alpha: 1.0)
        elliotable.borderCornerRadius = 24
        
        elliotable.textEdgeInsets = UIEdgeInsets(top: 2, left: 5, bottom: 2, right: 3)
        elliotable.courseItemMaxNameLength = 18
        elliotable.courseItemTextSize = 12.5
        elliotable.courseTextAlignment = .right
        elliotable.roomNameFontSize = 8
        
        elliotable.symbolFontSize = 14
        elliotable.symbolTimeFontSize = 12
        elliotable.symbolFontColor = UIColor(displayP3Red: 0.1, green: 0.1, blue: 0.1, alpha: 1.0)
        elliotable.symbolTimeFontColor = UIColor(displayP3Red: 0.5, green: 0.5, blue: 0.5, alpha: 1.0)
        elliotable.symbolBackgroundColor = UIColor(named: "main_bg") ?? .white
    }
}

extension ViewController {
    func showAlert(title: String, content: String) {
        let alert = UIAlertController(title: title, message: content, preferredStyle: UIAlertController.Style.alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler : nil )
        alert.addAction(okAction)
        present(alert, animated: true, completion: nil)
    }
}

extension ViewController: ElliotableDelegate, ElliotableDataSource {
    func elliotable(elliotable: Elliotable, at textPerIndex: Int) -> String {
        return self.daySymbol[textPerIndex]
    }
    
    func courseItems(in elliotable: Elliotable) -> [ElliottEvent] {
        return courseList
    }
    
    func numberOfDays(in elliotable: Elliotable) -> Int {
        return self.daySymbol.count
    }
    
    func elliotable(elliotable: Elliotable, didSelectCourse selectedCourse: ElliottEvent) {
        showAlert(title: "Clicked : \(selectedCourse.courseName)", content: "터치되었습니다.")
    }
    
    func elliotable(elliotable: Elliotable, didLongSelectCourse longSelectedCourse : ElliottEvent) {
        showAlert(title: "Long Clicked : \(longSelectedCourse.courseName)", content: "길게 터치되었습니다.")
    }
}

extension UIColor {
    convenience init(hex: String, alpha: CGFloat = 1.0) {
        var hexFormatted: String = hex.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines).uppercased()

        if hexFormatted.hasPrefix("#") {
            hexFormatted = String(hexFormatted.dropFirst())
        }

        assert(hexFormatted.count == 6, "Invalid hex code used.")

        var rgbValue: UInt64 = 0
        Scanner(string: hexFormatted).scanHexInt64(&rgbValue)

        self.init(red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
                  green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
                  blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
                  alpha: alpha)
    }
}
