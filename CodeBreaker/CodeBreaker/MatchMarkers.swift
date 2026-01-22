//
//  MatchMarkers.swift
//  CodeBreaker
//
//  Created by Gleb on 11.01.2026.
//

import SwiftUI

enum Match {
    case nomatch
    case exact
    case inexact
}

struct MatchMarkers: View {
    // MARK: Data In
    let matches: [Match]
    
    // MARK: - Body
    var body: some View {
        HStack {
            VStack {
                matchMarker(peg: 0)
                matchMarker(peg: 1)
            }
            VStack {
                matchMarker(peg: 2)
                matchMarker(peg: 3)
            }
        }
    }
    
    func matchMarker(peg: Int) -> some View {
        let exactCount = matches.count { $0 == .exact }
        let foundCount = matches.count { $0 != .nomatch }
        
        return Circle()
            .fill(exactCount > peg ? Color.primary : Color.clear)
            .strokeBorder(foundCount > peg ? Color.primary : Color.clear, lineWidth: 1)
            .aspectRatio(1, contentMode: .fit)
    }
}

#Preview {
    ScrollView {
        //    MatchMarkers(matches: [.exact, .inexact, .nomatch])
        MatchMarkers(matches: [.exact, .exact,.inexact,.inexact,])
    }
}
