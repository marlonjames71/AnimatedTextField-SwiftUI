//
//  ContentView.swift
//  AnimatedTextField
//
//  Created by Marlon Raskin on 2023-07-02.
//

import SwiftUI

struct ContentView: View {
	
	@State private var text1 = ""
	@State private var mock1: Mock = .shopping
	
	@State private var text2 = ""
	private let mock2: Mock = .locationSearch
	
	@Environment(\.colorScheme) var colorScheme
	
    var body: some View {
		NavigationView {
			VStack(spacing: 20) {
//				HintTextField(
//					icon: Image(systemName: "magnifyingglass"),
//					text: $text1,
//					inactivePlaceholder: mock1.inactivePlaceholder,
//					activePlaceholder: mock1.activePlaceholder,
//					hints: mock1.hints
//				)
//				.padding(.vertical, 10)
//				.padding(.leading, 16)
//				.padding(.trailing, 8)
//				.background(.regularMaterial)
//				.clipShape(RoundedRectangle(cornerRadius: 12, style: .continuous))
//				.tint(.cyan)
				
				HintTextField(
					icon: Image(systemName: "magnifyingglass"),
					text: $text1,
					inactivePlaceholder: mock1.inactivePlaceholder,
					activePlaceholder: mock1.activePlaceholder,
					hints: mock1.hints
				)
				.padding(.vertical, 10)
				.padding(.horizontal, 16)
				.background(
					ZStack {
						RoundedRectangle(cornerRadius: 12)
							.fill(.orange.opacity(colorScheme == .dark ? 0.1 : 0.2))
						RoundedRectangle(cornerRadius: 12)
							.stroke(.orange, lineWidth:colorScheme == .dark ? 0.5 : 1)
					}
				)
				.clipShape(RoundedRectangle(cornerRadius: 12, style: .continuous))
				.tint(.orange)
				
				HintTextField(
					icon: Image(systemName: "building.2"),
					text: $text2,
					inactivePlaceholder: mock2.inactivePlaceholder,
					activePlaceholder: mock2.activePlaceholder,
					hints: mock2.hints
				)
				.padding(.vertical, 12)
				.overlay(alignment: .bottom) {
					Rectangle()
						.fill(.primary.opacity(0.4))
						.frame(height: 1)
				}
				.padding(.horizontal, 16)
				.tint(.orange)
				
				Spacer()
			}
			.padding()
			.background(background)
			.navigationTitle("Discover")
		}
    }
	
	@ViewBuilder
	private var background: some View {
//		LinearGradient(
//			colors: [.indigo, .teal, .cyan, .blue],
//			startPoint: .top,
//			endPoint: .bottom
//		)
		Color(uiColor: .secondarySystemBackground)
		.ignoresSafeArea()
		.ignoresSafeArea(.keyboard, edges: .bottom)
	}
}

#Preview {
    ContentView()
}
