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
    var matches: [Match]
    
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
        let foundCount = matches.count { $0 == .exact }
        let totalMatches = exactCount + foundCount
        
        return Circle()
            .fill(exactCount > peg ? Color.primary : Color.clear)
            .strokeBorder(totalMatches > peg ? Color.primary : Color.clear, lineWidth: 1)
            .aspectRatio(1, contentMode: .fit)
    }
}

#Preview {
    MatchMarkers(matches: [.exact, .inexact, .nomatch])
}
