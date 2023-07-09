//
//  ContentView.swift
//  AnimatedTextField
//
//  Created by Marlon Raskin on 2023-07-02.
//

import SwiftUI

struct ContentView: View {
	
	@State private var text1 = ""
	private var mock1: Mock = .shopping
	
    var body: some View {
		NavigationView {
			VStack(spacing: 20) {
				HintsTextField(
					icon: Image(systemName: "magnifyingglass"),
					text: $text1,
					inactivePlaceholder: mock1.inactivePlaceholder,
					activePlaceholder: mock1.activePlaceholder,
					hints: mock1.hints
				)
				.padding(.vertical, 10)
				.padding(.leading, 16)
				.padding(.trailing, 12)
				.background(.regularMaterial)
				.clipShape(RoundedRectangle(cornerRadius: 12, style: .continuous))
				.tint(.cyan)
				
				Spacer()
			}
			.padding()
			.background(background)
			.navigationTitle("Discover")
		}
    }
	
	@ViewBuilder
	private var background: some View {
		LinearGradient(
			colors: [.indigo, .teal, .cyan, .blue],
			startPoint: .top,
			endPoint: .bottom
		)
		.ignoresSafeArea()
	}
}

#Preview {
    ContentView()
}
