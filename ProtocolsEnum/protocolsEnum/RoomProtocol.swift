//
//  RoomProtocol.swift
//  protocolsEnum
//
//  Created by Luat on 5/25/21.
//

import UIKit

/**
 0) Have house adopt home protocol and implement print motto
 1) Create Protocol room, should have:
 property:
  - wallpaperColor: UIColor? (built in enum)
  - needsRepair: Bool?
  - value: Int?
 2) Home protocol should enforce a property rooms (array of any room)
  - a room can be of type bed room, living room, or dining room
 3) House
  property:
  - needsRepair: Bool (if any room needs repair then house needs repair)
  Functions:
  - getValue() -> Int (get the total value of each room)
 */
struct House: Home {
    func printMotto() {
        print("Fuck Off!")
    }
    
    var rooms: [Room]?
    var needsRepair: Bool { get { return self.needsRepaired() } }
    func needsRepaired() -> Bool {
        if let rooms = self.rooms {
            for optRoom in rooms {
                if let roomBool = optRoom.needsRepair {
                    if roomBool {
                        return true
                    }
                }
            }
        }
        return false
    }
    func getValue() -> Int {
        if let rooms = self.rooms {
            return rooms.reduce(0, { acc, optRoomValue in
                if let roomValue = optRoomValue.value {
                    return acc + roomValue
                }
                return acc
            })
        }
        return 0
    }
}
struct BedRoom: Room {
    var value: Int?
    var wallpaperColor: UIColor?
    var needsRepair: Bool?
}

struct LivingRoom: Room {
    var value: Int?
    var wallpaperColor: UIColor?
    var needsRepair: Bool?
}

struct DiningRoom: Room {
    var value: Int?
    var wallpaperColor: UIColor?
    var needsRepair: Bool?
}

protocol Home {
    func printMotto()
    var rooms: [Room]? { get set }
    func getValue() -> Int
}

protocol Room {
    var value: Int? { get set }
    var wallpaperColor: UIColor? { get set }
    var needsRepair: Bool? { get set }
}

