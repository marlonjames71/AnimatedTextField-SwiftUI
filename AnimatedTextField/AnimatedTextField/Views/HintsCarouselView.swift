//
//  HintsCarouselView.swift
//  AnimatedTextField
//
//  Created by Marlon Raskin on 2023-07-02.
//

import SwiftUI

struct HintsCarouselView: View {
	
	private let placeholder: String?
	private let hints: [String]
	
	@State private var currentIndex: Int
	@State private var id: Bool = false
	
	private let hintsCount: Int
	
	private let timer = Timer.publish(every: 2.5, on: .main, in: .common).autoconnect()
	
	enum StartIndex {
		case random
		case first
	}
	
	
	// MARK: - Init
	
	init(placeholder: String?, hints: [String], startIndex: StartIndex) {
		self.placeholder = placeholder
		self.hints = hints
		
		hintsCount = hints.count
		
		switch startIndex {
		case .random:
			_currentIndex = State(initialValue: Int.random(in: 0..<hintsCount))
		case .first:
			_currentIndex = State(initialValue: 0)
		}
	}
	
	// MARK: - Body
	
    var body: some View {
		HStack(spacing: 10) {
			if let placeholder {
				Text(placeholder)
			}
			
			Text(hints[currentIndex].quoted())
				.transition(textTransition)
				.id(id)
			
			Spacer()
		}
		.foregroundStyle(.secondary)
		.onReceive(timer) { _ in
			withAnimation(.bouncy) { updateCurrentIndex() }
		}
    }
	
	// MARK: - Helpers
	
	private func updateCurrentIndex() {
		currentIndex = (currentIndex + 1) % hintsCount
		id.toggle()
	}
	
	private var textTransition: AnyTransition {
		.asymmetric(
			insertion: .move(edge: .bottom).combined(with: .opacity),
			removal: .move(edge: .top).combined(with: .opacity)
		)
	}
}

// MARK: - Preview -

#Preview {
	VStack {
		HintsCarouselView(
			placeholder: "Search",
			hints: MockHints.shopping,
			startIndex: .first
		)
	}
}
