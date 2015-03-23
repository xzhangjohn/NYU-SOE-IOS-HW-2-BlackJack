//
//  Initcard.swift
//  BlackJack
//
//  Created by Student on 2/14/15.
//  Copyright (c) 2015 XiaoZhang. All rights reserved.
//

import Foundation
//init card object

    enum Suit: String{
        case Spades = "spades", Hearts = "hearts", Diamonds = "diamonds", Clubs = "clubs"
    }
    
    enum Rank: Int {
        case  Ace = 1, Two, Three, Four, Five, Six, Seven, Eight, Nine, Ten
        case Jack, Queen, King
        struct Values {
            let first: Int, second: Int?
        }
        var values: Values {
            switch self {
            case .Ace:
                return Values(first: 1, second: 11)
            case .Jack, .Queen, .King:
                return Values(first: 10, second: nil)
            default:
                return Values(first: self.rawValue, second: nil)
            }
        }
    }

struct BlackJackCard {
    let rank: Rank, suit: Suit
    var description: String {
        var output = "\(rank.rawValue)_of_"
        output += "\(suit.rawValue)"
        return output
    }
}
