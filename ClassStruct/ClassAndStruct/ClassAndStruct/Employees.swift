//
//  Employees.swift
//  ClassAndStruct
//
//  Created by Luat on 5/24/21.
//

import Foundation

class Employee {
    var payRate: PayRate = .normal
    var skills: [Skill] = []
    var hoursWorked: Int = 0
//    var assignedTasks: [Task] = []
    
    init() {}
    init(skills: [Skill], payRate: PayRate) {
        self.skills = skills
        self.payRate = payRate
    }
    
    func attempt(task: Task) -> Bool {
        self.hoursWorked += task.timeReq
        let attempt = Int.random(in: 1...5)
        if attempt == 1 {
            return false
        } else {
            return true
        }
//        return false
    }
}

class ProjectManager: Employee {
    
    override init() {
        super.init()
        skills.append(.ProjectManager)
    }
    
    func startTasks() {
//      Task List ===> Team.shared.taskList
        for task in Team.shared.taskList {
            if validate(task: task) {
                delegate(task: task)
            } else {
                task.isValid = false
            }
            print("Is Task Vaild: ", task.isValid)
        }
    }
    
    func validate(task: Task) -> Bool {
        print("======================")
        print("Team's Skills: ", Team.shared.skills)
        print("Task Skill Required: ", task.skillReq)
        if Team.shared.skills.contains(task.skillReq) {
            return true
        } else {
            return false
        }
    }
    
    func delegate(task: Task) {
        for employee in Team.shared.employees {
            if employee.skills.contains(task.skillReq) && task.timeReq + employee.hoursWorked <= 40 {
                if employee.attempt(task: task) {
                    task.isCompleted = true
                    break
                }
                break
            }
        }
    }
    
}
