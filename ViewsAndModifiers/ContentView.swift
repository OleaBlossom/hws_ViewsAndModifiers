//
//  ContentView.swift
//  ViewsAndModifiers
//
//  Created by Olea Blossom on 12.07.22.
//

import SwiftUI

struct ContentView: View {
	var body: some View {
		VStack {
			Spacer()
			Text("Grid Stack Title")
				.titleStyleBlueText()
			Spacer()
			GridStack(rows: 4, columns: 4) { row, col in
				HStack {
					Image(systemName: "\(row * 4 + col).circle")
					Text("R\(row) C\(col)")
				}
			}
			Spacer()
		}
	}
}

@ViewBuilder var spells: some View {
	Text("CopyPasto")
	Text("Dleicioso")
	Text("Floralorial")
	Text("Herbio")
	Text("Homewardial")
	Text("Repario")
}

struct ContentView_Previews: PreviewProvider {
	static var previews: some View {
		ContentView()
			.previewInterfaceOrientation(.landscapeRight)
	}
}

struct CapsuleText: View {
	var text: String
	
	var body: some View {
		Text(text)
			.font(.largeTitle)
			.padding()
			.background(.blue)
			.clipShape(Capsule())
	}
}

struct Watermark: ViewModifier {
	var text: String
	
	func body(content: Content) -> some View {
		ZStack(alignment: .bottomTrailing) {
			content
			Text(text)
				.font(.caption)
				.foregroundColor(.white)
				.padding(5)
				.background(.black)
		}
	}
}

extension View {
	func watermarked(with text: String) -> some View {
		modifier(Watermark(text: text))
	}
}


struct TitlePinkBackground: ViewModifier {
	func body(content: Content) -> some View {
		content
			.font(.largeTitle)
			.foregroundColor(.white)
			.padding()
			.background(.pink)
			.clipShape(RoundedRectangle(cornerRadius: 10))
	}
}

extension View {
	func titleStylePinkBackground() -> some View {
		modifier(TitlePinkBackground())
	}
}


struct TitleBlueText: ViewModifier {
	func body(content: Content) -> some View {
		content
			.font(.largeTitle)
			.foregroundColor(.blue)
	}
}

extension View {
	func titleStyleBlueText() -> some View {
		modifier(TitleBlueText())
	}
}

struct GridStack<Content: View>: View {
	let rows: Int
	let columns: Int
	let content: (Int, Int) -> Content
	
	var body: some View {
		HStack {
			ForEach(0..<columns, id: \.self) { column in
				VStack {
					ForEach(0..<rows, id: \.self) { row in
						content(row, column)
					}
				}
			}
		}
	}
}
