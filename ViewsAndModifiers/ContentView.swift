//
//  ContentView.swift
//  ViewsAndModifiers
//
//  Created by Olea Blossom on 12.07.22.
//

import SwiftUI

struct ContentView: View {
	var body: some View {
		Color.blue
			.frame(width: 300, height: 200)
			.watermarked(with: "Hacking with Swift")
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

struct Title: ViewModifier {
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
	func titleStyle() -> some View {
		modifier(Title())
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
