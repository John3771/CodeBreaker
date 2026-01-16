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
    
    private var sortedMatches: [Match] {
        matches.sorted { match1, match2 in
            switch (match1, match2) {
            case (.exact, _): return true
            case (_, .exact): return false
            case (.inexact, _): return true
            case (_, .inexact): return false
            default: return false
            }
        }
    }
    
    var body: some View {
        let columnCount = (matches.count + 1) / 2
        HStack(spacing: 4) {
            ForEach(0..<columnCount, id: \.self) { columnIndex in
                VStack(spacing: 4) {
                    ForEach(0..<2, id: \.self) { rowIndex in
                        let index = columnIndex * 2 + rowIndex
                        if index < sortedMatches.count {
                            matchMarker(for: sortedMatches[index])
                        } else {
                            Color.clear
                                .aspectRatio(1, contentMode: .fit)
                        }
                    }
                }
            }
        }
    }
    
    func matchMarker(for match: Match) -> some View {
        Group {
            switch match {
            case .exact:
                Circle()
                    .fill(Color.primary)
            case .inexact:
                Circle()
                    .fill(Color.clear)
                    .strokeBorder(Color.primary, lineWidth: 1)
            case .nomatch:
                Color.clear
                    .aspectRatio(1, contentMode: .fit)
            }
        }
        .aspectRatio(1, contentMode: .fit)
    }
}

#Preview {
    MatchMarkers(matches: [.exact, .inexact, .nomatch])
}
