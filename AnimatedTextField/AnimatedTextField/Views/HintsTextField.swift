//
//  HintsTextField.swift
//  AnimatedTextField
//
//  Created by Marlon Raskin on 2023-07-02.
//

import SwiftUI

struct HintsTextField: View {
	
	let icon: Image?
	@Binding var text: String
	let inactivePlaceholder: String
	let activePlaceholder: String
	let hints: [String]
	let startIndex: HintsCarouselView.StartIndex
	
	let onEditingChanged: ((Bool) -> Void)?
	
	@State private var showingCarousel = false
	@State private var isEditing = false
	
	// MARK: - Init
	
	init(
		icon: Image?,
		text: Binding<String>,
		inactivePlaceholder: String,
		activePlaceholder: String,
		hints: [String],
		startIndex: HintsCarouselView.StartIndex = .first,
		onEditingChanged: ((Bool) -> Void)? = nil
	) {
		self.icon = icon
		self._text = text
		self.inactivePlaceholder = inactivePlaceholder
		self.activePlaceholder = activePlaceholder
		self.hints = hints
		self.startIndex = startIndex
		self.onEditingChanged = onEditingChanged
	}
	
	// MARK: - Body
	
    var body: some View {
		HStack {
			if let icon {
				icon
					.foregroundStyle(.secondary)
					.opacity(isEditing ? 1 : 0.6)
					.scaleEffect(isEditing ? 1 : 0.9)
			}
			
			ZStack {
				if showingCarousel {
					HintsCarouselView(
						placeholder: activePlaceholder,
						hints: hints,
						startIndex: startIndex
					)
				}
				
				TextField(placeholder, text: $text.animation(springAnimation)) { isEditing in
					showingCarousel = isEditing && text.isEmpty
					withAnimation(.bouncy) {
						self.isEditing = isEditing
					}
					
					onEditingChanged?(isEditing)
				}
				.textInputAutocapitalization(.never)
				.onChange(of: text) { _, newValue in
					showingCarousel = newValue.isEmpty && isEditing
				}
			}
			
			Spacer()
			
			if showClearButton {
				Button(action: clearText) {
					Image(systemName: "xmark.circle.fill")
						.foregroundStyle(.secondary)
						.tint(.secondary)
				}
				.frame(width: 22, height: 22)
				.transition(buttonTransition)
			}
		}
    }
	
	// MARK: - Helpers
	
	private var placeholder: String {
		isEditing ? "" : inactivePlaceholder
	}
	
	private func clearText() {
		withAnimation(springAnimation) { text = "" }
	}
	
	private var buttonTransition: AnyTransition {
		.move(edge: .trailing)
		.combined(with: .opacity)
		.combined(with: .scale(scale: 0.6, anchor: .trailing))
	}
	
	private var springAnimation: Animation {
		.bouncy
		.delay(0.15)
	}
	
	private var showClearButton: Bool {
		!text.isEmpty && isEditing
	}
}

// MARK: - Preview -

#Preview {
	HintTextFieldPreview()
}

struct HintTextFieldPreview: View {
	@State private var text1 = ""
	private let mock1: Mock = .shopping
	
	var body: some View {
		HintsTextField(
			icon: .init(systemName: "magnifyingglass"),
			text: $text1,
			inactivePlaceholder: mock1.inactivePlaceholder,
			activePlaceholder: mock1.activePlaceholder,
			hints: mock1.hints
		)
		.padding()
	}
}
