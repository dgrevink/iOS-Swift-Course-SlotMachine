//
//  Factory.swift
//  SlotMachine
//
//  Created by David Grevink on 2014-11-15.
//  Copyright (c) 2014 David Grevink. All rights reserved.
//

import Foundation
import UIKIt

class Factory {
    class func createSlots() -> [[Slot]] {
        let kNumberOfSlots = 3
        let kNumberOfContainers = 3
        
        var slots: [[Slot]] = []
        
        // slots = [ [slot1, slot2, slot3], [slot4, slot5, slot6], [slot7, slot8, slot9] ]
        // slots[1][2] -> slot5
        
        for var containerNumber = 0; containerNumber<kNumberOfContainers; ++containerNumber {
            var slotArray: [Slot] = []
            for var slotNumber = 0; slotNumber < kNumberOfSlots; ++slotNumber {
                slotArray.append(Factory.createSlot(slotArray))
            }
            slots.append(slotArray)
        }

        return slots
    }


    class func createSlot(currentCards: [Slot]) -> Slot {
        var currentCardValues: [Int] = []
        
        for slot in currentCards {
            currentCardValues.append(slot.value)
        }
        
        var randomNumber = Int(arc4random_uniform(UInt32(13)))
        while contains(currentCardValues, randomNumber + 1) {
            randomNumber = Int(arc4random_uniform(UInt32(13)))
        }
        
        var slot: Slot
        
        var cards:[String] = [ "Ace", "Two", "Three", "Four", "Five", "Six", "Seven", "Eight", "Nine", "Ten", "Jack", "Queen", "King", "Ace" ]
        var cardsColors:[Bool] = [ true, true, true, true, false, false, true, false, false, true, false, false, true, true ]
        
        return Slot(value: randomNumber, image: UIImage(named: cards[randomNumber]), isRed: cardsColors[randomNumber])
    }
    
}
