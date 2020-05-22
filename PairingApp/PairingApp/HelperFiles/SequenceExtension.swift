//
//  SequenceExtension.swift
//  PairingApp
//
//  Created by Bethany Morris on 5/22/20.
//  Copyright © 2020 Bethany M. All rights reserved.
//

import Foundation

extension Sequence {
    
    func group(by groupSize: Int) -> [[Element]] {
        let slices : [[Element]] = self.reduce(into:[]) {
            memo, cur in
            if memo.count == 0 {
                return memo.append([cur])
            }
            if memo.last!.count < groupSize {
                memo.append(memo.removeLast() + [cur])
            } else {
                memo.append([cur])
            }
        }
        return slices
    }
    
} //End
