//
//  MockHintData.swift
//  AnimatedTextField
//
//  Created by Marlon Raskin on 2023-07-02.
//

import Foundation

// MARK: - Hints

enum MockHints {
	static let shopping = [
		"watercolor",
		"home spa",
		"jazz guitar",
		"tie dye",
		"edc",
		"running shoes",
		"water bottle"
	]
	
	static let locations: [String] = [
		"3rd st promenade",
		"Los Angeles",
		"1234 Highland Ave",
		"LAX",
		"Crypto.com Arena"
	]
	
	static let numbers: [String] = (0...4).map(String.init(describing:))
}

// MARK: - Mocks

struct Mock {
	let title: String
	let activePlaceholder: String
	let inactivePlaceholder: String
	let hints: [String]
}

extension Mock {
	static let shopping: Self = .init(
		title: "Search for Products",
		activePlaceholder: "Search",
		inactivePlaceholder: "Search",
		hints: MockHints.shopping
	)
}

extension Mock {
	static let locationSearch: Self = .init(
		title: "Place of Interest",
		activePlaceholder: "Ex:",
		inactivePlaceholder: "Ex: 123 Clark St",
		hints: MockHints.locations
	)
}

extension Mock {
	static let numbers: Self = .init(
		title: "Index",
		activePlaceholder: "Index:",
		inactivePlaceholder: "Index",
		hints: MockHints.numbers
	)
}
